import 'package:flutter/material.dart';

import '../../../shared/compononse/components.dart';
// import '../../shared/compononse/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passController = TextEditingController();
  bool isPassword=true;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultTextFormField(
                    controller: emailController,
                    label: 'email',
                    prefix: Icons.email,
                    suffix: Icons.remove_red_eye,
                    type: TextInputType.emailAddress,
                    validate: (value)
                    {
                      if(value!.isEmpty){
                        return 'email must not empty';
                      }
                      return null;
                    },
                      onSubmit: (value) {  }, suffixPressed: () {  },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  defaultTextFormField(
                      controller: passController,
                      label: 'password',
                      prefix: Icons.lock,
                      suffix:isPassword? Icons.visibility:Icons.visibility_off,
                      isPassword: isPassword,
                      suffixPressed:(){
                        setState(() {
                          isPassword=!isPassword;
                        });

                  },
                      type: TextInputType.visiblePassword,
                      validate: (value)
                      {
                        if(value!.isEmpty){
                          return 'password must not empty';
                        }
                        return null;
                      },
                      onSubmit: (value) {  },
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  defaultButton(
                    text: 'login',
                    width: 200.0,
                    background: Colors.orange,
                    function: ()
                    {
                      if(formKey.currentState!.validate()) {
                        print(emailController.text);
                        print(passController.text);
                      }
                    }, suffixPressed: (){}, 
                  ),

                  SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Register Now',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
