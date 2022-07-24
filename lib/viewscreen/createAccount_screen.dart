import 'package:creative_work_assignment2/model/userreccord.dart';
import 'package:creative_work_assignment2/viewscreen/loggedInMain_screen.dart';
import 'package:creative_work_assignment2/viewscreen/view/myutil.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  static const routeName = '/createAccountScreen';
  final UserRecord newUser = UserRecord();
  @override
  State<StatefulWidget> createState() {
    return _CreateAccountScreenState();
  }
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
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
          'Create Account',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: formKey,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '   First Name',
                        ),
                        autocorrect: false,
                        validator: con.validateFirstName,
                        onSaved: con.saveFirstName,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '   Last Name',
                        ),
                        autocorrect: false,
                        validator: con.validateLastName,
                        onSaved: con.saveLastName,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
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
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '   Phone Number',
                        ),
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                        validator: con.validatePhone,
                        onSaved: con.savePhone,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 0.0),
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
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 0.0),
              child: Text(
                'I have a physical limitation:',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              margin: EdgeInsets.fromLTRB(25.0, 8.0, 25.0, 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: Row(
                children: [
                  for (var v in PhysicalLimitation.values)
                    Expanded(
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.all(0.0),
                        // places checkbox in leading spot (left)
                        controlAffinity: ListTileControlAffinity.leading,
                        value: widget.newUser.physicalLimitations[v],
                        onChanged: (value) =>
                            con.onChangedPhysicalLimitation(value, v),
                        title:
                            (v.toString().split('.')[1] == 'Visually_Impaired')
                                ? Text(
                                    'Visually Impaired',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : Text(
                                    'Reach Restriction',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              children: [
                for (var v in TermAgreements.values)
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
                    child: CheckboxListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: widget.newUser.termAgreements[v],
                      onChanged: (value) =>
                          con.onChangedTermAgreements(value, v),
                      title: (v.toString().split('.')[1] == 'Terms_Of_Service')
                          ? Text(
                              '''By creating an account, I agree to the Terms of Service
and understand my information will be used as
described in the Privacy Policy.''',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              '''Yes, I would like to receive commercial electronic
information and offers from Little Caesars (including
emails and push notifications, which may be subject
to fees charged by my wireless carrier), including on
my wireless device. You may later unsubscribe. Your
consent is sought by Little Caesar Enterprices, Inc. for
itself and for Little Caesar of Canada ULC. Little Caesar
Enterprises, Inc., 2211 Woodward Ave., Detroit, MI
48201; (privacy@Icecorp.com)''',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50.0,
              margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: ElevatedButton(
                onPressed: con.createNewAccount,
                child: Text(
                  'CREATE ACCOUNT',
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _Controller {
  late _CreateAccountScreenState state;
  _Controller(this.state);

  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? password;

  void createNewAccount() {
    // get the current state of the form
    FormState? currentState = state.formKey.currentState;
    // check if state of formKey exists
    if (currentState == null) return;
    // check all validator attributes of TextFormFields in formKey state
    if (!currentState.validate()) return;
    // validate that the Terms of Service is agreed upon
    if (state.widget.newUser.termAgreements[TermAgreements.Terms_Of_Service] ==
        false) {
      MyUtil.showSnackBar(
        context: state.context,
        message: 'Please agree to Terms of Service before Creating Account',
      );
      return;
    }
    // when validate is successful, save state by calling all onSaved attributes on formKey state
    currentState.save();

    // because each parameter has been validated,
    // null assertion operator has been used.
    state.widget.newUser.email = email!;
    state.widget.newUser.password = password!;
    state.widget.newUser.firstName = firstName!;
    state.widget.newUser.lastName = lastName!;
    state.widget.newUser.phone = phoneNumber!;

    // add newUser to fakeDB
    state.widget.newUser.addToDB(state.widget.newUser);

    print(UserRecord.fakeDB);

    // go to main screen (logged in)
    Navigator.pushNamed(
      state.context,
      LoggedInMainScreen.routeName,
      arguments: state.widget.newUser,
    );
  }

  String? validateFirstName(String? value) {
    // first name must be at least 2 characters long
    if (value == null || value.length < 2)
      return 'Please enter a valid first name';
    else
      return null;
  }

  void saveFirstName(String? value) {
    firstName = value;
  }

  String? validateLastName(String? value) {
    // last name must be at least 2 characters long
    if (value == null || value.length < 2)
      return 'Please enter a valid last name';
    else
      return null;
  }

  void saveLastName(String? value) {
    lastName = value;
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

  String? validatePhone(String? value) {
    // phone number must be 10 digits long
    if (value == null || value.length < 10)
      return 'Please enter your phone number';
    else
      return null;
  }

  void savePhone(String? value) {
    phoneNumber = value;
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

  void onChangedPhysicalLimitation(bool? value, PhysicalLimitation key) {
    if (value != null) {
      state.render(() {
        state.widget.newUser.physicalLimitations[key] = value;
      });
    }
  }

  void onChangedTermAgreements(bool? value, TermAgreements key) {
    if (value != null) {
      state.render(() {
        state.widget.newUser.termAgreements[key] = value;
      });
    }
  }
}
