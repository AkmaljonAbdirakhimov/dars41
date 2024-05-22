class Contact {
  String name;
  String phone;
  final String? imageUrl;

  Contact({
    required this.name,
    required this.phone,
    this.imageUrl = "assets/image.png",
  });
}
