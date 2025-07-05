import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MayaDateText extends StatelessWidget {
  const MayaDateText({required this.date, this.color, super.key});

  final String date;
  final Color? color;

  @override
  Widget build(final BuildContext context) {
    final dateTime = DateTime.tryParse(date);

    if (dateTime == null) {
      return Text(
        'Invalid date',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      );
    }

    final formattedDate = DateFormat('MM/dd/yyyy').format(dateTime);

    return Text(formattedDate, style: TextStyle(color: color));
  }
}
