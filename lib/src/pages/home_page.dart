import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Películas en cines'),
        backgroundColor: Colors.indigoAccent,
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [_swiperTarjetas()],
        ),
      ),
    );
  }

  _swiperTarjetas() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 300,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "https://picsum.photos/350/150?image=167",
            fit: BoxFit.fill,
          );
        },
        itemCount: 3,
        layout: SwiperLayout.STACK,
        itemWidth: 200,
        // pagination: new SwiperPagination(),
        // control: new SwiperControl(),
      ),
    );
  }
}
