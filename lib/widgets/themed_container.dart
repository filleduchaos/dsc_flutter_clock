import 'package:flutter/material.dart';

class ThemedContainer extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final WidgetBuilder builder;

  ThemedContainer({ this.padding, this.builder });

  @override
  State<StatefulWidget> createState() => ThemedContainerState();
}

class ThemedContainerState extends State<ThemedContainer> {
  bool _isBright;

  Color get backgroundColor => _isBright ? Color(0xffefefef) : Colors.black;

  @override
  void initState() {
    super.initState();
    _isBright = false;
  }

  _toggleBrightness() => setState(() { _isBright = !_isBright; });

  @override
  Widget build(BuildContext context) {
    var typography = Typography(platform: Theme.of(context).platform);
    var textTheme = _isBright ? typography.black : typography.white;

    return AnimatedTheme(
      data: Theme.of(context).copyWith(
        backgroundColor: backgroundColor,
        textTheme: textTheme,
      ),
      child: GestureDetector(
        onTap: _toggleBrightness,
        child: Builder(builder: widget.builder),
      ),
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOut
    );
  }
}
