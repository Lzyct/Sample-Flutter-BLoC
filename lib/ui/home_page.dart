import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samplewithbloc/ui/prayer_time/prayer_time_bloc.dart';

///*********************************************
/// Created by ukietux on 10/05/20 with ♥
/// (>’_’)> email : ukie.tux@gmail.com
/// github : https://www.github.com/ukieTux <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample With BLoC"),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<PrayerTimeBloc, PrayerTimeState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return Center(
                  child: Text("Loading ...", style: TextStyle(fontSize: 20)),
                );
              } else if (state is PrayerTimeError) {
                return Center(
                  child:
                      Text(state.errorMessage, style: TextStyle(fontSize: 20)),
                );
              } else if (state is PrayerTimeLoaded) {
                return Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Waktu Buka Puasa",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        state.responsePrayerTime1.jadwal.data.maghrib,
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        state.responsePrayerTime2.jadwal.data.isya,
                        style: TextStyle(
                            fontSize: 60, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                );
              } else
                return Container();
            },
          ),
          FlatButton(
            onPressed: () {
              //call getPrayerTime
              BlocProvider.of<PrayerTimeBloc>(context)
                  .add(GetPrayerTime(cityCode: "930", date: "2020-05-10"));
            },
            color: Colors.blue,
            child: Text(
              "Cek Waktu Shalat",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
}
