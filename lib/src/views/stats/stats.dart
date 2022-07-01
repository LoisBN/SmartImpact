import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:smartimpact/src/cubit/navigation_cubit.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
            child: Scaffold(
          appBar: CalendarAppBar(
              backButton: false,
              locale: "fr",
              fullCalendar: true,
              accent: Colors.grey.shade900,
              firstDate: DateTime.now().subtract(const Duration(days: 50)),
              lastDate: DateTime.now()
                  .add(const Duration(seconds: Duration.secondsPerDay * 50)),
              onDateChanged: (date) {
                print(date);
              }),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SleekCircularSlider(
                      initialValue: 80,
                      appearance: CircularSliderAppearance(
                          infoProperties: InfoProperties(
                              topLabelText: "Coups",
                              mainLabelStyle:
                                  TextStyle(color: Colors.grey.shade100),
                              modifier: (val) => "${val.ceil()} kg",
                              topLabelStyle: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600)),
                          customWidths: CustomSliderWidths(
                              progressBarWidth: 3, handlerSize: 0),
                          customColors: CustomSliderColors(
                              trackColor: Colors.grey.shade900,
                              progressBarColor: Colors.red)),
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SleekCircularSlider(
                      initialValue: 90,
                      appearance: CircularSliderAppearance(
                          size: 100,
                          infoProperties: InfoProperties(
                              topLabelText: "Réaction",
                              mainLabelStyle:
                                  TextStyle(color: Colors.grey.shade100),
                              modifier: (val) => "${val.ceil()} ms",
                              topLabelStyle: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600)),
                          customWidths: CustomSliderWidths(
                              progressBarWidth: 3, handlerSize: 0),
                          customColors: CustomSliderColors(
                              trackColor: Colors.grey.shade900,
                              progressBarColor: Colors.indigo)),
                    ),
                    SleekCircularSlider(
                      initialValue: 45,
                      appearance: CircularSliderAppearance(
                          size: 100,
                          infoProperties: InfoProperties(
                              topLabelText: "Temps",
                              mainLabelStyle:
                                  TextStyle(color: Colors.grey.shade100),
                              modifier: (val) => "${val.ceil()} min",
                              topLabelStyle: TextStyle(
                                  fontSize: 11,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600)),
                          customWidths: CustomSliderWidths(
                              progressBarWidth: 3, handlerSize: 0),
                          customColors: CustomSliderColors(
                              trackColor: Colors.grey.shade900,
                              progressBarColor: Colors.blue)),
                    ),
                    SleekCircularSlider(
                      initialValue: 70,
                      appearance: CircularSliderAppearance(
                          size: 100,
                          infoProperties: InfoProperties(
                              topLabelText: "Réussite Coups",
                              mainLabelStyle:
                                  TextStyle(color: Colors.grey.shade100),
                              modifier: (val) => "${val.ceil()} %",
                              topLabelStyle: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.w600)),
                          customWidths: CustomSliderWidths(
                              progressBarWidth: 3, handlerSize: 0),
                          customColors: CustomSliderColors(
                              trackColor: Colors.grey.shade900,
                              progressBarColor: Colors.purple)),
                    )
                  ],
                )
              ],
            ),
          ),
        ))
      ],
      onPopPage: (__, _) {
        context.read<NavigationCubit>().navigateTo(0);
        return false;
      },
    );
  }
}
