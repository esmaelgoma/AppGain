import 'package:flutter/material.dart';
import 'package:app_gain/modules/product.dart';

import '../service/get_product.dart';

class MovieDetails extends StatefulWidget {
   int id;
   MovieDetails({super.key,required this.id});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {

  late Product productdetails;
  bool isloading = true;

  getAgeGroupData() async {
    AllProductsService serviceApi =  AllProductsService();
    await serviceApi.getproductDetails(widget.id);
    setState(() {
      productdetails = serviceApi.productdetails;
      isloading = false;
      print(productdetails);
    });

  }

  @override
  void initState() {
    getAgeGroupData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  ListView(
        children: [
          Container(
            margin:const EdgeInsets.symmetric(vertical: 100,horizontal: 10),
            child:   isloading == true ? const Center(child: CircularProgressIndicator()):Card(
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      child: Image.network(
                      "http://image.tmdb.org/t/p/w500/${productdetails.backdropPath}",
                          width: double.maxFinite,
                          height: 250,
                          fit:BoxFit.fill

                      ),
                    ),
                     const SizedBox(height: 20),
                     ListTile(
                      title: Text(productdetails.originalTitle,
                        style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(productdetails.overview),

                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 15,bottom: 15),
                      child: Container(
                        child: Text(productdetails.originalLanguage,
                          style: const TextStyle(fontSize: 30,fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



