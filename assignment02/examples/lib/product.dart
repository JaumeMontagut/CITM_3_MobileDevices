class Product {
  String name, description, location, imagePath;
  List<double> sizes;
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
        price = json['price'].toDouble(),
        sizes = json['sizes'].cast<double>(),
        imagePath = json['imagePath'],
        inCart = json['inCart'];
}