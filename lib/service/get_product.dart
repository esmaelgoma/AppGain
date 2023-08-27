
import 'dart:convert';

import 'package:app_gain/modules/all_product.dart';
import 'package:app_gain/modules/product.dart';
import 'package:dio/dio.dart';

class AllProductsService {

  List<Result> allproduct = [];
  late Product productdetails;

  Future<void> getAgeGroup() async {
    String url = "https://api.themoviedb.org/3/movie/popular";
    Response response = await Dio().get(url,
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Accept": "application/json",
            'Content-Type': 'multipart/form-data',
            'Authorization' : 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZjY3YTJiYTczMmM0Y2U3YmU3MDkzMjczYTZjZGVlYSIsInN1YiI6IjY0ZTdjZmE5NTk0Yzk0MDEzOWM4MjFjNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.G9k49aEMc-sKyn4ilQXqZpepkj8Lf-pSNxG2W8N5cGo'
          },
        )
    );
    AllProduct data =  AllProduct.fromJson(response.data);
    allproduct = data.results;
  }

  Future<void> getproductDetails(int id) async {
    String url = "https://api.themoviedb.org/3/movie/$id";
    Response response = await Dio().get(url,
        options: Options(
          validateStatus: (status) => true,
          headers: {
            "Accept": "application/json",
            'Content-Type': 'multipart/form-data',
            'Authorization' : 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyZjY3YTJiYTczMmM0Y2U3YmU3MDkzMjczYTZjZGVlYSIsInN1YiI6IjY0ZTdjZmE5NTk0Yzk0MDEzOWM4MjFjNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.G9k49aEMc-sKyn4ilQXqZpepkj8Lf-pSNxG2W8N5cGo'
          },
        )
    );
    Product data = Product.fromJson(response.data);
    productdetails = data;
  }
}
