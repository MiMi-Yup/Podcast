import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final UnitOfWork unitOfWork;
  HomeCubit({required this.unitOfWork})
      : super(HomeStateInitial(currentIndex: 0));

  String? get userName => unitOfWork.session.user?.name;
  String? get email => unitOfWork.session.user?.email;
  String? get avatar => unitOfWork.session.user?.avatar;
}
