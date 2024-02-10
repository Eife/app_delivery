import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _count = TextEditingController(text: "ltr");
  TextEditingController _images = TextEditingController(text: "");
  TextEditingController _price = TextEditingController(text: "10");
  TextEditingController _collection = TextEditingController();

  void goNext() {
    setState(() {
      Fluttertoast.showToast(msg: "Load");
      _name = TextEditingController();
      _description = TextEditingController();
      _count = TextEditingController(text: "0");
      _images = TextEditingController(text: "");
      _price = TextEditingController(text: "10");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Panel"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Название коллекции",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _collection,
                validator: (value) => validator(value)),
            Text(
              "Название",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _name,
                validator: (value) => validator(value)),
            Text(
              "Описание",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _description,
                validator: (value) => validator(value)),
            Text(
              "Цена (По умолчанию 0)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                keyboardType: TextInputType.number,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _price,
                validator: (value) => validator(value)),
            Text(
              "Количество",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(

                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _count,
                validator: (value) => validator(value)),
            Text(
              "Фотография",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _images,
                validator: (value) => validator(value)),
            ElevatedButton(
                onPressed: () async {
                  await FirebaseFirestore.instance.collection(_collection.text).add({
                    "name": "${_name.text}",
                    "description": "${_description.text}",
                    "price": "${_price.text}",
                    "count": "${_count.text}",
                    "images": "${_images.text}"
                  });
                  goNext();
                },
                child: Text("Добавить в библиотек"))
          ],
        ).paddingAll(16),
      ),
    );
  }
}

String? validator(value) {
  if (value == null || value.isEmpty) {
    return "Please enter value";
  } else {
    return null;
  }
}
