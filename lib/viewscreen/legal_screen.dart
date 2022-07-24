import 'package:flutter/material.dart';

class LegalScreen extends StatelessWidget {
  static const routeName = '/legalScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Legal',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: TextButton(
                onPressed: () => print('~~~~~~ Privacy Policy Pressed ~~~~~~'),
                child: Text(
                  'Privacy Policy',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Divider(
              thickness: 2.0,
            ),
            Container(
              child: TextButton(
                onPressed: () =>
                    print('~~~~~~ Privacy Policy (California) Pressed ~~~~~~'),
                child: Text(
                  'Privacy Policy (California)',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
            Divider(
              thickness: 2.0,
            ),
            Container(
              child: TextButton(
                onPressed: () =>
                    print('~~~~~~ Terms of Service Pressed ~~~~~~'),
                child: Text(
                  'Terms of Service',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
