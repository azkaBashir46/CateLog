import 'package:catelog/Widget/home_widgets/catalog_header.dart';
// import 'package:catelog/core/store.dart';
import 'package:catelog/pages/Model/cart.dart';
import 'package:catelog/pages/Model/item_product.dart';
import 'package:catelog/pages/home_pagedetail.dart';
import 'package:catelog/services/item_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

import 'home_widgets/catalog_image.dart';
class ItemWidget extends StatefulWidget {
  
  const ItemWidget({super.key});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}
class _ItemWidgetState extends State<ItemWidget> {
  late List <ItemModel>? itemModel=[];
  bool isLoader=false;

  getData() async{
   itemModel=await ResponseServices().getProducts();
   print("fff$itemModel");
   if(itemModel!=null){
    setState(() {
      isLoader=true;
    });
   }
   else{
    throw Exception("Error");
   }
   
  }
  @override
  void initState() {
    getData();
  //  apiCall();
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // final cart = (VxState.store as MyStore).cart;

   return Scaffold(
        backgroundColor: context.canvasColor,
         floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
          // Add your onPressed code here!
        },
        // backgroundColor: context.floatingActionButtonTheme,
        child: const Icon(Icons.card_travel_sharp),
      ),
        // floatingActionButton: VxBuilder(
        //   mutations:  {AddMutation, RemoveMutation},
        //   builder: (ctx, _) async => FloatingActionButton(
        //     onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        //     backgroundColor: context.theme.buttonColor,
        //     child: Icon(
        //       CupertinoIcons.cart,
        //       color: Colors.white,
        //     ),
        //   ).badge(
        //       color: Vx.gray200,
        //       size: 22,
        //       count: cart.items.length,
        //       textStyle: TextStyle(
        //         color: Colors.black,
        //         fontWeight: FontWeight.bold,
        //       )),
        // ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (itemModel != null && itemModel!.isNotEmpty)
                !context.isMobile? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20.0),
            shrinkWrap: true,
            itemCount: itemModel?.length,
            itemBuilder: (context, index) {
              final catalog = itemModel![index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>HomeDetailPage(itemModel: catalog)
                  ),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: itemModel?.length,
            itemBuilder: (context, index) {
              final catalog = itemModel![index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailPage(itemModel: catalog),
                  ),
                ),
                child: CatalogItem(catalog: catalog),
              );
            },
          ).py16().expand()


                       // CatalogList().py16().expand()
                else
                  const CircularProgressIndicator().centered().expand(),
              ],
            ),
          ),
        ));
  }
}
class CatalogItem extends StatelessWidget {
  final ItemModel catalog;
   const CatalogItem({super.key ,required this.catalog});
     @override
  Widget build(BuildContext context) {
    var children2 = [
      Hero(
        tag: Key(catalog.id.toString()),
        child: CatalogImage(
          image: "${catalog.image}",
        ),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.title.text.lg.color(context.accentColor).bold.maxLines(1).overflow(TextOverflow.ellipsis).make(),
            catalog.description.text.textStyle(context.captionStyle).maxLines(3).make(),
            10.heightBox
            // ButtonBar(
            //   alignment: MainAxisAlignment.spaceBetween,
            //   buttonPadding: EdgeInsets.zero,
            //   children: [
            //     "\$${catalog.price}".text.bold.xl.make(),
            //     // AddToCart(catalog: catalog)
            //   ],
            // ).pOnly(right: 8.0)
          ],
        ).p(context.isMobile ? 0 : 16),
      )
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    ).color(context.cardColor).rounded.square(150).make().py16();
  }}