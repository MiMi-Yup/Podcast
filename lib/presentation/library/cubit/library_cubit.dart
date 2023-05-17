import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'library_state.dart';

@injectable
class LibraryCubit extends Cubit<LibraryState> {
  final UnitOfWork unitOfWork;
  LibraryCubit({required this.unitOfWork})
      : super(LibraryStateInitial(currentIndex: 0));
}
