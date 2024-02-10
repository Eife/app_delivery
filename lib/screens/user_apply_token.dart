import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VerificationScreen(),
    );
  }
}

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  List<TextEditingController> controllers = List.generate(6, (_) => TextEditingController());
  List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

  @override
  void initState() {
    super.initState();
    focusNodes.first.requestFocus(); // Set focus to the first text field initially
    for (int i = 0; i < focusNodes.length; i++) {
      focusNodes[i].addListener(() {
        if (focusNodes[i].hasFocus && controllers[i].text.isNotEmpty) {
          // Move focus to the next text field when the current one is filled
          if (i + 1 < focusNodes.length) focusNodes[i + 1].requestFocus();
        }
      });
    }
  }

  @override
  void dispose() {
    controllers.forEach((controller) => controller.dispose());
    focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Verification Code')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            return SizedBox(
              width: 40,
              child: TextField(
                controller: controllers[index],
                focusNode: focusNodes[index],
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                maxLength: 1,
                decoration: InputDecoration(
                  counterText: "",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty && index + 1 < focusNodes.length) {
                    focusNodes[index + 1].requestFocus();
                  }
                  if (value.isEmpty && index - 1 >= 0) {
                    focusNodes[index - 1].requestFocus();
                  }
                },
                // onEditingComplete: () {
                //   final registerBloc = BlocProvider.of<RegisterBloc>(context);
                //   registerBloc.add(VerifySentOtpEvent(
                //             phone: verificationID, token: otpController.text));
                // },
                
              ),
            );
          }),
        ),
      ),
    );
  }
}
