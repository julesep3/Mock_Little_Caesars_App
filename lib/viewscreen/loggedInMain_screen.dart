import 'package:creative_work_assignment2/model/userreccord.dart';
import 'package:creative_work_assignment2/viewscreen/about_screen.dart';
import 'package:creative_work_assignment2/viewscreen/createAccount_screen.dart';
import 'package:creative_work_assignment2/viewscreen/legal_screen.dart';
import 'package:creative_work_assignment2/viewscreen/login_screen.dart';
import 'package:creative_work_assignment2/viewscreen/myaccount_screen.dart';
import 'package:flutter/material.dart';

class LoggedInMainScreen extends StatefulWidget {
  static const routeName = '/loggedInMainScreen';
  final UserRecord userRecord;
  // constructor
  LoggedInMainScreen(this.userRecord);
  @override
  State<StatefulWidget> createState() {
    return _LoggedInMainScreenState();
  }
}

class _LoggedInMainScreenState extends State<LoggedInMainScreen> {
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ${widget.userRecord.firstName}!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '${widget.userRecord.email}',
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 20.0),
                      title: Text(
                        'MY ACCOUNT',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      onTap: con.navigateToMyAccountScreen,
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
              contentPadding: EdgeInsets.only(left: 36.0),
              title: Text(
                'Feedback and Help',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                print('++++++++++++++++ drawer: Feedback and Help');
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 36.0),
              title: Text(
                'Jobs',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: () {
                print('++++++++++++++++ drawer: Jobs');
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 36.0),
              title: Text(
                'Legal',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: con.navigateToLegalScreen,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 36.0),
              title: Text(
                'About',
                style: Theme.of(context).textTheme.headline3,
              ),
              onTap: con.navigateToAboutScreen,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Color.fromRGBO(255, 100, 27, 1),
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 92.0,
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
                ],
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50.0,
                    margin: EdgeInsets.all(25.0),
                    child: ElevatedButton(
                      onPressed: con.startNewOrder,
                      child: Text(
                        'START NEW ORDER',
                      ),
                    ),
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
  late _LoggedInMainScreenState state;
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

  void navigateToMyAccountScreen() {
    Navigator.pushNamed(
      state.context,
      MyAccountScreen.routeName,
      arguments: state.widget.userRecord,
    );
  }
}
