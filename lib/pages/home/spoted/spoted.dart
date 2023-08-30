import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shynder/componentes/alert.dart';
import 'package:shynder/pages/home/profile/edit.dart';
import 'package:shynder/pages/home/profile/profile.dart';
import 'package:shynder/pages/home/spoted/comments.dart';
import 'package:url_launcher/url_launcher.dart';

class Spoted extends StatefulWidget {
  const Spoted({Key? key}) : super(key: key);

  @override
  State<Spoted> createState() => _SpotedState();
}

class _SpotedState extends State<Spoted> {
  GoogleMapController? _googleMapController;

  List<String> list = [
    "Achei esse gato Achei esse gatoAchei esse gatoAchei esse gatoAchei esse gatoAchei esse gatoAchei esse gatoAchei esse gato Achei esse gato Achei esse gato Achei esse gato Achei esse gato Achei esse gato Achei esse gato Achei esse gato Achei esse gato Achei esse gato Achei esse gato uiuiuiuiuiuiuiuiuiuiuiuiuiuiuiuiuiuiu",
    "Achei essa gata",
    "fodace essa porra",
  ];
  bool yoursSpoteds = false;

  buildActionButton() {
    return Container(
      child: IconButton(
        iconSize: 35,
        onPressed: () {
          setState(() {});
        },
        icon: Icon(Icons.filter_alt_rounded),
      ),
    );
  }

  Widget buildListItems(description, title) {
    Set<Circle> circles = Set.from([
      Circle(
        fillColor: Color.fromARGB(131, 104, 58, 183),
        strokeWidth: 0,
        circleId: CircleId("1"),
        center: LatLng(-22.75075075, -47.31588364),
        radius: 200,
      )
    ]);
    return Card(
      child: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 40,
                  height: 40,
                  child: Image.network(
                    "https://static.poder360.com.br/2021/07/faustao.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile(false)),
                );
              },
              title: Text('Fausto Silva'),
              subtitle: Text('Visto há 10 km de você'),
            ),
            Text(title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
            SizedBox(height: 10),
            AutoSizeText(
              description,
              maxLines: 2,
              style: TextStyle(fontSize: 18),
              overflowReplacement: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2),
                  InkWell(
                    child: Text(
                      "Leia mais",
                      style: TextStyle(color: Colors.blue),
                    ),
                    onTap: () {
                      showAlert(context, title: title, content: description);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 20,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        tabs: [
                          Tab(text: "Foto"),
                          Tab(text: "Mapa"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: TabBarView(
                          children: [
                            Image.network(
                              "https://static.poder360.com.br/2021/07/faustao.png",
                              fit: BoxFit.cover,
                            ),
                            Stack(
                              children: <Widget>[
                                GoogleMap(
                                  compassEnabled: false,
                                  zoomControlsEnabled: false,
                                  rotateGesturesEnabled: false,
                                  myLocationButtonEnabled: false,
                                  initialCameraPosition: CameraPosition(
                                      target:
                                          LatLng(-22.75075075, -47.31588364),
                                      zoom: 16.0),
                                  onMapCreated: (controler) {
                                    this._googleMapController = controler;
                                  },
                                  circles: circles,
                                ),
                                IconButton(
                                  iconSize: 35,
                                  onPressed: () async {
                                    String googleUrl =
                                        'https://www.google.com/maps/search/?api=1&query=-22.75075075,-47.31588364';
                                    if (await canLaunchUrl(
                                        Uri.parse(googleUrl))) {
                                      await launchUrl(Uri.parse(googleUrl));
                                    } else {
                                      throw 'Could not open the map.';
                                    }
                                  },
                                  color: Colors.black,
                                  icon: Icon(Icons.map_sharp),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Ver Comentários'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Comments()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Spoteds perto de você!!"),
        actions: [
          IconButton(
            iconSize: 35,
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      CheckboxListTile(
                        title: const Text('Seus Spoteds'),
                        value: this.yoursSpoteds,
                        onChanged: (value) {
                          setState(() {
                            this.yoursSpoteds = !this.yoursSpoteds;
                          });
                        },
                      ),
                    ],
                  );
                },
              );
            },
            color: Colors.white,
            icon: Icon(Icons.filter_alt_outlined, size: 30),
          ),
        ],
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: list
            .map((e) => buildListItems(e,
                "gato bunito e charmoso aiaiiaiaiaiaiaiaiaiaiiaiaiaiaiaiaiaiaiaiai"))
            .toList(),
      ),
    );
  }
}
