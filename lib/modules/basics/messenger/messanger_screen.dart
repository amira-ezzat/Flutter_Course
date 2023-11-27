import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('https://i1.wp.com/www.newphotodownload.info/wp-content/uploads/2019/12/%D8%AE%D9%84%D9%81%D9%8A%D8%A7%D8%AA-%D8%B9%D8%A7%D8%A6%D9%84%D8%A9-%D9%85%D9%88%D8%A7%D9%86%D8%A7-10.jpg?resize=500%2C500&ssl=1'),
            ),
            SizedBox(
              width:20.0 ,
            ),
            Text('Chats',

            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){},
              icon: Icon(
                Icons.camera_alt,
              ),
          ),
          IconButton(onPressed: (){},
            icon: Icon(
              Icons.edit,
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0
                    ),
                    color: Colors.grey,
                  ),
                  padding: EdgeInsets.all(7.0),
                  child: Row(
                    children: [
                      Icon(Icons.search,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text('Search',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 100.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index)=>buildStoryItem(),
                    separatorBuilder: (context,index)=>SizedBox(width: 20.0,),
                    itemCount: 8,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                    itemBuilder: (context,index)=>buildChatItem(),
                    separatorBuilder: (context,index)=>SizedBox(height: 20.0,),
                    itemCount: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChatItem()=> Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 25.0,
            backgroundImage: NetworkImage('https://i1.wp.com/www.newphotodownload.info/wp-content/uploads/2019/12/%D8%AE%D9%84%D9%81%D9%8A%D8%A7%D8%AA-%D8%B9%D8%A7%D8%A6%D9%84%D8%A9-%D9%85%D9%88%D8%A7%D9%86%D8%A7-10.jpg?resize=500%2C500&ssl=1'),
          ),
          CircleAvatar(
            radius: 7.0,
            backgroundColor: Colors.black,

          ),
          CircleAvatar(
            radius: 6.0,
            backgroundColor: Colors.green,

          ),
        ],
      ),
      SizedBox(
        width: 20.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Amira Ezzat',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              Text('Hi Amira',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: 6.0,
                  height: 6.0,
                  decoration: BoxDecoration(
                    color: Colors.cyan,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Text('12:00 Am',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
            ],
          ),

        ],
      ),


    ],
  );
  Widget buildStoryItem()=>Container(
    width: 50.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: NetworkImage('https://i1.wp.com/www.newphotodownload.info/wp-content/uploads/2019/12/%D8%AE%D9%84%D9%81%D9%8A%D8%A7%D8%AA-%D8%B9%D8%A7%D8%A6%D9%84%D8%A9-%D9%85%D9%88%D8%A7%D9%86%D8%A7-10.jpg?resize=500%2C500&ssl=1'),
            ),
            CircleAvatar(
              radius: 7.0,
              backgroundColor: Colors.black,

            ),
            CircleAvatar(
              radius: 6.0,
              backgroundColor: Colors.green,

            ),
          ],
        ),
        SizedBox(
          height: 8.0,
        ),
        Text('Amira Ezzat',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),


      ],
    ),
  );
}