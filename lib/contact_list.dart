import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/add_contact.dart';
import 'package:provider_demo/change_theme_provider.dart';
import 'package:provider_demo/contact_list_provider.dart';
import 'package:provider_demo/update_contact.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
        centerTitle: true,
        actions: [
          Consumer<ChangeThemeProvider>(builder: (_, provider, __) {
            bool isDark = provider.getThemeMode;
            return Switch(
                value: isDark,
                onChanged: (value) => provider.changeThemeMode(value));
          })
        ],
      ),
      body: Consumer<ContactListProvider>(builder: (_, provider, __) {
        List<Map<String, dynamic>> contactData = provider.getData();
        return ListView.builder(
            itemCount: contactData.length,
            itemBuilder: (context, index) {
              var name = contactData[index]['name'];
              var mobileNo = contactData[index]['mobileNo'];

              return provider.getData().isNotEmpty
                  ? ListTile(
                      title: Text('$name'),
                      subtitle: Text('$mobileNo'),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UpdateContact(
                                                name: name,
                                                mobileNo: mobileNo,
                                                index: index,
                                              )));
                                },
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  context
                                      .read<ContactListProvider>()
                                      .removeData(index);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))
                          ],
                        ),
                      ),
                    )
                  : Center(
                      child: Text('No data'),
                    );
            });
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddContact()));
        },
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}
