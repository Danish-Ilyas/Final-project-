import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class shalimarHotel extends StatefulWidget {
  Map currentLocaion;
  shalimarHotel(this.currentLocaion);
  @override
  State<shalimarHotel> createState() => _shalimarHotelState();
}

class _shalimarHotelState extends State<shalimarHotel> {


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
          position: LatLng(31.8261802206041, 70.911261937068), //Destiny
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'Shalimar Hotel DIKhan',
          )
      ),
    };
    List<LatLng> latlng= [
      LatLng(currentLatitude,currentLongitude),
      LatLng(31.8261802206041, 70.911261937068),//DIKhan Destiny
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
