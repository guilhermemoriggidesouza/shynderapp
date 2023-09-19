import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shynder/componentes/AnimatedButton.dart';
import 'package:shynder/componentes/input.dart';

class CreateSpoted extends StatefulWidget {
  const CreateSpoted({Key? key}) : super(key: key);

  @override
  State<CreateSpoted> createState() => _CreateSpotedState();
}

class _CreateSpotedState extends State<CreateSpoted> {
  GoogleMapController? _googleMapController;
  Marker markers = Marker(
    draggable: true,
    markerId: MarkerId("1"),
    position: LatLng(-22.75075075, -47.31588364),
    icon: BitmapDescriptor.defaultMarker,
    infoWindow: const InfoWindow(
      title: 'Você está aquí',
    ),
  );
  List<double> positions = [-22.75075075, -47.31588364];
  bool nexStep = false;
  TextEditingController textController = TextEditingController()
    ..text = 'Advogato';
  TextEditingController titleController = TextEditingController()
    ..text = 'Advogato';

  buildPhotoSelector() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          input(titleController, Icons.title, "Titulo", false),
          SizedBox(
            height: 10,
          ),
          input(textController, Icons.text_fields, "Texto", false),
          SizedBox(
            height: 20,
          ),
          Text(
            "Escolha uma foto",
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 60,
                width: 60,
                child: AnimatedButton(Icons.add, () {}, 100.0),
              ),
              Text(
                "ou",
                style: TextStyle(color: Colors.grey),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                height: 60,
                width: 60,
                child: AnimatedButton(Icons.camera, () {}, 100.0),
              ),
            ],
          ),
          Text(
            "tire uma foto",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 30,
          ),
          OutlinedButton(
            child: Text("Criar Spoted"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  void _updatePosition(CameraPosition _position) {
    setState(() {
      positions = [_position.target.latitude, _position.target.longitude];
      markers = markers.copyWith(
        positionParam:
            LatLng(_position.target.latitude, _position.target.longitude),
      );
    });
  }

  buildSelectMap() {
    Set<Circle> circles = Set.from([
      Circle(
        fillColor: Color.fromARGB(131, 104, 58, 183),
        strokeWidth: 0,
        circleId: CircleId("1"),
        center: LatLng(positions[0], positions[1]),
        radius: 200,
      )
    ]);
    return Stack(
      children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-22.75075075, -47.31588364),
            zoom: 14,
          ),
          markers: Set<Marker>.of(
            <Marker>[markers],
          ),
          onCameraMove: ((_position) => _updatePosition(_position)),
          onMapCreated: (GoogleMapController controller) {
            _googleMapController = controller;
          },
          circles: circles,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Marque no mapa"), actions: [
        IconButton(
          iconSize: 35,
          onPressed: () {
            setState(() {
              this.nexStep = !this.nexStep;
            });
          },
          icon: Icon(this.nexStep ? Icons.map : Icons.check),
        )
      ]),
      body: Container(
        child: this.nexStep ? buildPhotoSelector() : buildSelectMap(),
      ),
    );
  }
}
