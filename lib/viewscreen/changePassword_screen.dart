import 'package:creative_work_assignment2/model/userreccord.dart';
import 'package:creative_work_assignment2/viewscreen/loggedInMain_screen.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const routeName = '/changePasswordScreenTemplate';
  final UserRecord userRecord;
  // constructor
  ChangePasswordScreen(this.userRecord);
  @override
  State<StatefulWidget> createState() {
    return _ChangePasswordScreenState();
  }
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
          'Change Password',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(30.0, 35.0, 30.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '   Current Password',
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  obscureText: true,
                  autocorrect: false,
                  validator: con.validateCurrentPassword,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '   New Password',
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  obscureText: true,
                  autocorrect: false,
                  validator: con.validatePassword,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '   Confirm New Password',
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  obscureText: true,
                  autocorrect: false,
                  validator: con.validateNewPasswordMatches,
                  onSaved: con.saveNewPassword,
                ),
              ),
              SizedBox(
                height: 340.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                child: ElevatedButton(
                  onPressed: con.changePassword,
                  child: Text(
                    'CHANGE PASSWORD',
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
              SizedBox(
                height: 10.0,
              ),
              Center(
                child: TextButton(
                  onPressed: () =>
                      print('~~~~~~~ Disable Account Pressed ~~~~~~~'),
                  child: Text(
                    'FORGOT PASSWORD?',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 100, 27, 1),
                      fontSize: 17.0,
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
  late _ChangePasswordScreenState state;
  _Controller(this.state);

  String? newTempPassword;
  String? newPassword;

  void changePassword() {
    // get the current state of the form
    FormState? currentState = state.formKey.currentState;
    // check if state of formKey exists
    if (currentState == null) return;
    // check all validator attributes of TextFormFields in formKey state
    if (!currentState.validate()) return;
    // when validate is successful, save state by calling all onSaved attributes on formKey state
    currentState.save();

    // because each parameter has been validated,
    // null assertion operator has been used.
    state.widget.userRecord.password = newPassword!.trim();

    print(UserRecord.fakeDB);

    Navigator.pushNamed(
      state.context,
      LoggedInMainScreen.routeName,
      arguments: state.widget.userRecord,
    );
  }

  String? validateCurrentPassword(String? value) {
    // password must match current password
    if (state.widget.userRecord.password != value)
      return """Password doesn't match""";
    else
      return null;
  }

  String? validatePassword(String? value) {
    // password must be longer than 6 characters long
    if (value == null || value.length < 7)
      return 'Passwords must be 7 characters long';
    else {
      saveNewTempPassword(value);
      return null;
    }
  }

  String? validateNewPasswordMatches(String? value) {
    // password must be longer than 6 characters long
    if (value != newTempPassword)
      return """Passwords don't match""";
    else
      return null;
  }

  void saveNewTempPassword(String? value) {
    newTempPassword = value;
  }

  void saveNewPassword(String? value) {
    newPassword = value;
  }
}
