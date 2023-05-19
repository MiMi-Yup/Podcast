import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'background_music_state.dart';

@injectable
class BackgroundMusicCubit extends Cubit<BackgroundMusicState> {
  final UnitOfWork unitOfWork;
  BackgroundMusicCubit({required this.unitOfWork})
      : super(BackgroundMusicStateInitial(currentIndex: 0));
}
