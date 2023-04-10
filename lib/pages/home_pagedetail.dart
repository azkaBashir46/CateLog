import 'package:catelog/pages/Model/item_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
class HomeDetailPage extends StatelessWidget {
  final ItemModel itemModel;

  const HomeDetailPage({super.key, required this.itemModel});
  

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.blue[100],
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${itemModel.price}".text.bold.xl.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    // MyTheme.darkBluishColor,
                    Colors.black12
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Buy".text.make(),
            ).wh(100, 40)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(itemModel.id.toString()),
              child: Image.network("${itemModel.image}"),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    itemModel.title.text.xl2.maxLines(1)
                        // .color(MyTheme.darkBluishColor)
                        .color(Colors.black12)
                        .bold.pink700
                        .make(),
                    itemModel.description.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox.color(Colors.black12),
                  ],
                ).py64().px24()
              ),
            ))
          ],
        ),
      ),
    );
  }
}