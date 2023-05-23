import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'record_page_state.dart';

@injectable
class RecordPageCubit extends Cubit<RecordPageState> {
  final UnitOfWork unitOfWork;
  RecordPageCubit({required this.unitOfWork})
      : super(RecordPageStateInitial(currentIndex: 0));
}
