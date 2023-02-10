


import 'package:cityproperties/Screens/ForgetPassword/Api/ForgetPasswordRemote.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../../../translations/locale_keys.g.dart';
import 'forget_state.dart';


part 'forget_event.dart';


class ForgetBloc extends Bloc<ForgetEvent, ForgetState> {
  ForgetPasswordRemoteDataSource forgetPasswordRemoteDataSource;

  ForgetBloc({
    required this.forgetPasswordRemoteDataSource
   }) : super(ForgetState.initial()) {
    on<ForgetEventSubmit>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
          ..error=''

        ));
      final result = await forgetPasswordRemoteDataSource.forgetPassword(
        email: event.email,
        emiratesId: event.emiratesId,
      );
      print("result");
      print(result);
      print("result");

      return result.fold((l) async {
        print('l');
        emit(state.rebuild((b) => b
          ..isSuccess = false
          ..isLoading = false
          ..error = l));
      }, (r) async {
        print('r');
        if(r.listForget![0].result =='3')
        {
          emit(state.rebuild((b) => b
            ..isSuccess = true
            ..isLoading = false

          ));

        }
        else if(r.listForget![0].result =='0')
          {
            emit(state.rebuild((b) => b
              ..isSuccess = false
              ..isLoading = false
              ..error=LocaleKeys.lbl_forget_pass_error_1.tr()
            ));

          }
       else if(r.listForget![0].result =='1')
        {
          emit(state.rebuild((b) => b
            ..isSuccess = false
            ..isLoading = false
            ..error=LocaleKeys.lbl_forget_pass_error_2.tr()
          ));

        }
        else{
          emit(state.rebuild((b) => b
            ..isLoading = false
            ..error=LocaleKeys.lbl_forget_pass_error_3.tr()
          ));
        }

      });
    });
  }


}

