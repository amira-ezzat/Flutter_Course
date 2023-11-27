import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          '   Flutter',
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('Search');
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("Notification");
            },
            icon: Icon(Icons.notification_important),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(65.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(20.0),
                  bottomEnd: Radius.circular(20.0),
                ),

              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage('https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTgzSFw_0pRFTjuMMyWRIBvmsOBEQ_nfdzYZ-ftawfi-x5gF2CH',
                  ),
                    height: 200.0,
                    width: 200.0,
                    fit: BoxFit.cover,



                  ),
                  Container(
                    color: Colors.blue.withOpacity(0.6),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 10.0,
                    ),
                    child: Text('Moana',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: Row(
      //
      //     children: [
      //       Text('Hi Flutter',
      //         style: TextStyle(
      //           color: Colors.white,
      //           backgroundColor: Colors.orange,
      //           fontSize: 25.0,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      //  Container(
      //   color: Colors.pinkAccent,
      //    width: double.infinity,
      //   child:
      //   SingleChildScrollView(
      //     child: Column(
      //      
      //       mainAxisAlignment: MainAxisAlignment.start,
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hello Flutter',
      //           style: TextStyle(
      //             color: Colors.blue,
      //             backgroundColor: Colors.brown,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Welcom Flutter',
      //           style: TextStyle(
      //             color: Colors.white,
      //             backgroundColor: Colors.orange,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //         Text(
      //           'Hi Flutter',
      //           style: TextStyle(
      //             color: Colors.blueGrey,
      //             backgroundColor: Colors.lightGreen,
      //             fontSize: 25.0,
      //           ),
      //         ),
      //
      //
      //         //   Expanded(
      //         //     child: Container(
      //         //
      //         //       child: Text('Welcome Flutter',
      //         //         style: TextStyle(
      //         //           color: Colors.lightGreen,
      //         //           backgroundColor: Colors.grey,
      //         //           fontSize: 50.0,
      //         //         ),
      //         //
      //         // ),
      //         //     ),
      //         //   ) ,
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
