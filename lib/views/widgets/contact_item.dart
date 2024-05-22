import 'package:dars41/models/contact.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Contact contact;
  final Function() onDelete;
  final Function() onEdit;
  const ContactItem({
    super.key,
    required this.contact,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: contact.imageUrl!.startsWith("http")
            ? NetworkImage(contact.imageUrl!)
            : AssetImage(contact.imageUrl!),
      ),
      title: Text(contact.name),
      subtitle: Text(contact.phone),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              onEdit();
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {
              onDelete();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
