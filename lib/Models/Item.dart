class Item {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final double price;
  final String image;

  Item({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      categoryId: json['Category_id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
      image: json['image'],
    );
  }
}
