import 'package:creative_work_assignment2/model/userreccord.dart';
import 'package:creative_work_assignment2/viewscreen/changePassword_screen.dart';
import 'package:creative_work_assignment2/viewscreen/editAccount_screen.dart';
import 'package:creative_work_assignment2/viewscreen/main_screen.dart';
import 'package:creative_work_assignment2/viewscreen/paymentMethods_screen.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  static const routeName = '/myAccountScreenTemplate';
  final UserRecord userRecord;
  // constructor
  MyAccountScreen(this.userRecord);
  @override
  State<StatefulWidget> createState() {
    return _MyAccountScreenState();
  }
}

class _MyAccountScreenState extends State<MyAccountScreen> {
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
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Account',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: TextButton(
                  onPressed: con.navigateToEditAccountScreen,
                  child: Text(
                    'Profile',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              Container(
                child: TextButton(
                  onPressed: con.navigateToChangePasswordScreen,
                  child: Text(
                    'Change Password',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              Container(
                child: TextButton(
                  onPressed: con.navigateToPaymentMethodsScreen,
                  child: Text(
                    'Payment Methods',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              Container(
                child: TextButton(
                  onPressed: () => print('~~~~~~ Favorites Pressed ~~~~~~'),
                  child: Text(
                    'Favorites',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
              ),
              Divider(
                thickness: 2.0,
              ),
              SizedBox(
                height: 380.0,
              ),
              Center(
                child: TextButton(
                  onPressed: con.logOut,
                  child: Text(
                    'LOG OUT',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 100, 27, 1),
                      fontSize: 16.0,
                    ),
                  ),
                ),
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
  late _MyAccountScreenState state;
  _Controller(this.state);

  void logOut() {
    Navigator.pushNamed(state.context, MainScreen.routeName);
  }

  void navigateToEditAccountScreen() {
    Navigator.pushNamed(
      state.context,
      EditAccountScreen.routeName,
      arguments: state.widget.userRecord,
    );
  }

  void navigateToChangePasswordScreen() {
    Navigator.pushNamed(
      state.context,
      ChangePasswordScreen.routeName,
      arguments: state.widget.userRecord,
    );
  }

  void navigateToPaymentMethodsScreen() {
    Navigator.pushNamed(
      state.context,
      PaymentMethodsScreen.routeName,
      arguments: state.widget.userRecord,
    );
  }
}
