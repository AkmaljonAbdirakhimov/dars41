import 'package:dars41/controllers/contacts_controller.dart';
import 'package:dars41/models/contact.dart';
import 'package:dars41/views/widgets/contact_add_dialog.dart';
import 'package:dars41/views/widgets/contact_edit_dialog.dart';
import 'package:dars41/views/widgets/contact_item.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final contactsController = ContactsController();

  void onDelete(int index) {
    contactsController.delete(index);
    setState(() {});
  }

  void onEdit(Contact contact, int index) async {
    Map<String, dynamic>? data = await showDialog(
      context: context,
      builder: (ctx) {
        return ContactEditDialog(contact: contact);
      },
    );

    if (data != null) {
      contactsController.edit(
        index: index,
        name: data['name'],
        phone: data['phone'],
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Contacts"),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, dynamic>? data = await showDialog(
                context: context,
                builder: (ctx) {
                  return const ContactAddDialog();
                },
              );

              if (data != null) {
                contactsController.add(
                  data['name'],
                  data['phone'],
                  data['imageUrl'],
                );
                setState(() {});
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contactsController.list.length,
        itemBuilder: (ctx, index) {
          return ContactItem(
              contact: contactsController.list[index],
              onDelete: () {
                onDelete(index);
              },
              onEdit: () {
                onEdit(contactsController.list[index], index);
              });
        },
      ),
    );
  }
}
