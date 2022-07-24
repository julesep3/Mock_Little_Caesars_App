import 'package:creative_work_assignment2/model/userreccord.dart';
import 'package:creative_work_assignment2/viewscreen/addCreditCard_screen.dart';
import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatefulWidget {
  static const routeName = '/paymentMethodsScreenTemplate';
  final UserRecord userRecord;
  // constructor
  PaymentMethodsScreen(this.userRecord);
  @override
  State<StatefulWidget> createState() {
    return _PaymentMethodsScreenState();
  }
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
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
          'Payment Methods',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          child: Column(
            children: [
              Text(
                """Little Caesars gift cards can only be accepted in
stores at this time.""",
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 35.0,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    width: 75.0,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: con.navigateToAddCreditcardScreen,
                      child: Icon(
                        Icons.add,
                        color: Colors.grey[600],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey[350]!),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Add a new card',
                      style: Theme.of(context).textTheme.headline2,
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
  late _PaymentMethodsScreenState state;
  _Controller(this.state);

  void navigateToAddCreditcardScreen() {
    Navigator.pushNamed(
      state.context,
      AddCreditCardScreen.routeName,
      arguments: state.widget.userRecord,
    );
  }
}
