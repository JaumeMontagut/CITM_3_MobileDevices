import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examples/Model/product.dart';
import 'package:examples/Pages/productPage.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:typed_data';
import 'package:examples/Helpers/TextStyles.dart';

final Uint8List kTransparentImage = new Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

class SelectProductPage extends StatelessWidget {
  SelectProductPage(this.itemCount);
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<List<Product>>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Suiter',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(15.0),
          child: Text(
            'A suit for every occasion',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.grey[200]),
            textAlign: TextAlign.left,
            //align left
          ),
        ),
      ),
      body: StaggeredGridView.countBuilder(
        primary: false,
        crossAxisCount: 4,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        itemBuilder: (context, index) => new _Tile(products[index]),
        staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
        itemCount: itemCount,
        // body: Scrollbar(
        //   child:
        // GridView.builder(
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 2,
        //   ),
        //   itemCount: products.length,
        //   itemBuilder: (context, index) {
        //     return Card(
        //       child: InkWell(
        //         onTap: () {
        //           Navigator.of(context).push(
        //             MaterialPageRoute(
        //               builder: (context) => ProductPage(index),
        //             ),
        //           );
        //         },
        //         child: Center(
        //           child: Stack(
        //             children: <Widget>[
        //               Image.asset(
        //                 products[index].imagePath,
        //               ),
        //               Column(
        //                 children: <Widget>[
        //                   SizedBox(
        //                     height: 150,
        //                   ),
        //                   Text(
        //                     products[index].name,
        //                     textAlign: TextAlign.right,
        //                   )
        //                 ],
        //               ),
        //             ],
        //           ),
        //         ),
        //       ),
        //     );
        //   },
        // ),
        //),
      ),
    );
  }
}

class _Tile extends StatelessWidget {

  double cardWidth;
  _Tile(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      //cardWidth = context.size.width
      child: Stack(
        overflow: Overflow.clip,
        children: <Widget>[
          //new Center(child: new CircularProgressIndicator(),),
          Center(
            child: FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: product.imagePath,
            ),
          ),
          Positioned(
            top: 5,
            left: 5,
             child: Container(
               width: context.size.width,
              child: Text(
                product.name,
                maxLines: 100,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
