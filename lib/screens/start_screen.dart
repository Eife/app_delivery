import 'package:flutter/material.dart';
import 'package:hmelnaya_lavka_app/utils/constant.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int _selectIndex = 0;
  void _onIndexTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      home: Scaffold(
        appBar: AppBar(title: Text("Хмельная лавка"),),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            unselectedIconTheme: IconThemeData(color: Colors.black, size: 18),
            selectedItemColor: Color.fromARGB(255, 198, 86, 178),
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedLabelStyle: TextStyle(color: Colors.black),
            currentIndex: _selectIndex,
            iconSize: 22,
            selectedFontSize: 14,
            onTap: _onIndexTapped,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Каталог", ),
              BottomNavigationBarItem(

                  icon: Icon(Icons.shopping_basket), label: "Корзина"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Любимые"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.admin_panel_settings), label: "Admin")
            ]),
        body: Center(
          child: bottomScreen[_selectIndex],
        ),
      ),
    );
  }
}
