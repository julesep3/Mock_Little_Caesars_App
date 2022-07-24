import 'package:creative_work_assignment2/model/userreccord.dart';
import 'package:creative_work_assignment2/viewscreen/createAccount_screen.dart';
import 'package:creative_work_assignment2/viewscreen/loggedInMain_screen.dart';
import 'package:creative_work_assignment2/viewscreen/view/myutil.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/loginScreen';
  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  late _Controller con;

  // for Form widget (unique key for each Form widget)
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          'Login',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 90.0,
            ),
            // Form is kept separate from 'forget password' and 'create new account' in column
            Form(
              key: formKey,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 350.0,
                      margin: EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '   Email Address',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        validator: con.validateEmail,
                        onSaved: con.saveEmail,
                      ),
                    ),
                    Container(
                      width: 350.0,
                      margin: EdgeInsets.all(10.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '   Password',
                          suffixIcon: Icon(Icons.visibility),
                        ),
                        obscureText: true,
                        autocorrect: false,
                        validator: con.validatePassword,
                        onSaved: con.savePassword,
                      ),
                    ),
                    SizedBox(
                      height: 225.0,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50.0,
                      margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                      child: ElevatedButton(
                        onPressed: con.signIn,
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(255, 100, 27, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            TextButton(
              onPressed: con.forgetPassword,
              child: Text(
                'FORGOT PASSWORD?',
                style: TextStyle(
                  color: Color.fromRGBO(255, 100, 27, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(65.0, 0.0, 65.0, 0.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(25.0),
                    child: Text(
                      'or',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: ElevatedButton(
                onPressed: con.createNewAccount,
                child: Text(
                  'CREATE NEW ACCOUNT',
                  style: TextStyle(
                    color: Color.fromRGBO(255, 100, 27, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: BorderSide(
                    color: Color.fromRGBO(255, 100, 27, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
          ],
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
  late _LoginScreenState state;
  _Controller(this.state);

  String? email;
  String? password;

  void signIn() {
    // get the current state of the form
    FormState? currentState = state.formKey.currentState;
    // check if state of formKey exists
    if (currentState == null) return;
    // check all validator attributes of TextFormFields in formKey state
    if (!currentState.validate()) return;
    // when validate is successful, save state by calling all onSaved attributes on formKey state
    currentState.save();

    // firstWhere()->Dart method that returns first element that satisfies given test
    UserRecord user = UserRecord.fakeDB.firstWhere(
      // check each element e of fakeDB list
      (e) => e.email == email && e.password == password,
      // If no matching element is found, returns the result of 'orElse'
      // Below: returns UserRecord with default values
      orElse: () => UserRecord(),
    );

    print(UserRecord.fakeDB);

    // if sign in failed...
    if (user.email == '') {
      MyUtil.showSnackBar(
        context: state.context,
        message: 'Email or password is incorrect',
      );
      // if sign in accepted...
    } else {
      Navigator.pushNamed(
        state.context,
        LoggedInMainScreen.routeName,
        arguments: user,
      );
      print('~~~~~~~~~~~ Logged in Correctly ~~~~~~~~~~');
    }
  }

  String? validateEmail(String? value) {
    // email must contain '@' and '.'
    if (value == null || !(value.contains('@') && value.contains('.')))
      return 'Please enter a valid email address';
    else
      return null;
  }

  void saveEmail(String? value) {
    email = value;
  }

  String? validatePassword(String? value) {
    // password must be longer than 7 characters long
    if (value == null || value.length < 7)
      return 'Please enter your password';
    else
      return null;
  }

  void savePassword(String? value) {
    password = value;
  }

  void forgetPassword() {
    print('~~~~~~~~~Forget Password? button pressed~~~~~~~~~~');
  }

  void createNewAccount() {
    print('~~~~~~~~~~~~~~~~Create New Account pressed~~~~~~~~~~~~~~~~');
    Navigator.pushNamed(
      state.context,
      CreateAccountScreen.routeName,
    );
  }
}
