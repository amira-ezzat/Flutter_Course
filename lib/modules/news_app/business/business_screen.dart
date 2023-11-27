// Remove this line since it's not needed in a Flutter mobile app.
// import 'dart:html';

// import 'dart:html';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/cubit/cubit.dart';
import '../../../layout/news_app/cubit/states.dart';
import '../../../shared/compononse/components.dart';


class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;

        return ConditionalBuilder(
          condition: !(state is NewsBusinessLoadingState),
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildArticleItem(list[index],context),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: list.length, // You need to provide the itemCount based on your data.
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
