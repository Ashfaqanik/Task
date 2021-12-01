import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductDetails extends StatefulWidget {
  String? imageUrl, name,desc,price;

  ProductDetails({this.imageUrl, this.name,this.desc,this.price});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Colors.white24,
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white10, // Navigation bar
          statusBarColor: Colors.white10, // Status bar
        ),
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: size.height * .08,
        title: const Text(
          'Product Details',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.white10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Container(
                    height: size.height * .25,
                    width: size.width,
                    child: Image.asset(widget.imageUrl!)),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.name ?? '',
                        style: TextStyle(
                            fontSize: size.width * .045,
                            fontWeight: FontWeight.normal,
                            color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.desc ?? '',
                    style: TextStyle(
                        fontSize: size.width * .043,
                        fontWeight: FontWeight.normal,
                        color: Colors.white)),
              ),
              const SizedBox(
                height: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 6),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Price: ৳' '${widget.price}',
                        style: TextStyle(
                            fontSize: size.width * .043,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(
                height: 15
              ),
              InkWell(
                onTap: (){
                  showInSnackBar('This product price is: ৳${widget.price}');
                },
                child: Container(
                  height: 40,width: 90,
                  decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)
                    ),
                  ),
                  child: Center(child: Text('Buy',style: TextStyle(color: Colors.white,
                      fontWeight: FontWeight.bold,fontSize: size.width*0.048),)),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(value),backgroundColor: Colors.blueGrey,));
  }
}
