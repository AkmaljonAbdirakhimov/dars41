import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactAddDialog extends StatefulWidget {
  const ContactAddDialog({super.key});

  @override
  State<ContactAddDialog> createState() => _ContactAddDialogState();
}

class _ContactAddDialogState extends State<ContactAddDialog> {
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String phone = "";
  String? imageUrl;

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
          child: const Text("Add"),
        ),
      ],
    );
  }
}
