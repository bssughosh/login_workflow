import 'package:flutter/material.dart';

Widget buildErrorStateViewMobile() {
  return const Scaffold(
    body: SafeArea(
      child: Center(
        child: Text('An unexpected error has occured'),
      ),
    ),
  );
}
