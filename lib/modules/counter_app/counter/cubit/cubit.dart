
import 'package:bloc/bloc.dart';
import 'package:chats_app/modules/counter_app/counter/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../counter/cubit/states.dart';
// import 'package:flutter_pro/modules/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates> {

  CounterCubit():super(CounterInitialState());
  static CounterCubit get(context)=>BlocProvider.of(context);
  int counter=1;
  void minus()
  {
    counter--;
    emit(CounterMinusState(this.counter));
  }
  void plus()
  {
    counter++;
    emit(CounterPlusState(this.counter));
  }

}
