import 'package:flutter/material.dart';

class ScreenTemplate extends StatefulWidget {
  static const routeName = '/screenTemplate';
  @override
  State<StatefulWidget> createState() {
    return _ScreenTemplateState();
  }
}

class _ScreenTemplateState extends State<ScreenTemplate> {
  late _Controller con;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  void render(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _Controller {
  late _ScreenTemplateState state;
  _Controller(this.state);
}
