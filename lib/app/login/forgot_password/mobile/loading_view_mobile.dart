import 'package:flutter/material.dart';

Widget buildLoadingStateViewMobile() {
  return const Scaffold(
    backgroundColor: Colors.transparent,
    body: Center(child: CircularProgressIndicator()),
  );
}
