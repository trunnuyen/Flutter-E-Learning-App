import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_learning_app/Repository/DBHelper.dart';
import 'package:online_learning_app/Widgets/BoxDecoration.dart';

class CreditCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: nMbox,
      child: StreamBuilder(
        stream: DBHelper.db
            .collection("Payment")
            .where("userkey", isEqualTo: DBHelper.auth.currentUser!.uid)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.hasData) {
            var arr = snapshot.data!.docs;
            if (arr.isNotEmpty) {
              return Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('VISA',
                          style: TextStyle(
                              color: fCD,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                      Icon(
                        Icons.more_horiz,
                        color: fCD,
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                          '${arr.map((e) => e.get("cardNumber").toString().replaceRange(0, 5, "*****"))}',
                          style: TextStyle(
                              color: fCD,
                              fontSize: 18,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Card Holder',
                              style: TextStyle(
                                  color: fCL,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                          Text(
                              '${arr.map((e) => e.get("fullName").toString())}',
                              style: TextStyle(
                                  color: fCD,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Expires',
                              style: TextStyle(
                                  color: fCL,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700)),
                          Text('08 / 21',
                              style: TextStyle(
                                  color: fCD,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ],
                  )
                ],
              );
            }
          }
          return const SizedBox(
            child: Text('You haven\'t set your credit card info yet'),
          );
        },
      ),
      // Column(
      //   children: <Widget>[
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         Text('VISA',
      //             style: TextStyle(
      //                 color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
      //         Icon(
      //           Icons.more_horiz,
      //           color: fCD,
      //         ),
      //       ],
      //     ),
      //     const SizedBox(height: 25),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         Text('* * * *',
      //             style: TextStyle(
      //                 color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
      //         Text('* * * *',
      //             style: TextStyle(
      //                 color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
      //         Text('* * * *',
      //             style: TextStyle(
      //                 color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
      //         Text('8014',
      //             style: TextStyle(
      //                 color: fCD, fontSize: 18, fontWeight: FontWeight.w700)),
      //       ],
      //     ),
      //     const SizedBox(height: 25),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Text('Card Holder',
      //                 style: TextStyle(
      //                     color: fCL,
      //                     fontSize: 12,
      //                     fontWeight: FontWeight.w700)),
      //             Text('Lindsey Johnson',
      //                 style: TextStyle(
      //                     color: fCD,
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.w700)),
      //           ],
      //         ),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Text('Expires',
      //                 style: TextStyle(
      //                     color: fCL,
      //                     fontSize: 12,
      //                     fontWeight: FontWeight.w700)),
      //             Text('08 / 21',
      //                 style: TextStyle(
      //                     color: fCD,
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.w700)),
      //           ],
      //         ),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
