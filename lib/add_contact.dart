import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/contact_list_provider.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final mobileNoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Contacts'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            spacing: 10,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    label: Text('Name'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              TextFormField(
                controller: mobileNoController,
                decoration: InputDecoration(
                    label: Text('Mobile no'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<ContactListProvider>().addData({
                      'name': nameController.text,
                      'mobileNo': mobileNoController.text
                    });

                    setState(() {
                      nameController.text = '';
                      mobileNoController.text = '';
                    });

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Contact added!'),
                      duration: Duration(seconds: 1),
                      backgroundColor: const Color.fromARGB(255, 32, 161, 35),
                      behavior: SnackBarBehavior.floating,
                    ));
                  },
                  child: Text('Add contact'))
            ],
          ),
        ),
      ),
    );
  }
}
