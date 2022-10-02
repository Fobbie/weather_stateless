import 'package:flutter/material.dart';

void main() => runApp(const MyWeather());

class MyWeather extends StatelessWidget {
  const MyWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Weather",
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                stops: [0.3, 0.8],
                colors: [Colors.black, Colors.blue],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
            color: Colors.blue,
          ),
          actions: [
            IconButton(
              alignment: Alignment.centerLeft,
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: _buildBody(), backgroundColor: Colors.indigo[200],
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      
      child: Column(
        
        children: [
          _headerImage(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _weatherDescription(),
                  const Divider(),
                  _temperature(),
                  const Divider(),
                  _temperatureForecast(),
                  const Divider(),
                  _footerRatings(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Image _headerImage() {
    return const Image(
      image: NetworkImage(
        'https://img4.goodfon.ru/original/800x480/e/c5/priroda-oblaka-solnyshko-iasnaia-pogoda.jpg',
      ),
      fit: BoxFit.cover,
    );
  }

  Column _weatherDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Text(
          'Saturday - October 2',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        Divider(),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque odio ligula, sagittis ut mi vel, tincidunt porttitor urna. Proin eu pretium diam. Curabitur gravida diam volutpat, fermentum nunc nec, accumsan odio.',
          style: TextStyle(color: Colors.black54),
        ),
      ],
    );
  }

  Row _temperature() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Icon(
              Icons.wb_sunny,
              color: Colors.yellow,
            ),
          ],
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: const <Widget>[
                Text(
                  '15 Clear',
                  style: TextStyle(color: Colors.deepPurple),
                ),
              ],
            ),
            Row(
              children: const <Widget>[
                Text(
                  'Galati, Romania',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Wrap _temperatureForecast() {
    return Wrap(
      spacing: 10.0,
      children: List.generate(8, (int index) {
        return Chip(
          label: Text(
            '${index + 20}C',
            style: const TextStyle(fontSize: 15.0),
          ),
          avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      }),
    );
  }

  Row _footerRatings() {
    var stars = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
        Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
        Icon(Icons.star, size: 15.0, color: Colors.yellow[600]),
        const Icon(Icons.star, size: 15.0, color: Colors.black),
        const Icon(Icons.star, size: 15.0, color: Colors.black),
      ],
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Info with openweathermap.org',
          style: TextStyle(fontSize: 15.0),
        ),
        stars,
      ],
    );
  }
}
