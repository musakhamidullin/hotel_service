import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'app/app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final directory = await getTemporaryDirectory();
  HydratedBloc.storage =
      await HydratedStorage.build(storageDirectory: directory);
  runApp(const MyApp());
}
