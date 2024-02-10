//page to registration e-mail

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hmelnaya_lavka_app/utils/style.dart';
// import 'package:nb_utils/nb_utils.dart';


// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});

//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   TextEditingController _name = TextEditingController();
//   TextEditingController _phoneNumber = TextEditingController();
//   TextEditingController _password = TextEditingController();
//   TextEditingController _email = TextEditingController();

//   String? _validate(value) {
//     if (value == null || value.isEmpty) {
//       return "Ошибка ввода";
//     } return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//           24.height,
//           boldText(18, "Хмельная лавка приветствует Вас!").center(),
//           boldText(16, "Пройдите регистрацию для продолжения").center(),
//           24.height,
       
//           TextField(
//             decoration: InputDecoration(label: Text("Введите ваше имя"), border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//             controller: _name,
            
//           ).paddingBottom(4),
//           TextField(
//             decoration: InputDecoration(label: Text("Телефон для связи"), border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//             keyboardType: TextInputType.phone,
//             controller: _phoneNumber,
//           ).paddingBottom(4),
//           TextField(
//             decoration: InputDecoration(label: Text("Электронный ящик"), border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//             controller: _email,
//           ).paddingBottom(4),
//           TextField(
//             decoration: InputDecoration(label: Text("Пароль"), border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
//             controller: _password,
//           ).paddingBottom(4),
//           ElevatedButton(
//               onPressed: () async {
//                 try {
//                   final UserCredential userCredential = await FirebaseAuth
//                       .instance
//                       .createUserWithEmailAndPassword(
//                           email: _email.text, password: _password.text);
//                 } on FirebaseAuthException catch (e) {
//                   if (e.code == "weak-password") {
//                     print("Password provided is too weak");
//                   } else if (e.code == "email-already-in-use") {
//                     print("The account already exist for that email");
//                   }
//                 } catch (e) {
//                   print(e);
//                 }
//               },
//               child: Text("Зарегестрироваться")),
//           ElevatedButton(
//               onPressed: () async {
//                 try {
//                   final UserCredential userCredential =
//                       await FirebaseAuth.instance.signInWithEmailAndPassword(
//                     email: _email.text,
//                     password: _password.text,
//                   );
//                 } on FirebaseAuthException catch (e) {
//                   if (e.code == 'user-not-found') {
//                     print('No user found for that email.');
//                   } else if (e.code == 'wrong-password') {
//                     print('Wrong password provided for that user.');
//                   } 
//                 } catch (e) { print("$e EEE");}
//               },
//               child: Text("Проверить регистрацию")),
//           18.height,
//           ElevatedButton(
//               onPressed: () {
//                 FirebaseAuth.instance.authStateChanges().listen((User? user) {
//                   if (user == null) {
//                     print("User is currently signed out!");
//                   } else {
//                     print("User is signed in");
//                   }
//                 });
//               },
//               child: Text("Check auth")),
//         ]),
//       ),
//     );
//   }
// }
