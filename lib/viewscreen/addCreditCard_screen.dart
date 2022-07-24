import 'package:creative_work_assignment2/model/userreccord.dart';
import 'package:flutter/material.dart';

class AddCreditCardScreen extends StatefulWidget {
  static const routeName = '/addCreditCardScreenTemplate';
  final UserRecord userRecord;
  // constructor
  AddCreditCardScreen(this.userRecord);
  @override
  State<StatefulWidget> createState() {
    return _AddCreditCardScreenState();
  }
}

class _AddCreditCardScreenState extends State<AddCreditCardScreen> {
  late _Controller con;
  String? stateDropdownValue;

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
          'Add Credit Card',
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
                margin: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 0.0),
                child: Text(
                  'Please complete all fields',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '   Name on Card',
                  ),
                  autocorrect: false,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '   Card Number',
                  ),
                  keyboardType: TextInputType.number,
                  autocorrect: false,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '   Exp Date(MM/ ...',
                        ),
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '   CVV',
                        ),
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(15.0, 11.0, 15.0, 0.0),
                child: Text(
                  'Billing Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '   Street Address',
                  ),
                  autocorrect: false,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: '   City',
                  ),
                  autocorrect: false,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65.0,
                      margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Container(
                          margin: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                          child: Text('State'),
                        ),
                        value: stateDropdownValue,
                        onChanged: (String? newValue) {
                          setState(() {
                            stateDropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          'Alabama',
                          'Alaska',
                          'American Samoa',
                          'Arizona',
                          'Arkansas',
                          'California',
                          'Colorado',
                          'Connecticut',
                          'Delaware',
                          'District of Columbia',
                          'Florida',
                          'Georgia',
                          'Guam',
                          'Hawaii',
                          'Idaho',
                          'Illinois',
                          'Indiana',
                          'Iowa',
                          'Kansas',
                          'Kentucky',
                          'Louisiana',
                          'Maine',
                          'Maryland',
                          'Massachusetts',
                          'Michigan',
                          'Minnesota',
                          'Mississippi',
                          'Missouri',
                          'Montana',
                          'Nebraska',
                          'Nevada',
                          'New Hampshire',
                          'New Jersey',
                          'New Mexico',
                          'New York',
                          'North Carolina',
                          'North Dakota',
                          'Ohio',
                          'Oklahoma',
                          'Oregon',
                          'Pennsylvania',
                          'Puerto Rico',
                          'Rhode Island',
                          'South Carolina',
                          'South Dakota',
                          'Tennessee',
                          'Texas',
                          'Utah',
                          'Vermont',
                          'Virgin Islands',
                          'Virginia',
                          'Washington',
                          'West Virginia',
                          'Wisconsin',
                          'Wyoming',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      // child: TextFormField(
                      //   decoration: InputDecoration(
                      //     hintText: '   State',
                      //   ),
                      //   keyboardType: TextInputType.number,
                      //   autocorrect: false,
                      // ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: '   Zip',
                        ),
                        keyboardType: TextInputType.number,
                        autocorrect: false,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                child: Text(
                  'I want to remember this card for future use',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50.0,
                margin: EdgeInsets.fromLTRB(25.0, 50.0, 25.0, 0.0),
                child: ElevatedButton(
                  onPressed: () => print('add card'),
                  child: Text(
                    'ADD CARD',
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
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class _Controller {
  late _AddCreditCardScreenState state;
  _Controller(this.state);
}
