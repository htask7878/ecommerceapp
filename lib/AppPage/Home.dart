import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebasepractice/Model.dart';
import 'package:firebasepractice/class/product_api_class.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<product> pl = [];

  Future getData() async {
    var url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    List list = jsonDecode(response.body);
    list.forEach((element) {
      pl.add(product.fromJson(element));
    });
    return pl;
  }

  @override
  Widget build(BuildContext context) {
    double statusBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusBar),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Center(
                        child: Text(
                          "Shop".toUpperCase(),
                          style: TextStyle(
                              fontSize: 25,
                              color: Model.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                      IconButton(onPressed: () {}, icon: Icon(Icons.search))
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return CarouselSlider.builder(
                            itemCount: pl.length,
                            itemBuilder: (context, index, realIndex) {
                              return Image(
                                fit: BoxFit.contain,
                                image: NetworkImage("${pl[index].image}"),
                              );
                            },
                            options: CarouselOptions(
                                autoPlayCurve: Curves.fastOutSlowIn,
                                autoPlay: true,
                                reverse: false,
                                height: 200));
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
