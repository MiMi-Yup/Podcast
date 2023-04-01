part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState extends Equatable {}

class Initial extends HomePageState {
  @override
  List<Object> get props => [];
}

class GetCurrentLocation extends HomePageState{
  final LocationData? location;
  GetCurrentLocation({required this.location});
  @override
  List<Object?> get props => [];
}

class GetStream extends HomePageState{
  final Stream<LocationData>? locationStream;
  GetStream({required this.locationStream});
  @override
  List<Object?> get props => [];
}