class Product {
  String name, description, location, imagePath;
  List<int> sizes;
  double price;
  bool inCart;

  Product(this.name, this.description, this.location, this.sizes, this.price, this.imagePath)
  {
    inCart = false;
  }

  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        description = json['description'],
        location = json['location'],
        sizes = json['sizes'],
        price = json['price'],
        imagePath = json['imagePath'],
        inCart = json['inCart'];
}