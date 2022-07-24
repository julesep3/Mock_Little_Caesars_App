import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/aboutScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'About Little Caesars',
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(25.0, 20.0, 5.0, 0.0),
            child: Text('''Little Caesars has been proudly serving
delicious products for over 60 years.
Throughout history, we've provided quality
pizza at a great price, resulting in outstanding
value for customers.

Quality and value are core beliefs at Little
Caesars, but the brand also represents
passion, fun, commitment and a focus on
family.

Today, Little Caesars continues to innovately
provide more value to more people in more
places. Most importantly, Little Caesars
continues to use only the finest ingredients,
including 100% Mozzarella and Muenster
cheeses, sauce made from vine-ripened
tomatoes and dough made form scratch every
day, at every location.''', style: Theme.of(context).textTheme.headline6),
          ),
          SizedBox(
            height: 100.0,
          ),
          Column(
            children: [
              Text('Version 9.0.0'),
              Text('Country: United States'),
              Text('\u00a92020 Little Caesars Enterprise LLC')
            ],
          ),
        ],
      ),
    );
  }
}
