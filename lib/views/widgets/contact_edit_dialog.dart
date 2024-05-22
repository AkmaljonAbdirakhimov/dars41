import 'package:dars41/models/contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactEditDialog extends StatefulWidget {
  final Contact contact;
  const ContactEditDialog({super.key, required this.contact});

  @override
  State<ContactEditDialog> createState() => _ContactEditDialogState();
}

class _ContactEditDialogState extends State<ContactEditDialog> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String phone = "";
  String? imageUrl;

  @override
  void initState() {
    super.initState();

    name = widget.contact.name;
    phone = widget.contact.phone;
    imageUrl = widget.contact.imageUrl;
  }

  void add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pop(context, {
        "name": name,
        "phone": phone,
        "imageUrl": imageUrl,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Contact"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: name,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Name",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter name";
                }

                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  name = newValue;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: phone,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Phone",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Please enter phone";
                }

                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  phone = newValue;
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              initialValue: imageUrl,
              keyboardType: TextInputType.url,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Image URL",
                prefixIcon: Icon(
                  CupertinoIcons.globe,
                ),
              ),
              onSaved: (newValue) {
                if (newValue != null) {
                  imageUrl = newValue;
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: add,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          child: const Text("Edit"),
        ),
      ],
    );
  }
}
