import 'package:creative_work_assignment2/viewscreen/about_screen.dart';
import 'package:creative_work_assignment2/viewscreen/createAccount_screen.dart';
import 'package:creative_work_assignment2/viewscreen/legal_screen.dart';
import 'package:creative_work_assignment2/viewscreen/login_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/mainScreen';
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  late _Controller con;

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  void render(fn) => setState(fn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 500.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/icon2.jpg'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                      child: Text(
                        'HI, GUEST!',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20.0),
                      title: Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      onTap: con.login,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20.0),
                      title: Text(
                        'ORDERS',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      onTap: () {
                        print('++++++++++++++++ drawer: Orders');
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20.0),
                      title: Text(
                        'FIND A STORE',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      onTap: () {
                        print('++++++++++++++++ drawer: Find a Store');
                      },
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20.0),
                      title: Text(
                        'PREFERENCES',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      onTap: () {
                        print('++++++++++++++++ drawer: Preferences');
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(36.0, 0.0, 0.0, 0.0),
              title: Text(
                'Feedback and Help',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                print('++++++++++++++++ drawer: Feedback and Help');
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(36.0, 0.0, 0.0, 0.0),
              title: Text(
                'Jobs',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                print('++++++++++++++++ drawer: Jobs');
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(36.0, 0.0, 0.0, 0.0),
              title: Text(
                'Legal',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: con.navigateToLegalScreen,
            ),
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(36.0, 0.0, 0.0, 0.0),
              title: Text(
                'About',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: con.navigateToAboutScreen,
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color.fromRGBO(255, 100, 27, 1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'Little Caesars',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Image(
                    image: AssetImage('images/hotAndReady.gif'),
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 55.0,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    margin: EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 0.0),
                    child: ElevatedButton(
                      onPressed: con.startNewOrder,
                      child: Text(
                        'START NEW ORDER',
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 65.0,
                          child: TextButton(
                            onPressed: con.login,
                            child: Text(
                              'Login',
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 65.0,
                          child: TextButton(
                            onPressed: con.join,
                            child: Text(
                              'Join',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
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
  late _MainScreenState state;
  _Controller(this.state);

  void startNewOrder() {
    print('~~~~~~~~~~~~~~~~Start new order pressed~~~~~~~~~~~~~~~~');
  }

  void login() {
    print('~~~~~~~~~~~~~~~~Login pressed~~~~~~~~~~~~~~~~');
    Navigator.pushNamed(state.context, LoginScreen.routeName);
  }

  void join() {
    print('~~~~~~~~~~~~~~~~Join pressed~~~~~~~~~~~~~~~~');
    Navigator.pushNamed(state.context, CreateAccountScreen.routeName);
  }

  void navigateToAboutScreen() {
    Navigator.pushNamed(state.context, AboutScreen.routeName);
  }

  void navigateToLegalScreen() {
    Navigator.pushNamed(state.context, LegalScreen.routeName);
  }
}
