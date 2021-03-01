import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:online_customer_care/bloc/user/user_event.dart';
import 'package:online_customer_care/bloc/user/user_state.dart';

import 'package:online_customer_care/repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent,UserState>{
  final UserRepository userRepository;
  UserBloc({@required this.userRepository}):
      assert(userRepository != null), super(UserLoading());
  @override
  Stream<UserState>mapEventToState(UserEvent event) async*{
    if(event is UserLoad){
      yield UserLoading();
      try{
        final comp = await userRepository.getUserList();
        yield UserLoadSuccess(comp);

      }catch(_){
        yield UserOperationFailure();
      }
    }
    if(event is UserUpdate){
      try{
        await userRepository.updateUser(event.user);
        final user = await userRepository.getUserList();
        yield UserLoadSuccess(user);
      }catch(_){
        yield UserOperationFailure();
      }
    }
    if (event is UserCreate) {
      try {
        await userRepository.createUser(event.user);
        final user = await userRepository.getUserList();
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }
    if (event is UserDelete) {
      try {
        await userRepository.deleteUser(event.user.id);
        final user = await userRepository.getUserList();
        yield UserLoadSuccess(user);
      } catch (_) {
        yield UserOperationFailure();
      }
    }

  }
}