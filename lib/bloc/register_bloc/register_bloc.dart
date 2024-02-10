import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(InitialState()) {
    FirebaseAuth auth = FirebaseAuth.instance;
    on<MainScreenRegisterEvent>((event, emit) async {
      final Completer<void> completer = Completer();
      final _phone = event.phone;
      print("Start Bloc");
        emit(RegisterInitialState(
                id: "+79282599299", token: 123456 ?? 0));
      // await auth.verifyPhoneNumber(
      //     phoneNumber: _phone,
      //     verificationCompleted: (PhoneAuthCredential credential) async {
      //       await auth.signInWithCredential(credential);
      //       print("VERIFICATION COMLITED!");
      //     },
      //     verificationFailed: (FirebaseAuthException error) {
      //       if (error.code == "invalid-phone-number") {
      //         print("ERROR NUMBER BLOC");
      //                emit(RegisterInitialState(
      //           id: _phone, token: 0 ?? 0));
              
      //       }
      //     },
      //     codeSent: (verificationId, forceResendingToken) async {
      //       emit(RegisterInitialState(
      //           id: verificationId, token: forceResendingToken ?? 0));
      //     },
      //     codeAutoRetrievalTimeout: (verificationId) {
      //       //Обратнвый вызов по истечении времени автоматического получения кода.
            
      //     });
    });
    on<VerifySentOtpEvent>((event, emit) async {
      print("Verify");
      FirebaseAuth auth = FirebaseAuth.instance;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: event.phone, smsCode: event.token);
      try {
        await auth.signInWithCredential(credential);
        emit(InitialNewUserState(
            textToUser: "Регистрация успешна", newScreen: true));
      } catch (e) {
        emit(InitialNewUserState(
            textToUser: "Ошибка в веденном коде.", newScreen: true));
      }
    });
  }
}

// class InitialNewUserBloc
//     extends Bloc<VerifySentOtpEvent, InitialNewUserState> {
//   InitialNewUserBloc()
//       : super(InitialNewUserState(textToUser: "", newScreen: false)) {
//     print("IIIIIIIIIIIIIINITIAL");
//     FirebaseAuth auth = FirebaseAuth.instance;
//     on<VerifySentOtpEvent>((event, emit) async {
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//           verificationId: event.phone, smsCode: event.token);
//       try {
//         await auth.signInWithCredential(credential);
//         emit(InitialNewUserState(
//             textToUser: "Регистрация успешна", newScreen: true));
//       } catch (e) {
//         emit(InitialNewUserState(
//             textToUser: "Ошибка в веденном коде.", newScreen: true));
//       }
//     });
//   }
// }
