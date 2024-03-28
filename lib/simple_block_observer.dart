import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class SimpleBlockObserver implements BlocObserver{
  @override
  void onChange(BlocBase bloc, Change change) {
  
    debugPrint('change =  $change ');
    // TODO: implement onChange
  }

  @override
  void onClose(BlocBase bloc) 
  {
    
    debugPrint('onClose =  $bloc ');
    // TODO: implement onClose
  }

  @override
  void onCreate(BlocBase bloc) {
      debugPrint('onCreate =  $bloc ');
    // TODO: implement onCreate
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }

}