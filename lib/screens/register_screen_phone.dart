import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:hmelnaya_lavka_app/bloc/register_bloc/register_bloc.dart';

import 'package:hmelnaya_lavka_app/screens/catalog_screen.dart';
import 'package:hmelnaya_lavka_app/screens/start_screen.dart';
import 'package:hmelnaya_lavka_app/utils/style.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterPhoneScreen extends StatefulWidget {
  const RegisterPhoneScreen({super.key});

  @override
  State<RegisterPhoneScreen> createState() => _RegisterPhoneScreenState();
}

class _RegisterPhoneScreenState extends State<RegisterPhoneScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _controller = TextEditingController(text: "+7");
  final TextEditingController otpController = TextEditingController();
  String verificationID = "";
  int token = 0;

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);

    return Scaffold(
      body: Container(
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          print(state);

          if (state is RegisterInitialState) {
            return Container(
              child: Column(
                children: [
                  Text("Apply code"),
                  TextField(
                    controller: otpController,
                    decoration: InputDecoration(),
                    keyboardType: TextInputType.number,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        registerBloc.add(VerifySentOtpEvent(
                            phone: verificationID, token: otpController.text));
                      },
                      child: Text("Press to next"))
                ],
              ),
            );
          } else if (state is InitialState) {
            return Container(
              child: Column(children: [
                24.height,
                boldText(24, "Phone number"),
                TextField(
                  controller: _controller,
                  inputFormatters: [PhoneInputFormatter()],
                  keyboardType: TextInputType.phone,
                ),
                ElevatedButton(
                  
                    onPressed: () {
                      // verificationID = _controller.text;
                      // registerBloc.add(
                      //     MainScreenRegisterEvent(phone: _controller.text));
                      // print(state);
                    },
                    child: Text("Press to registration (inactive)")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/start_screen");
                    },
                    child: Text("Продолжить без регистрации"))
              ]),
            );
          } else {
            return StartScreen();
            
          }
        },
      ),),
    );
  }
}

  //   return Container(
  //     child: Column(
  //       children: [
  //         24.height,
  //         boldText(24, "Введите номер телефона"),
  //         TextField(
  //           controller: _controller,
  //           inputFormatters: [PhoneInputFormatter()],
  //           keyboardType: TextInputType.phone,
  //         ),
  //         Visibility(
  //           child: TextField(
  //             controller: otpController,
  //             decoration: InputDecoration(),
  //             keyboardType: TextInputType.number,
  //           ),
  //           visible: otpVisibility,
  //         ),
  //         ElevatedButton(
  //             child: Text(otpVisibility ? "Verify" : "Login"),
  //             onPressed: () {
  //               // if (otpVisibility) {
  //               //   verifyOTP();
  //               // } else {
  //               //   loginWithPhone();     if (otpVisibility) {
  //               if (otpVisibility) {
  //                 checkUserBloc.add(VerifySentOtpEvent(
  //                     phone: _controller.text, token: otpController.text));
  //                 BlocListener<InitialNewUserBloc, PhoneAuthVerifiedState>(
  //                     listener: (context, state) {
  //                   if (state.newScreen) {
  //                     Navigator.push(
  //                         context,
  //                         MaterialPageRoute(
  //                             builder: (context) => StartScreen()));
  //                   } else {
  //                     print("Error");
  //                   }
  //                 });
  //               } else {
  //                 //Команда отправки
  //                 print("22222222222222222211");
  //                 registerBloc
  //                     .add(SendOtpToPhoneEvent(phone: _controller.text));
  //                 BlocListener<RegisterBloc, RegisterInitialState>(
  //                     listener: (context, state) {
  //                   otpVisibility = state.isState;
  //                   verificationID = state.id;
  //                   setState(() {
  //                     print("Add me new state plz");
  //                     print(otpVisibility);
  //                     print(otpController);
  //                   });
  //                 });
  //               }
  //             }),
  //         ElevatedButton(
  //             onPressed: () {
  //               Navigator.push(context,
  //                   MaterialPageRoute(builder: (context) => StartScreen()));
  //             },
  //             child: Text("Пропустить регистрацию"))
  //       ],
  //     ),
  //   );
  // }

//   void loginWithPhone() async {
//     auth.verifyPhoneNumber(
//       phoneNumber: _controller.text,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         await auth.signInWithCredential(credential).then((value) {
//           print("You are logged in successfully");
//         });
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         print(e.message);
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         otpVisibility = true;
//         verificationID = verificationId;
//         setState(() {});
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {},
//     );
//   }

//   void verifyOTP() async {
//     PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationID, smsCode: otpController.text);
//     await auth.signInWithCredential(credential).then((value) {
//       print("You are logged in successfully");
//       Fluttertoast.showToast(
//         msg: "You are logged in successfully",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.CENTER,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     });
//   }
// }