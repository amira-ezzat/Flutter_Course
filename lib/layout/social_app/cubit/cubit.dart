import 'dart:io';

import 'package:chats_app/layout/shop_app/cubit/states.dart';
import 'package:chats_app/layout/social_app/cubit/states.dart';
import 'package:chats_app/model/social_model/post_model.dart';
import 'package:chats_app/model/social_model/social_user_model.dart';
import 'package:chats_app/model/users/users_model.dart';
import 'package:chats_app/modules/setting/setting_screen.dart';
import 'package:chats_app/modules/social_app/chats/chats_screen.dart';
import 'package:chats_app/modules/social_app/users/user_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../modules/social_app/feeds/feeds_screen.dart';
import '../../../modules/social_app/new_post/newPost_screen.dart';
import '../../../modules/social_app/settings/setting_screen.dart';
import '../../../shared/compononse/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class SocialCubit extends Cubit<SocialStates> {
  String? profile;
  String? cover;
  SocialCubit() : super(SocialInitiateStates());
  static SocialCubit get(context) => BlocProvider.of(context);

  SocialUserModel? userModel;

  void getUserData() {
    emit(SocialGetUserLoadingStates());
    FirebaseFirestore.instance.collection('user').doc(uId).get().then((value) {
      // print(value.data());
      userModel = SocialUserModel.fromJson(value.data()!);
      emit(SocialGetUserSuccessStates());
    }).catchError((error) {
      emit(SocialGetUserErrorStates(error.toString()));
    });
  }

  int currentIndex = 0;

  List<String> titles = [
    'Home',
    'Chats',
    'Add Post',
    'Users',
    'Profile',
  ];
  List<Widget> screens = [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UserScreen(),
    ProfileScreen()
  ];

  void changeBottomNav(int index) {
    if(index==1)
      getAllUsers();
    if (index == 2)
      emit(SocialNewPost());
    else {
      currentIndex = index;
      emit(SocialChangeBottonNav());
    }
  }

  File? profileImage;
  final picker = ImagePicker();
  Future<void> getProfileImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialProfileImagePickedSuccess());
    } else {
      print('no image selected');
      emit(SocialProfileImagePickedError());
    }
  }

  File? coverImage;
  Future<void> getCoverImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialCoverImagePickedSuccess());
    } else {
      print('no image selected');
      emit(SocialCoverImagePickedError());
    }
  }

  void uploadProfileImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit( SocialUserUpdateLoading());
    FirebaseStorage.instance
        .ref()
        .child('user/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUser(
          name: name,
          phone: phone,
          bio: bio,
          photoProfile:profile,
        );
      }).catchError((error) {
        emit(SocialUploadProfileImageError());
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageError());
    });
  }

  void uploadCoverImage({
    required String name,
    required String phone,
    required String bio,
  }) {
    emit( SocialUserUpdateLoading());
    FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);

        updateUser(
            name: name,
            phone: phone,
            bio: bio,
            photoCover:cover,
        );
      }).catchError((error) {
        emit(SocialUploadCoverImageError());
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageError());
    });
  }

  // void updateUserImage({
  //   required String name,
  //   required String phone,
  //   required String bio,
  // }) {
  //   emit(SocialUserUpdateLoading());
  //   if (profileImage != null && coverImage != null) {
  //     uploadCoverImage(name: name, phone: phone, bio: bio);
  //     uploadProfileImage(name: name, phone: phone, bio: bio);
  //   }
  //   if (coverImage != null && profileImage == null) {
  //     uploadCoverImage(name: name, phone: phone, bio: bio);
  //   }
  //   if (profileImage != null && coverImage == null) {
  //     uploadProfileImage(name: name, phone: phone, bio: bio);
  //   }
  //   if (profileImage == null && coverImage == null) {
  //     updateUser(name: name, phone: phone, bio: bio);
  //   }
  // }

  void updateUser({
    required String name,
    required String phone,
    required String bio,
    String? photoProfile ,
    String? photoCover,
  }) {
    SocialUserModel model = SocialUserModel(
      name: name,
      phone: phone,
      bio: bio,
      email: userModel!.email,
      image: photoProfile??userModel!.image,
      cover:photoCover?? userModel!.cover,
      uId:userModel!.uId,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('user')
        .doc(userModel!.uId)
        .update(model.toMap())
        .then((value) {
      getUserData();
      emit(SocialUserUpdateSuccess());
    }).catchError((error) {
      print('Error updating user: $error');
      emit(SocialUserUpdateError());
    });
  }

  File? postImage;
  Future<void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      print(pickedFile.path);
      emit(SocialPostImagePickedSuccess());
    } else {
      print('no image selected');
      emit(SocialPostImagePickedError());
    }
  }

  void removePostImage()
  {
    postImage=null;
    emit(SocialRemovePostImage());
  }

  void uploadPostImage({
    required String text,
    required String dateTime,
  }) {
    emit( SocialCreatePostLoading());
    FirebaseStorage.instance
        .ref()
        .child('posts/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(
            dateTime: dateTime,
            text: text,
            postImage: value,
        );
      }).catchError((error) {
        emit(SocialCreatePostError());
      });
    }).catchError((error) {
      emit(SocialCreatePostError());
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    try {
      PostModel model = PostModel(
        name: userModel!.name,
        image: userModel!.image,
        uId: uId,
        text: text,
        dateTime: dateTime,
        postImage: postImage ?? '',
      );

      FirebaseFirestore.instance
          .collection('posts')
          .add(model.toMap())
          .then((value) {
        emit(SocialCreatePostSuccess());
      }).catchError((error) {
        print('Error creating post: $error');
        emit(SocialCreatePostError());
      });
    } catch (error) {
      print('Exception in createPost: $error');
      emit(SocialCreatePostError());
    }
  }


  List<PostModel> posts=[];
  List<String> postId=[];
  List<int> likes=[];
  void getPost()
  {
    FirebaseFirestore.instance
        .collection('posts')
        .get()
        .then((value){
          value.docs.forEach((element) {
            element.reference
            .collection('likes')
            .get().then((value){
              likes.add(value.docs.length);
              postId.add(element.id);
              posts.add(PostModel.fromJson(element.data()));
            })
            .catchError((error){});
            
          });
          emit(SocialGetPostSuccessStates());
    })
        .catchError((error){
          emit(SocialGetPostErrorStates(error));
    });
  }

  void likePost(String postId)
  {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({
      'likes':true
    })
        .then((value){
          emit(SocialLikePostSuccessStates());
    })
        .catchError((error){
          emit(SocialLikePostErrorStates(error.toString()));
    });
  }

  List<SocialUserModel> users=[];

  void getAllUsers() {

    if (users.isEmpty) {
      emit(SocialGetAllUserLoadingStates());
      FirebaseFirestore
          .instance.collection('user')
          .get()
          .then((value) {
        value.docs.forEach((element) {
          if (element.data()['uId'] !=userModel!.uId) {
            users.add(SocialUserModel.fromJson(element.data()));
          }
          emit(SocialGetAllUserSuccessStates());
        });
      })
          .catchError((error) {
        print(error.toString());
        emit(SocialGetAllUserErrorStates(error.toString()));
      });
    }
  }
}


