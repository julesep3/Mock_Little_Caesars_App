import 'package:creative_work_assignment2/model/userreccord.dart';
import 'package:creative_work_assignment2/viewscreen/about_screen.dart';
import 'package:creative_work_assignment2/viewscreen/addCreditCard_screen.dart';
import 'package:creative_work_assignment2/viewscreen/changePassword_screen.dart';
import 'package:creative_work_assignment2/viewscreen/createAccount_screen.dart';
import 'package:creative_work_assignment2/viewscreen/editAccount_screen.dart';
import 'package:creative_work_assignment2/viewscreen/error_screen.dart';
import 'package:creative_work_assignment2/viewscreen/legal_screen.dart';
import 'package:creative_work_assignment2/viewscreen/loggedInMain_screen.dart';
import 'package:creative_work_assignment2/viewscreen/login_screen.dart';
import 'package:creative_work_assignment2/viewscreen/main_screen.dart';
import 'package:creative_work_assignment2/viewscreen/myaccount_screen.dart';
import 'package:creative_work_assignment2/viewscreen/paymentMethods_screen.dart';
import 'package:creative_work_assignment2/viewscreen/start_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CreativeWorkAssignment2App());
}

class CreativeWorkAssignment2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // remove debug banner
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Color.fromRGBO(255, 100, 27, 1),
          elevation: 0.0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'KohSantepheap',
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17.5,
            color: Colors.black,
          ),
          headline3: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          headline6: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      initialRoute: StartScreen.routeName,
      routes: {
        StartScreen.routeName: (context) => StartScreen(),
        MainScreen.routeName: (context) => MainScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        CreateAccountScreen.routeName: (context) => CreateAccountScreen(),
        LoggedInMainScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null)
            return LoggedInMainScreen(args as UserRecord);
          else
            return ErrorScreen('argument is null at UserHomeScreen');
        },
        AboutScreen.routeName: (context) => AboutScreen(),
        LegalScreen.routeName: (context) => LegalScreen(),
        MyAccountScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null)
            return MyAccountScreen(args as UserRecord);
          else
            return ErrorScreen('argument is null at MyAccountScreen');
        },
        EditAccountScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null)
            return EditAccountScreen(args as UserRecord);
          else
            return ErrorScreen('argument is null at EditAccountScreen');
        },
        ChangePasswordScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null)
            return ChangePasswordScreen(args as UserRecord);
          else
            return ErrorScreen('argument is null at ChangePasswordScreen');
        },
        PaymentMethodsScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null)
            return PaymentMethodsScreen(args as UserRecord);
          else
            return ErrorScreen('argument is null at PaymentMethodsScreen');
        },
        AddCreditCardScreen.routeName: (context) {
          Object? args = ModalRoute.of(context)?.settings.arguments;
          if (args != null)
            return AddCreditCardScreen(args as UserRecord);
          else
            return ErrorScreen('argument is null at AddCreditCardScreen');
        },
      },
    );
  }
}
