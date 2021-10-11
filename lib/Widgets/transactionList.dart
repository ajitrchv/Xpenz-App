import 'package:app3/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class transactionList extends StatelessWidget {
  final List<Transaction> trax;
  final Function deletetx;
  final bool switchertx;
  transactionList(this.trax,this.deletetx,this.switchertx);

  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: trax.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'No Data Added!',
                    style: Theme.of(context).copyWith().textTheme.headline6,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      child: Image.asset(
                    'assets/images/empty.png',
                    fit: BoxFit.cover,
                  ))
                ],
              )
            : ListView.builder(
                itemBuilder: (ctx, index) {
                  
                  return((switchertx)?
                   Padding(
                    padding: EdgeInsets.all(2),
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: FittedBox(
                                child: Text(
                                  '₹ ${trax[index].amount.toStringAsFixed(1)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          title: Text(
                            trax[index].name,
                            style:
                                Theme.of(context).copyWith().textTheme.headline6,
                          ),
                          subtitle:
                              Text(DateFormat.yMMMMd().format(trax[index].dt),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor,
                                  )),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {deletetx(trax[index].id);},
                            color: Colors.red,
                          )),
                    ),
                  ):
                  Card(
                    elevation: 10,
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         Flexible(
                           flex: 1,
                           fit: FlexFit.tight,
                           child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 30),
                              decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 3,
                              )),
                              padding: EdgeInsets.all(10),
                              child:  Center(
                                child: Text(
                                    '₹ ${trax[index].amount.toStringAsFixed(0)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Theme.of(context).primaryColor),
                                  ),
                              ),
                              ),
                         ),
                        
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                               margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                                child: Text(
                                  trax[index].name,
                                  style: Theme.of(context)
                                      .copyWith()
                                      .textTheme
                                      .headline6,
                                ),
                              ),
                              Container(
                                child: Text(
                                  DateFormat.yMMMMd().format(trax[index].dt),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              )
                            ],
                          ),
                        ),
                      IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {deletetx(trax[index].id);},
                            color: Colors.red,
                          )],
                    ),
                  ));
                },
                itemCount: trax.length,
              ));
  }
}
/* 

                  return Card(
                    elevation: 10,
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                         Flexible(
                           flex: 1,
                           fit: FlexFit.tight,
                           child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 30),
                              decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 3,
                              )),
                              padding: EdgeInsets.all(10),
                              child:  Center(
                                child: Text(
                                    '₹ ${trax[index].amount.toStringAsFixed(2)}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Theme.of(context).primaryColor),
                                  ),
                              ),
                              ),
                         ),
                        
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                               margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                                child: Text(
                                  trax[index].name,
                                  style: Theme.of(context)
                                      .copyWith()
                                      .textTheme
                                      .headline6,
                                ),
                              ),
                              Container(
                                child: Text(
                                  DateFormat.yMMMMd().format(trax[index].dt),
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                
*/