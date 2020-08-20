import 'package:flutter/material.dart';
import 'package:taskbook/app.dart';
import 'package:taskbook/services/service_locator.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}
