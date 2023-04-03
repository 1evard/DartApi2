import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desktop_window/desktop_window.dart';

import 'cubit/notes_cubit.dart';
import 'pages/notes_page.dart';
import '../screens/signIn_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setMaxWindowSize(const Size(600, 500));
    await DesktopWindow.setMinWindowSize(const Size(600, 500));
    await DesktopWindow.setWindowSize(const Size(600, 500));
  }
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NotesCubit(), child: const HistoryPage())],
      child: const MaterialApp(home: SignInScreen(), debugShowCheckedModeBanner: false),
    );
  }
}
