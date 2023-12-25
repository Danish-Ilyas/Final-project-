import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class khyberMarket extends StatefulWidget {
  Map currentLocaion;
  khyberMarket(this.currentLocaion);
  @override
  State<khyberMarket> createState() => _khyberMarketState();
}

class _khyberMarketState extends State<khyberMarket> {


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
          position: LatLng(31.830056106158413, 70.90144501038043), //Destiny
          icon: BitmapDescriptor.defaultMarker,
          infoWindow: InfoWindow(
            title: 'Commercial Market DIKhan',
          )
      ),
    };
    List<LatLng> latlng= [
      LatLng(currentLatitude,currentLongitude),
      LatLng(31.830056106158413, 70.90144501038043),//DIKhan Destiny
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
