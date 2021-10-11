import 'package:app3/Widgets/new_transaction.dart';
import 'package:app3/Widgets/transactionList.dart';

import 'package:flutter/material.dart';

import 'Widgets/chart.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());
bool switcher = true;

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final List<Transaction> utrax = [
    Transaction(
        id: '01',
        name: 'Food',
        amount: 600.00,
        dt: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: '02',
        name: 'Diesel',
        amount: 999.00,
        dt: DateTime.now().subtract(Duration(days: 2))),
    Transaction(id: '03', name: 'Weeed', amount: 500.00, dt: DateTime.now()),
    Transaction(
        id: '04',
        name: 'Adidas Yeezy Boost 350',
        amount: 7000.00,
        dt: DateTime.now().subtract(Duration(days: 1))),
  ];

  void switchtheme() {
    setState(() {
      if (switcher == false) switcher = true;
      if (switcher == true) switcher = false;
    });
    print(switcher);
  }

  List<Transaction> get recTrax {
    return utrax.where((tx1) {
      return tx1.dt.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void addTransaction(String txTitle, double txAmount, DateTime sDate) {
    final tx = Transaction(
        amount: txAmount,
        name: txTitle,
        dt: sDate,
        id: DateTime.now().toString());
    setState(() {
      utrax.add(tx);
    });
  }

  void startTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(addTransaction),
            //behavior: HitTestBehavior.opaque,
          );
        });
  }

  void deletetrax(String id) {
    setState(() {
      utrax.removeWhere((tx) => tx.id == id);
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.pink,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'Quicksand',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(color: Colors.white)),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'OpenSans-Bold',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
        ),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Text('Personal Expenses'),
            actions: [
//================================================================


              Switch(
                value: switcher,
                onChanged: (value) {
                  setState(() {
                    switcher = value;
                  });
                },
                activeColor: Colors.pink,
                inactiveTrackColor: Colors.grey[300],
                )

                
//======================================================================
            ],
          ),
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                child: Card(
                  color: Colors.white,
                  //elevation: 15,
                  child: chart(recTrax),
                ),
              ),
              transactionList(utrax, deletetrax, switcher),

              //============= Leaaaaarrnnn Thissssssssss =====================

              //================================================================
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              startTransaction(context);
            },
            child: Icon(Icons.add_shopping_cart_outlined),
          ),
        ));
  }
}
