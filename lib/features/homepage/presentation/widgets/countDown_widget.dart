import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/textStyle.dart';
import '../../../../injection_container.dart';
import '../bloc/countdown_bloc.dart';

class CountdownTimerPage extends StatelessWidget {

  const CountdownTimerPage({super.key, required this.targetDateTime});
  final DateTime targetDateTime;

  @override
  Widget build(final BuildContext context) {
    return BlocProvider<CountdownBloc>(
      create: (final context) => sl()..add(StartCountdown(targetDateTime)),
          child: BlocBuilder<CountdownBloc, CountdownState>(
            builder: (final context, final state) {
              final duration = state.duration;
              final days = duration.inDays;
              final hours = duration.inHours % 24;
              final minutes = duration.inMinutes % 60;
              final seconds = duration.inSeconds % 60;
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                   Text(
                    'HURRY UP!',
                    style:textStyleInterExtraBold24,
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
                      _buildTimeCard(context,days, 'DAYS'),
                      const SizedBox(width: 8),
                      _buildTimeCard(context,hours, 'HOURS'),
                      const SizedBox(width: 8),
                      _buildTimeCard(context,minutes, 'MINS'),
                      const SizedBox(width: 8),
                      _buildTimeCard(context,seconds, 'SECS'),
                    ],
                  ),
                ],
              );
            },
          ),
    );
  }

  Widget _buildTimeCard(final BuildContext context,final int time, final String label) {
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
            style: Theme.of(context).brightness==Brightness.light? textStyleInterExtraBold24: GoogleFonts.inter(
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
