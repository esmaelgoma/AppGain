import 'package:app_gain/modules/all_product.dart';
import 'package:app_gain/screens/movie_details.dart';
import 'package:app_gain/service/get_product.dart';
import 'package:flutter/material.dart';
class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {

  List<Result> allproduct = [];

  bool isloading = true;

  getAgeGroupData() async {
    AllProductsService serviceApi =  AllProductsService();
      await serviceApi.getAgeGroup();
      setState(() {
        allproduct = serviceApi.allproduct;
        isloading = false;
        print(allproduct);
      });

    }



    @override
  void initState() {
      getAgeGroupData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0.3,
        title:  const Text("Movie App",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic),),
    ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: isloading == true ? const Center(child: CircularProgressIndicator()): ListView.builder(
            itemCount: allproduct.length,
            itemBuilder: (context,index){
          return GestureDetector(
            onTap: ()
            {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  MovieDetails(id:allproduct[index].id ),),
              );},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40, // Image radius
                        backgroundImage: NetworkImage("http://image.tmdb.org/t/p/w500/${allproduct[index].backdropPath}"),
                      ),
                      const SizedBox(width: 20,),
                      Text(allproduct[index].originalTitle,
                        style: const TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black,
                  )
                ],
              ),
            ),
          );
        }),
      ) ,
    );
}
}





