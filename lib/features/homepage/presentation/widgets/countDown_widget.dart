import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../../../injection_container.dart';
import '../bloc/countdown_bloc.dart';

class CountdownTimerPage extends StatelessWidget {
  const CountdownTimerPage({super.key});
  static DateTime _nextInstanceOfWeekdayAndTime(
      final DayOfWeek weekday, final TimeOfDay time,) {
    final DateTime now = DateTime.now();
    final int daysToAdd = (weekday.index - now.weekday + 7) % 7;
    final DateTime nextWeekday =
        DateTime(now.year, now.month, now.day).add(Duration(days: daysToAdd));
    DateTime nextInstance = DateTime(nextWeekday.year, nextWeekday.month,
        nextWeekday.day, time.hour, time.minute,);

    if (nextInstance.isBefore(now)) {
      nextInstance = nextInstance.add(const Duration(days: 7));
    }

    return nextInstance;
  }

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<CountdownBloc>(
      create: (final context) => sl()
        ..add(StartCountdown(_nextInstanceOfWeekdayAndTime(
            DayOfWeek.monday, const TimeOfDay(hour: 12, minute: 0),),),),
      child: BlocBuilder<CountdownBloc, CountdownState>(
        builder: (final context, final state) {
          final int days = state.remainingTime.inDays;
          final int hours = state.remainingTime.inHours % 24;
          final int minutes = state.remainingTime.inMinutes % 60;
          final int seconds = state.remainingTime.inSeconds % 60;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'HURRY UP!',
                style: textStyleInterExtraBold24,
              ),
              const SizedBox(height: 8),
              Text(
                'Offer Ends In:',
                style: textStyleInterExtraLight18,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildTimeCard(context, days, 'DAYS'),
                  const SizedBox(width: 8),
                  _buildTimeCard(context, hours, 'HOURS'),
                  const SizedBox(width: 8),
                  _buildTimeCard(context, minutes, 'MINS'),
                  const SizedBox(width: 8),
                  _buildTimeCard(context, seconds, 'SECS'),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTimeCard(
      final BuildContext context, final int time, final String label,) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: const BorderRadius.all(Radius.circular(100)),
          ),
          child: Text(
            time.toString().padLeft(2, '0'),
            style: Theme.of(context).brightness == Brightness.light
                ? textStyleInterExtraBold24
                : GoogleFonts.inter(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: textStyleInterBold16,
        ),
      ],
    );
  }
}

enum DayOfWeek {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday
}

extension DayOfWeekExtension on DayOfWeek {
  int get index {
    switch (this) {
      case DayOfWeek.monday:
        return DateTime.monday;
      case DayOfWeek.tuesday:
        return DateTime.tuesday;
      case DayOfWeek.wednesday:
        return DateTime.wednesday;
      case DayOfWeek.thursday:
        return DateTime.thursday;
      case DayOfWeek.friday:
        return DateTime.friday;
      case DayOfWeek.saturday:
        return DateTime.saturday;
      case DayOfWeek.sunday:
        return DateTime.sunday;
    }
  }
}
