import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pegi/ui/utils/Dimensiones.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final today = DateTime.now();
  final yesterday = DateTime.now().subtract(const Duration(days: 1));
  final tomorrow = DateTime.now().add(const Duration(days: 1));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _date(
              false, yesterday, const Color.fromRGBO(65, 65, 65, 1), 0, 30, 16),
          _date(true, today, Colors.white, 15, 42, 20),
          _date(
              false, tomorrow, const Color.fromRGBO(65, 65, 65, 1), 0, 30, 16),
        ],
      ),
    );
  }
}

Widget _date(bool isDate, DateTime day, Color color, double sizeDate,
    double sizeDay, double sizeWeek) {
  return Column(
    children: [
      if (isDate)
        Padding(
          padding: EdgeInsets.only(bottom: Dimensiones.screenHeight * 0.00012),
          child: Text(
            DateFormat.yMMM(Intl.defaultLocale).format(day).toString(),
            style: GoogleFonts.montserrat(
                color: color, fontSize: sizeDate, fontWeight: FontWeight.w600),
          ),
        ),
      Text(
        DateFormat.d(Intl.defaultLocale).format(day).toString(),
        style: GoogleFonts.montserrat(
            color: color, fontSize: sizeDay, fontWeight: FontWeight.w600),
      ),
      SizedBox(height: Dimensiones.screenHeight * 0.001),
      Text(DateFormat.E(Intl.defaultLocale).format(day).toString(),
          style: GoogleFonts.montserrat(
              color: color, fontSize: sizeWeek, fontWeight: FontWeight.w300)),
    ],
  );
}
