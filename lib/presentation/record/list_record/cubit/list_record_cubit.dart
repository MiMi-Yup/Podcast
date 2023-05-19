import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'list_record_state.dart';

@injectable
class ListRecordCubit extends Cubit<ListRecordState> {
  final UnitOfWork unitOfWork;
  ListRecordCubit({required this.unitOfWork})
      : super(ListRecordStateInitial(currentIndex: 0));
}
