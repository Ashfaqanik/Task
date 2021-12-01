import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ftask/model/product_model.dart';
import 'package:ftask/pages/product_detail_page.dart';
import 'package:ftask/repo/product_repo.dart';

class ProductsPage extends StatefulWidget {

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int count=0;
  AllProductsRepo allProductsRepo=AllProductsRepo();
  List<Products> products=[];

  Future<void> fetch()async{
    var result= await allProductsRepo.readJson();
    products=result;
  }
  @override
  Widget build(BuildContext context) {
    if(count==0){
      fetch();
    }
    print(products.length);
    return Scaffold(
      backgroundColor:  Colors.white24,
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white10, // Navigation bar
          statusBarColor: Colors.white10, // Status bar
        ),
        backgroundColor: Colors.white10,
        title: const Text("Home",style: TextStyle(color: Colors.white)),
      ),
      body: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: products.length,
        crossAxisCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Card(products[index]);
        },
        staggeredTileBuilder: (int index) =>
        const StaggeredTile.fit(1),
        mainAxisSpacing: 6.0,

      ),
    );
  }

  Widget Card(Products products){
    final size= MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 5,right: 5,top: 5),
      child: SizedBox(
        //width: getProportionateScreenWidth(widget.width),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return ProductDetails(imageUrl: products.photo!,name: products.name,desc:products.description,price: products.price);
                }));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height*.23,
                      width: size.width,
                      child: Image.asset(products.photo!),
                    ),
                    const SizedBox(height: 3),
                    Center(
                      child: Text(
                        products.name!,
                        style: TextStyle(color: Colors.black,fontSize: size.width*.042),
                        maxLines: 2,
                      ),
                    ),
              ],
            ),
            ]
          ),
        ),
      ),
    ));
  }
}
