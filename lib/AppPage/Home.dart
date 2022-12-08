import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebasepractice/Model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Image> img = [
    Image.network("https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
        fit: BoxFit.fill),
    Image.network("https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
        fit: BoxFit.fill),
    Image.network(
        "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
        fit: BoxFit.fill),
    Image.network(
        "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
        fit: BoxFit.fill),
    Image.network(
        "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
        fit: BoxFit.fill),
  ];

  @override
  Widget build(BuildContext context) {
    double statusbar = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: statusbar),
        child: Column(
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
              child: CarouselSlider.builder(
                  itemCount: img.length,
                  itemBuilder: (context, index, realIndex) {
                    return img[index];
                  },
                  options: CarouselOptions(
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlay: true,
                      reverse: false,
                      height: 200)),
              color: Colors.white,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
