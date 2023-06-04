import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/session_info.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/presentation/home/home_tab/home_page.dart';
import 'package:join_podcast/presentation/library/library_page.dart';
import 'package:join_podcast/presentation/profile/profile_screen.dart';
import 'package:join_podcast/presentation/record/list_record/list_record.dart';

part 'bottom_bar_state.dart';

@injectable
class BottomBarCubit extends Cubit<BottomBarState> {
  final UnitOfWork unitOfWork;
  BottomBarCubit({required this.unitOfWork})
      : super(BottomBarInitial(currentIndex: 0));

  final List<Widget> listPage = [
    const HomePage(),
    const ListRecordPage(),
    const LibraryPage(),
    ProfileScreen(
      prefsRepo: getIt<SharedPreferencesRepository>(),
      session: getIt<SessionInfo>(),
    )
  ];

  void changePage(int i) {
    emit(BottomBarInitial(currentIndex: i));
  }

  void toggleBottomBar(bool isFullMode) {
    if (state is BottomBarInitial) {
      emit((state as BottomBarInitial).copyWith(isHidden: isFullMode));
    }
  }
}
