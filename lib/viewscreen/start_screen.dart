import 'dart:async';

import 'package:creative_work_assignment2/viewscreen/main_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  static const routeName = '/startScreen';
  @override
  State<StatefulWidget> createState() {
    return _StartScreenState();
  }
}

class _StartScreenState extends State<StartScreen> {
  late _Controller con;

  @override
  void initState() {
    Timer(Duration(seconds: 7), () {
      Navigator.pushNamed(context, MainScreen.routeName);
    });
    super.initState();
    con = _Controller(this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(255, 100, 27, 1),
          child: Column(
            children: [
              SizedBox(
                height: 130.0,
              ),
              Text(
                'Little Caesars',
                style: Theme.of(context).textTheme.headline1,
              ),
              SizedBox(
                height: 10.0,
              ),
              Image(
                image: AssetImage('images/start.gif'),
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _Controller {
  late _StartScreenState state;
  _Controller(this.state);

  void move() {
    Navigator.pushNamed(state.context, MainScreen.routeName);
  }
}
