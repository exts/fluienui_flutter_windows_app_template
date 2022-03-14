import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_fluentui_windows_app_template/widgets/window_buttons.dart';

class AppNavPane extends StatefulWidget {
  final List<Widget> pages;

  const AppNavPane({Key? key, this.pages = const []}) : super(key: key);

  @override
  State<AppNavPane> createState() => _AppNavPaneState();
}

class _AppNavPaneState extends State<AppNavPane> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
      pane: NavigationPane(
        size: const NavigationPaneSize(
          openMinWidth: 250,
          openMaxWidth: 280,
        ),
        selected: index,
        onChanged: (i) => setState(() => index = i),
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.checkbox_composite),
            title: const Text('Inputs'),
          ),
          PaneItem(
            icon: const Icon(FluentIcons.text_field),
            title: const Text('Forms'),
          ),
        ],
      ),
      content: NavigationBody(
        index: index,
        children: widget.pages
            .map((widget) => NavigationItem(child: widget))
            .toList(),
      ),
    );
  }
}

class NavigationItem extends StatelessWidget {
  final Widget child;
  const NavigationItem({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const WindowButtons(),
        Expanded(child: child),
      ],
    );
  }
}
