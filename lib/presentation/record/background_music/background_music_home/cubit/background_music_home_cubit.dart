import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'background_music_home_state.dart';

@injectable
class BackgroundMusicHomeCubit extends Cubit<BackgroundMusicHomeState> {
  final UnitOfWork unitOfWork;
  BackgroundMusicHomeCubit({required this.unitOfWork})
      : super(BackgroundMusicHomeStateInitial(currentIndex: 0));
}
