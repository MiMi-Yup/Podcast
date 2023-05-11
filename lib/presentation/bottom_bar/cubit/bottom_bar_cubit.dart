import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/presentation/home/home_page.dart';
import 'package:join_podcast/presentation/profile/profile_screen.dart';

part 'bottom_bar_state.dart';

@injectable
class BottomBarCubit extends Cubit<BottomBarState> {
  final UnitOfWork unitOfWork;
  BottomBarCubit({required this.unitOfWork})
      : super(BottomBarInitial(currentIndex: 0));

  final List<Widget> listPage = [
    const HomePage(),
    const Placeholder(),
    const Placeholder(),
    const ProfileScreen()
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
