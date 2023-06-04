import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'playlist_state.dart';

@injectable
class PlaylistCubit extends Cubit<PlaylistState> {
  final UnitOfWork unitOfWork;
  PlaylistCubit({required this.unitOfWork})
      : super(PlaylistStateInitial(currentIndex: 0));
}