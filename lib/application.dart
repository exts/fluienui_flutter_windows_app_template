import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_fluentui_windows_app_template/screens/fluiex1_screen.dart';
import 'package:flutter_fluentui_windows_app_template/screens/home_screen.dart';
import 'package:flutter_fluentui_windows_app_template/widgets/app_nav_pan.dart';

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'Title',
      initialRoute: '/',
      routes: {
        '/': (_) => const AppNavPane(
              pages: [
                HomeScreen(),
                FluiExamp1(),
              ],
            ),
      },
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}
