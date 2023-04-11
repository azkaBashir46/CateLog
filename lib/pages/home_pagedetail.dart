import 'package:catelog/Widget/themes.dart';
import 'package:catelog/pages/Model/item_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
class HomeDetailPage extends StatelessWidget {
  final ItemModel itemModel;

  const HomeDetailPage({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${itemModel.price}".text.bold.xl.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    MyTheme.darkBluishColor
                    
                  ),
                  shape: MaterialStateProperty.all(
                    StadiumBorder(),
                  )),
              child: "Add to Cart".text.make(),
            ).wh(120, 40)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(itemModel.id.toString()),
              child: Image.network("${itemModel.image}").backgroundColor(context.canvasColor).wOneThird(context).hOneThird(context),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 40.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    itemModel.title.text.xl2.maxLines(1).overflow(TextOverflow.ellipsis).align(TextAlign.center)
                        .color(context.accentColor)
                        .bold
                        .make(),
                    10.heightBox,
                    itemModel.description.text.maxLines(4).textStyle(context.captionStyle).align(TextAlign.justify).xl.make().py32(),

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