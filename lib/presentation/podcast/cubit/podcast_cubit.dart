import 'package:configuration/style/style.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/domain/use_cases/podcast_page_usecase.dart';
import 'package:join_podcast/presentation/podcast/ui/widgets/speed_bottom_modal_sheet.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../ui/widgets/seekbar.dart';

part 'podcast_state.dart';

@injectable
class PodcastCubit extends Cubit<PodcastState> {
  final PodcastUseCases? podcastUseCases;
  PodcastCubit({required this.podcastUseCases}) : super(PodcastState.initial()) {
    state.audioPlayer.setUrl(state.url);
    updateSelectedSpeed(1);
    state.audioPlayer.play();
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

// Hiển thị lời nhắc nhở
  Future<DateTime?> pickDateTime(
      BuildContext context, DateTime? selectedDateTime) async {
    DateTime? date = await pickDate(context, state.selectedTime);
    // ignore: use_build_context_synchronously
    TimeOfDay? time = await pickTime(context, state.selectedTime);
    if (date != null || time != null) return null;

    return DateTime(date!.year, date.month, date.day, time!.hour, time.minute);
  }

  Future<DateTime?> pickDate(
          BuildContext context, DateTime? selectedDateTime) =>
      showDatePicker(
          context: context,
          initialDate: selectedDateTime!,
          firstDate: DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, DateTime.now().hour, DateTime.now().minute),
          lastDate: DateTime(DateTime.now().year + 100));
  Future<TimeOfDay?> pickTime(
          BuildContext context, DateTime? selectedDateTime) =>
      showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: selectedDateTime!.hour, minute: selectedDateTime.minute),
      );
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
                    'Nhắc tôi nghe Podcast này vào lúc:',
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
                    child: Text(
                        '${selectedDateTime!.hour.toString().padLeft(2, '0')}:${selectedDateTime!.minute.toString().padLeft(2, '0')} - ${selectedDateTime!.day.toString().padLeft(2, '0')}/${selectedDateTime!.month.toString().padLeft(2, '0')}/${selectedDateTime!.year.toString().padLeft(4, '0')}'),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // Thực hiện logic để hiển thị thông báo tại thời gian đã chọn
                          // và xử lý xóa ngày giờ hẹn nếu cần
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
