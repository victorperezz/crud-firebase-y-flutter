import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';

class AddNamePage extends StatefulWidget{
  const AddNamePage ({super.key});

  @override
  State<AddNamePage> createState() => AddNamePageState();
}

class AddNamePageState extends State<AddNamePage>{

  TextEditingController nameController = TextEditingController(text: "");




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add name'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
           TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el nuevo nombre',
              ),
            ),
            ElevatedButton(
              onPressed: () async{
              await addPeople(nameController.text).then((_) {
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              });
            }, 
            child: const Text("Guardar"))
          ],
        ),
      ),
    );
  }
}