class Product {
  String name, description, location, imagePath;
  List<int> sizes;
  double price;

  Product(
    this.name,
    this.description,
    this.location,
    this.sizes,
    this.price,
    this.imagePath
  );
}

final Product redShirt = Product(
  'Red shirt',
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce bibendum augue ac ex finibus dapibus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque suscipit suscipit facilisis. Quisque et aliquam tellus. Duis lorem arcu, euismod eu consequat tincidunt, mattis placerat ligula. Phasellus condimentum nibh urna, sit amet scelerisque urna pretium eu. Morbi vitae elit pharetra, interdum nulla sit amet, luctus arcu. Mauris eu massa et turpis fringilla pretium. Phasellus quis diam sed lectus semper hendrerit eget ac enim. Mauris luctus faucibus nibh et dictum. Etiam viverra vitae mi sit amet egestas. Vestibulum nec felis quam. Morbi condimentum nunc sit amet mi ullamcorper malesuada. Suspendisse at ante neque. Nullam quis molestie dui, quis elementum orci.',
  'New Lane 129, CA',
  [31, 32, 33, 34, 35],
  80,
  'assets/images/clothes.png'
);
