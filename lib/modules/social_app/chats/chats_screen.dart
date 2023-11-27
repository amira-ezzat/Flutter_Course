
import 'package:chats_app/layout/social_app/cubit/cubit.dart';
import 'package:chats_app/layout/social_app/cubit/states.dart';
import 'package:chats_app/model/social_model/social_user_model.dart';
import 'package:chats_app/modules/social_app/chat_details/chat_details.dart';
import 'package:chats_app/shared/compononse/components.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatsScreen extends StatelessWidget {


  @override
  Widget build(context) {
    return  BlocConsumer<SocialCubit,SocialStates>(
      listener: ( context, state) {  },
      builder: ( context,  state) {
        return ConditionalBuilder(
          condition:SocialCubit.get(context).users.isEmpty,
          builder: ( context)=>ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder:(context,index)=>buildChatItem(SocialCubit.get(context).users[index],context) ,
            separatorBuilder: (context,index)=>myDivider(),
            itemCount: SocialCubit.get(context).users.length,
          ),
          fallback: ( context)=>Center(
            child: CircularProgressIndicator(),
          ),

        );
      },

    );
  }

  Widget buildChatItem(SocialUserModel? model,context)=>InkWell(

      onTap: () {
        navigateTo(
            context, ChatDetailsScreen(
          userModel: model,
        )
        );
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 29.0,
            backgroundImage: NetworkImage(
                '${model!.image}'
            ),
          ),
          SizedBox(
            width: 15.0,
          ),
          Text(
            '${model!.name}',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),

        ],
      ),
    ),
  );

}
