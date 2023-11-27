import 'package:flutter/material.dart';

class UserModel{
  final int id;
  final String name;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.phone,
});
}
class UsersScreen extends StatelessWidget {
List<UserModel> users=[
  UserModel(
    id: 1,
    name: 'Amira Ezzat',
    phone: '+201123279544'
  ),
  UserModel(
      id: 2,
      name: 'Ashraf osama',
      phone: '+2011153152002'
  ),
  UserModel(
      id: 3,
      name: 'Amira Ahmed',
      phone: '+201233259544'
  ),
  UserModel(
      id: 4,
      name: 'Sara Ahmed',
      phone: '+20112028713'
  ),
  UserModel(
      id: 5,
      name: 'Shimaa Abdelnaeem',
      phone: '+201123279544'
  ),
  UserModel(
      id: 1,
      name: 'Amira Ezzat',
      phone: '+201123279544'
  ),
  UserModel(
      id: 2,
      name: 'Ashraf osama',
      phone: '+2011153152002'
  ),
  UserModel(
      id: 3,
      name: 'Amira Ahmed',
      phone: '+201233259544'
  ),
  UserModel(
      id: 4,
      name: 'Sara Ahmed',
      phone: '+20112028713'
  ),
  UserModel(
      id: 5,
      name: 'Shimaa Abdelnaeem',
      phone: '+201123279544'
  ),
  UserModel(
      id: 1,
      name: 'Amira Ezzat',
      phone: '+201123279544'
  ),
  UserModel(
      id: 2,
      name: 'Ashraf osama',
      phone: '+2011153152002'
  ),
  UserModel(
      id: 3,
      name: 'Amira Ahmed',
      phone: '+201233259544'
  ),
  UserModel(
      id: 4,
      name: 'Sara Ahmed',
      phone: '+20112028713'
  ),
  UserModel(
      id: 5,
      name: 'Shimaa Abdelnaeem',
      phone: '+201123279544'
  ),


];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.menu,
          ),
        ],
        backgroundColor: Colors.blue,
        title: Text('Users',),
      ),

      body:ListView.separated(itemBuilder: (context,index)=>buildUsersItem(users[index]),
          separatorBuilder: (context,index)=>Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 20.0),
            child: Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[300],
            ),
          ),
          itemCount: users.length)
    );
  }
Widget buildUsersItem(UserModel users)=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    children: [
      Row(
      children: [

        CircleAvatar(
      radius: 25.0,
      child: Text('${users.id}',
      style: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      ),
      ),

      ),
      SizedBox(width: 20.0,
      ),
      Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text('${users.name}',
      style: TextStyle(
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
      ),
      ),
      Text('${users.phone}',
      style: TextStyle(
      color: Colors.grey,
      ),
      ),


      ],
      ),
      ],
      ),
    ],
  ),
  );
}
