part of 'prayer_time_bloc.dart';

@immutable
abstract class PrayerTimeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetPrayerTime extends PrayerTimeEvent {
  final String cityCode;
  final String date;

  GetPrayerTime({@required this.cityCode, @required this.date});

  @override
  List<Object> get props => [cityCode, date];
}
