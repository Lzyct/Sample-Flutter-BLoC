part of 'prayer_time_bloc.dart';

@immutable
abstract class PrayerTimeState extends Equatable {
  const PrayerTimeState();

  @override
  List<Object> get props => [];
}
class InitialState extends PrayerTimeState{}
class LoadingState extends PrayerTimeState {}

class PrayerTimeError extends PrayerTimeState {
  final String errorMessage;
  const PrayerTimeError({@required this.errorMessage}):assert(errorMessage!=null);

  @override
  List<Object> get props => [errorMessage];
}

// ignore: must_be_immutable
class PrayerTimeLoaded extends PrayerTimeState {
  final ResponsePrayerTime responsePrayerTime1;
  final ResponsePrayerTime responsePrayerTime2;

  const PrayerTimeLoaded({@required this.responsePrayerTime1,@required this.responsePrayerTime2})
      : assert(responsePrayerTime1 != null && responsePrayerTime2 != null);

  @override
  List<Object> get props => [responsePrayerTime1,responsePrayerTime2];
}
