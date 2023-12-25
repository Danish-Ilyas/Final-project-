import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class gomalUni extends StatefulWidget {
  Map currentLocaion;
  gomalUni(this.currentLocaion);
  @override
  State<gomalUni> createState() => _gomalUniState();
}

class _gomalUniState extends State<gomalUni> {


  @override
  Widget build(BuildContext context) {

    double currentLatitude = widget.currentLocaion['currentLatitude'];
    double currentLongitude = widget.currentLocaion['currentLongitude'];
    final Set<Marker> _markers = {
      Marker(markerId: MarkerId('1'),
          position: LatLng(currentLatitude,currentLongitude),
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'My Position',
          )
      ),

      Marker(markerId: MarkerId('2'),
          position: LatLng(31.713974492405082, 70.83548134263367), //Destiny
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'Gomal University DIKhan',
          )
      ),
    };
    List<LatLng> latlng= [
      LatLng(currentLatitude,currentLongitude),
      LatLng(31.713974492405082, 70.83548134263367),//DIKhan Destiny
    ];
    final Set<Polyline> _polyline = {
      Polyline(polylineId: PolylineId("1"),
          points: latlng,
          color: Colors.brown

      ),
    };
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(currentLatitude,currentLongitude),
            zoom: 15,
          ),
          myLocationEnabled: true,
          markers: _markers,
          polylines: _polyline,

        ),
      ),
    );
  }
}
