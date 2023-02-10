



import 'package:cityproperties/Screens/Register/Api/RegisterRemote.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

import '../../../translations/locale_keys.g.dart';
import 'register_state.dart';


part 'register_event.dart';


class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterRemoteDataSource registerRemoteDataSource;

  RegisterBloc({
    required this.registerRemoteDataSource
   }) : super(RegisterState.initial()) {
    on<RegisterEventSubmit>((event, emit) async {
      emit(state.rebuild((b) => b
        ..isSuccess = false
        ..isLoading = true
          ..error=''

        ));
      final result = await registerRemoteDataSource.register(
        username: event.userName,
        emiratesId: event.emiratesId,
        pwd: event.pwd
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
        if(r.listRegister![0].result =='0')
        {
          emit(state.rebuild((b) => b
            ..isSuccess = true
            ..isLoading = false

          ));

        }
        else if(r.listRegister![0].result =='1')
          {
            emit(state.rebuild((b) => b
              ..isSuccess = false
              ..isLoading = false
              ..error=LocaleKeys.lbl_reg_form_error_5.tr()
            ));

          }
       else if(r.listRegister![0].result =='2')
        {
          emit(state.rebuild((b) => b
            ..isSuccess = false
            ..isLoading = false
            ..error=LocaleKeys.lbl_emirates_id_already_register.tr()
          ));

        }
        else if(r.listRegister![0].result =='3')
        {
          emit(state.rebuild((b) => b
            ..isSuccess = false
            ..isLoading = false
            ..error=LocaleKeys.lbl_user_name_exists.tr()
          ));

        }
        else if(r.listRegister![0].result =='4')
        {
          emit(state.rebuild((b) => b
            ..isSuccess = false
            ..isLoading = false
            ..error=LocaleKeys.lbl_forget_pass_error_3.tr()
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

