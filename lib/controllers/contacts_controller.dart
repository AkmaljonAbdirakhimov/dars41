import 'package:dars41/models/contact.dart';

class ContactsController {
  final List<Contact> _list = [
    Contact(
      name: "Tom",
      phone: "+998 90 123 56 67",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/en/f/f6/Tom_Tom_and_Jerry.png",
    ),
    Contact(
      name: "Jerry",
      phone: "+998 90 555 44 33",
      imageUrl:
          "https://upload.wikimedia.org/wikipedia/en/2/2f/Jerry_Mouse.png",
    ),
    Contact(
      name: "Spike",
      phone: "+998 88 777 66 55",
      imageUrl:
          "https://static.wikia.nocookie.net/tomandjerry/images/0/0f/Quiz-tom-jerry-richtig-03-1035-10110.png",
    ),
    Contact(
      name: "Sherlock Holmes",
      phone: "+998 XX XXX XX XX",
    ),
  ];

  List<Contact> get list {
    return [..._list];
  }

  void delete(int index) {
    _list.removeAt(index);
  }

  void add(String name, String phone, String? imageUrl) {
    _list.add(Contact(
      name: name,
      phone: phone,
      imageUrl: imageUrl,
    ));
  }

  void edit(
      {required int index,
      required String name,
      required String phone,
      String? imageUrl}) {
    _list[index].name = name;
    _list[index].phone = phone;
  }
}
