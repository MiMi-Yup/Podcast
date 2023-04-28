import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'subscription_state.dart';

@injectable
class SubscriptionCubit extends Cubit<SubscriptionState> {
  final UnitOfWork unitOfWork;
  SubscriptionCubit({required this.unitOfWork})
      : super(SubscriptionStateInitial(currentIndex: 0));
}
