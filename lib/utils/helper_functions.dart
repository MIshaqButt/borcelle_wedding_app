

import 'dart:io';

import 'package:borcelle_wedding_app/utils/app_alerts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void hideKeyBoard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

Future<bool> isInternetAvailable() async {
  try {
    final result = await InternetAddress.lookup('www.google.com');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    AppAlerts.showErrorSnackBar("Check Your Internet Connection");
    return false;
  }
}

String getFormattedDate(DateTime date) => DateFormat('dd/MM/yyyy').format(date);

bool isSameDay(DateTime date1, DateTime date2) {
  return date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day;
}

String formatDate(DateTime date) {
  String day = date.day.toString();
  String month = date.month.toString();
  String year = date.year.toString();
  return '$day/$month/$year';
}

String formatWithDayDate(DateTime date) {
  return DateFormat('d MMMM y').format(date); // e.g., 25 November 2025
}

String changeDateFormat(String date) {
  List<String> parts = date.split("/");
  String day = parts[0].length == 1 ? "0${parts[0]}" : parts[0];
  String month = parts[1].length == 1 ? "0${parts[1]}" : parts[1];
  return "${parts[2]}-$month-$day";
}