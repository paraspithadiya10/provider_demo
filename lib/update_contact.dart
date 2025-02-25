import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/contact_list_provider.dart';

class UpdateContact extends StatefulWidget {
  const UpdateContact(
      {super.key,
      required this.name,
      required this.mobileNo,
      required this.index});

  final String name;
  final String mobileNo;
  final int index;

  @override
  State<UpdateContact> createState() => _UpdateContactState();
}

class _UpdateContactState extends State<UpdateContact> {
  final nameController = TextEditingController();
  final mobileNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    mobileNoController.text = widget.mobileNo;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Contact'),
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
                    context.read<ContactListProvider>().updateData({
                      'name': nameController.text,
                      'mobileNo': mobileNoController.text
                    }, widget.index);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Contact added!'),
                      duration: Duration(seconds: 1),
                      backgroundColor: const Color.fromARGB(255, 32, 161, 35),
                      behavior: SnackBarBehavior.floating,
                    ));
                  },
                  child: Text('Update contact'))
            ],
          ),
        ),
      ),
    );
  }
}
