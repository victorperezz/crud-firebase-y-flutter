import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class EditNamePage extends StatefulWidget{
  const EditNamePage ({super.key});

  @override
  State<EditNamePage> createState() => EditNamePageState();
}

class EditNamePageState extends State<EditNamePage>{

  TextEditingController nameController = TextEditingController(text: "");




  @override
  Widget build(BuildContext context) {

    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];


    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit name'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
           TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificación',
              ),
            ),
            ElevatedButton(
              onPressed: () async{
                await updatePeople(arguments['uid'], nameController.text).then((_) {
                  Navigator.pop(context);
                });
            }, 
            child: const Text("Actualizar"))
          ],
        ),
      ),
    );
  }
}