import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:samplewithbloc/response/ResponsePrayerTime.dart';

part 'prayer_time_event.dart';

part 'prayer_time_state.dart';

class PrayerTimeBloc extends Bloc<PrayerTimeEvent, PrayerTimeState> {
  @override
  PrayerTimeState get initialState => InitialState();

  @override
  Stream<PrayerTimeState> mapEventToState(PrayerTimeEvent event) async* {
    if (event is GetPrayerTime) {
      try {
        yield LoadingState();

        Response response1 = await Dio().get(
            "https://api.banghasan.com/sholat/format/json/jadwal/kota/${event.cityCode}/tanggal/${event.date}");
        ResponsePrayerTime _responsePrayerTime1 =
            ResponsePrayerTime.fromJson(response1.data);

        print("response 1 :$response1");

        Response response2 = await Dio().get(
            "https://api.banghasan.com/sholat/format/json/jadwal/kota/${event.cityCode}/tanggal/${event.date}");
        ResponsePrayerTime _responsePrayerTime2 =
            ResponsePrayerTime.fromJson(response2.data);
        print("response 2 :$response2");
//        print(response);
//
//        if (_responsePrayerTime.status == "error")
//          throw Exception(response.data["pesan"][1]);

        yield PrayerTimeLoaded(
            responsePrayerTime1: _responsePrayerTime1,
            responsePrayerTime2: _responsePrayerTime2);
      } catch (e) {
        yield PrayerTimeError(errorMessage: e.toString());
      }
    }
  }
}
