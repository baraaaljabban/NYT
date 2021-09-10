import 'package:flutter/material.dart';
import 'package:nyt_app/app.dart';
import 'core/Service/injection_service.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}
