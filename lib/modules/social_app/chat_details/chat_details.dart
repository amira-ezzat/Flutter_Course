import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../model/social_model/social_user_model.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel? userModel;

  ChatDetailsScreen({this.userModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                '${userModel!.image}',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Text(
              '${userModel!.name}',
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical:5.0 ,
                horizontal: 10.0
              ),
              decoration:BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(10.0),
                  topEnd: Radius.circular(10.0),
                  topStart:  Radius.circular(10.0),

                ),

              ),

              child: Text(
                'Hello Amira'
              ),
            ),
          ),
        ],
      ),
    );
  }
}
