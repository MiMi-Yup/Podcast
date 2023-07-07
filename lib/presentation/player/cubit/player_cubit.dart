import 'package:configuration/style/style.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/presentation/player/ui/widgets/speed_bottom_modal_sheet.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../ui/widgets/seekbar.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:fluttertoast/fluttertoast.dart';

part 'player_state.dart';

final FlutterLocalNotificationsPlugin appLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

@injectable
class PlayerCubit extends Cubit<PlayerState> {
  final EpisodeUseCases episodeUseCases;
  final String id;

  int? notificationId;
  PlayerCubit({required this.id, required this.episodeUseCases})
      : super(PlayerState.initial()) {
    initializeCubit();
  }

  Future<void> initializeCubit() async {
    final episode = await episodeUseCases.getEpisodeById(id);
    emit(state.copyWith(episode: episode));
    state.audioPlayer.setUrl(state.episode?.href ?? '');
    updateSelectedSpeed(1);
    state.audioPlayer.play();
    // initializeNotifications();
  }

  void updateSelectedSpeed(double speed) {
    state.audioPlayer.setSpeed(speed);
    emit(state.copyWith(selectedSpeed: speed));
  }

  Stream<SeekBarData> get seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
        state.audioPlayer.positionStream,
        state.audioPlayer.durationStream,
        (Duration position, Duration? duration) {
          return SeekBarData(
            position,
            duration ?? Duration.zero,
          );
        },
      );

  // Hiển thị ModalBottomSheet điều chỉnh tốc độ
  void showPlaybackSpeedModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SpeedChange(
            speed: state.selectedSpeed,
            onSpeedChanged: updateSelectedSpeed,
          );
        });
  }

  // Hiển thị thời gian nhắc nhở nghe Episode
  Future<DateTime?> pickDateTime(
      BuildContext context, DateTime? selectedDateTime) async {
    final List<dynamic> results = await Future.wait([
      pickDate(context, selectedDateTime),
      pickTime(context, selectedDateTime),
    ]);

    DateTime? date = results[0];
    TimeOfDay? time = results[1];

    if (date != null && time != null) {
      return DateTime(date.year, date.month, date.day, time.hour, time.minute);
    }
    return null;
  }

  Future<DateTime?> pickDate(
      BuildContext context, DateTime? selectedDateTime) async {
    selectedDateTime ??= DateTime.now();

    return showDatePicker(
      context: context,
      initialDate: selectedDateTime,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 36500)),
    );
  }

  Future<TimeOfDay?> pickTime(
      BuildContext context, DateTime? selectedDateTime) async {
    selectedDateTime ??= DateTime.now();

    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedDateTime),
    );
  }

  void openReminder(BuildContext context) {
    DateTime? selectedDateTime = state.selectedTime;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Đặt lời nhắc',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Nhắc tôi nghe Episode này vào lúc:',
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                      (states) => mCGreen500,
                    )),
                    onPressed: () async {
                      DateTime? pickedDate =
                          await pickDateTime(context, state.selectedTime);
                      if (pickedDate != null) {
                        setState(() {
                          selectedDateTime = pickedDate;
                        });
                      }
                    },
                    child: Text(selectedDateTime != null
                        ? '${selectedDateTime!.hour.toString().padLeft(2, '0')}:${selectedDateTime!.minute.toString().padLeft(2, '0')} - ${selectedDateTime!.day.toString().padLeft(2, '0')}/${selectedDateTime!.month.toString().padLeft(2, '0')}/${selectedDateTime!.year.toString().padLeft(4, '0')}'
                        : 'Chọn thời gian'),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (state.selectedTime != null)
                        GestureDetector(
                          onTap: () async {
                            await appLocalNotificationsPlugin
                                .cancel(notificationId ?? 0);
                            emit(state.copyWith(selectedTime: null));
                            Navigator.pop(context);
                          },
                          child: const Text('Delete'),
                        ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          _scheduleReminder(selectedDateTime, notificationId);
                          emit(state.copyWith(selectedTime: selectedDateTime));
                          Navigator.pop(context);
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

  void initializeNotifications() async {
    // Cấu hình plugin
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    await appLocalNotificationsPlugin.initialize(initializationSettings);

    // Cấu hình múi giờ
    tz.initializeTimeZones();
  }

  Future<void> _scheduleReminder(
      DateTime? selectedDateTime, int? notificationId) async {
    if (selectedDateTime != null) {
      // Xóa thông báo cũ nếu tồn tại
      await appLocalNotificationsPlugin.cancel(notificationId ?? 0);

      // Lập lịch thông báo mới
      AndroidNotificationDetails androidPlatformChannelSpecifics =
          const AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        importance: Importance.high,
        priority: Priority.high,
      );
      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      final scheduledTime = tz.TZDateTime.from(selectedDateTime, tz.local);

      await appLocalNotificationsPlugin.zonedSchedule(
        notificationId ?? 0,
        'Giờ điểm đã đến',
        'Hãy cùng nghe Episode như đã hẹn nào!',
        scheduledTime,
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      Fluttertoast.showToast(
        msg: 'Đã thêm thông báo thành công',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
      );
      notificationId = notificationId ?? 0 + 1;
    }
  }

// Tua sau 10s
  void skipForward() {
    state.audioPlayer
        .seek(state.audioPlayer.position + const Duration(seconds: 10));
  }

  void skipBackward() {
    state.audioPlayer.seek(
        state.audioPlayer.position > const Duration(seconds: 10)
            ? state.audioPlayer.position - const Duration(seconds: 10)
            : Duration.zero);
  }

  @override
  Future<void> close() {
    state.audioPlayer.dispose();
    return super.close();
  }
}
