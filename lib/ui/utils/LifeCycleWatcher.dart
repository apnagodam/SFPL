import 'package:flutter/cupertino.dart';

class LifecycleWatcher extends StatefulWidget {
  final Widget child;
  final VoidCallback onResume;

  const LifecycleWatcher({super.key, required this.child, required this.onResume});

  @override
  State<LifecycleWatcher> createState() => _LifecycleWatcherState();
}

class _LifecycleWatcherState extends State<LifecycleWatcher> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      widget.onResume();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}