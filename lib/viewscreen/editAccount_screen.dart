import 'package:creative_work_assignment2/model/userreccord.dart';
import 'package:creative_work_assignment2/viewscreen/loggedInMain_screen.dart';
import 'package:creative_work_assignment2/viewscreen/main_screen.dart';
import 'package:flutter/material.dart';

class EditAccountScreen extends StatefulWidget {
  static const routeName = '/editAccountScreenTemplate';
  final UserRecord userRecord;
  // constructor
  EditAccountScreen(this.userRecord);
  @override
  State<StatefulWidget> createState() {
    return _EditAccountScreenState();
  }
}

class _EditAccountScreenState extends State<EditAccountScreen> {
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
          'Edit Account',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(20.0, 15.0, 10.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account: ${widget.userRecord.email}',
                style: Theme.of(context).textTheme.headline2,
              ),
              Form(
                key: formKey,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 100, 27, 1),
                              fontSize: 16.0,
                            ),
                            labelText: '   First Name',
                          ),
                          initialValue: '    ${widget.userRecord.firstName}',
                          autocorrect: false,
                          validator: con.validateFirstName,
                          onSaved: con.saveFirstName,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 100, 27, 1),
                              fontSize: 16.0,
                            ),
                            labelText: '   Last Name',
                          ),
                          initialValue: '    ${widget.userRecord.lastName}',
                          autocorrect: false,
                          validator: con.validateLastName,
                          onSaved: con.saveLastName,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 10.0),
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(255, 100, 27, 1),
                              fontSize: 16.0,
                            ),
                            labelText: '   Phone Number',
                          ),
                          initialValue: '    ${widget.userRecord.phone}',
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          validator: con.validatePhone,
                          onSaved: con.savePhone,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                        child: Text(
                          'I have a physical limitation:',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                        child: Column(
                          children: [
                            for (var v in PhysicalLimitation.values)
                              CheckboxListTile(
                                contentPadding: EdgeInsets.all(0.0),
                                // places checkbox in leading spot (left)
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                value: widget.userRecord.physicalLimitations[v],
                                onChanged: (value) =>
                                    con.onChangedPhysicalLimitation(value, v),
                                title: (v.toString().split('.')[1] ==
                                        'Visually_Impaired')
                                    ? Text(
                                        'Visually Impaired',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      )
                                    : Text(
                                        'Reach Restriction',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                        child: Text(
                          'I would like marketing updates:',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0.0),
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          controlAffinity: ListTileControlAffinity.leading,
                          value: widget.userRecord.termAgreements[
                              TermAgreements.Receive_Commercial_Offers],
                          onChanged: (value) => con.onChangedTermAgreements(
                              value, TermAgreements.Receive_Commercial_Offers),
                          title: Text(
                            """Yes, I would like to receive commercial electronic
information and offers from Little Caesars
(including emails and push notifications, which
may be subject to fees charged by my wireless
carrier), including on my wireless device. You may
later unsusbscribe. Your consent is sought by Little
Caesars Enterprises, Inc. for itself and for Little
Caesars of Canada ULC. Little Caesar Enterprises,
Inc., 2211 Woodward Ave., Detroit, MI 48201;
(privacy@Icecorp.com)""",
                            style: TextStyle(
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0,
                        margin: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                        child: ElevatedButton(
                          onPressed: con.saveChanges,
                          child: Text(
                            'SAVE CHANGES',
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
                          onPressed: con.disableAccount,
                          child: Text(
                            'DISABLE ACCOUNT',
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
  late _EditAccountScreenState state;
  _Controller(this.state);

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;

  void saveChanges() {
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
    state.widget.userRecord.firstName = firstName!.trim();
    state.widget.userRecord.lastName = lastName!.trim();
    state.widget.userRecord.phone = phoneNumber!.trim();

    print(UserRecord.fakeDB);

    Navigator.pushNamed(
      state.context,
      LoggedInMainScreen.routeName,
      arguments: state.widget.userRecord,
    );
  }

  void disableAccount() {
    email = state.widget.userRecord.email;
    password = state.widget.userRecord.password;
    // firstWhere()->Dart method that returns first element that satisfies given test
    UserRecord user = UserRecord.fakeDB.firstWhere(
      // check each element e of fakeDB list
      (e) => e.email == email && e.password == password,
    );
    UserRecord.fakeDB.remove(user);

    print(UserRecord.fakeDB);

    Navigator.pushNamed(
      state.context,
      MainScreen.routeName,
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

  void onChangedPhysicalLimitation(bool? value, PhysicalLimitation key) {
    if (value != null) {
      state.render(() {
        state.widget.userRecord.physicalLimitations[key] = value;
      });
    }
  }

  void onChangedTermAgreements(bool? value, TermAgreements key) {
    if (value != null) {
      state.render(() {
        state.widget.userRecord.termAgreements[key] = value;
      });
    }
  }
}
