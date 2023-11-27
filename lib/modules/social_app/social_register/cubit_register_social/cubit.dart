import 'package:bloc/bloc.dart';
import 'package:chats_app/model/social_model/social_user_model.dart';
import 'package:chats_app/modules/social_app/social_register/cubit_register_social/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState> {
  SocialRegisterCubit() : super(SocialRegisterInitiat());
  static SocialRegisterCubit get(context)=>BlocProvider.of(context);

  void userRegister({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) {

    emit(SocialRegisterLoading());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value){
      print(value.user!.email);
      print(value.user!.uid);
      createUser(
          name: name,
          email: email,
          phone: phone,
          uId: value.user!.uid
      );

    }).catchError((error){
      print('Registration Error: $error');
      emit(SocialRegisterError(error.toString()));
    });

  }

  void createUser({
    required String name,
    required String email,
    required String phone,
    required String uId,
  })
  {
    SocialUserModel model=SocialUserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        image:'https://i.pinimg.com/236x/4f/0b/ce/4f0bcef5b7a8be1d3a44daded5733ffe.jpg',
        cover: 'https://img.freepik.com/premium-photo/burn-sand-desert-sunset-wallpaper-image-ai-generated-art_856480-467.jpg?size=626&ext=jpg&ga=GA1.1.1083969217.1697145493&semt=sph',
        bio: 'writ your bio...',
        isEmailVerified:false,
    );
FirebaseFirestore.instance
    .collection('user')
    .doc(uId)
    .set(model.toMap())
    .then((value){
      emit(SocialCreateSuccess());
})
    .catchError((error){
      emit(SociaCreateError(error.toString()));
});
  }

  IconData suffix=Icons.visibility_outlined;
  bool isPassword=true;
  void changePasswordVsibility()
  {
    isPassword=!isPassword;
    suffix=isPassword? Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(SocialRegisterChangePasswordVisibility());
  }

}
