import 'dart:async';
import 'package:final_year_project/mapScreens/destiny/AlHafizPulao.dart';
import 'package:final_year_project/mapScreens/destiny/AliHospital.dart';
import 'package:final_year_project/mapScreens/destiny/HistoricalPlace.dart';
import 'package:final_year_project/mapScreens/destiny/MarketScreen.dart';
import 'package:final_year_project/mapScreens/destiny/UniScreen.dart';
import 'package:final_year_project/mapScreens/destiny/commercialMarket.dart';
import 'package:final_year_project/mapScreens/destiny/gomalUni.dart';
import 'package:final_year_project/mapScreens/destiny/hospitalScreen.dart';
import 'package:final_year_project/mapScreens/destiny/hotellocations.dart';
import 'package:final_year_project/mapScreens/destiny/RiverScreen.dart';
import 'package:final_year_project/mapScreens/destiny/khyberMarket.dart';
import 'package:final_year_project/mapScreens/destiny/lasaniPizza.dart';
import 'package:final_year_project/mapScreens/destiny/misbahHospital.dart';
import 'package:final_year_project/mapScreens/destiny/shalimarHotel.dart';
import 'package:final_year_project/mapScreens/destiny/tastyBite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  Completer<GoogleMapController> _controller = Completer();

  LocationData? currentLocation;

  void getCurrentLocation(){

    Location location = Location();
    location.getLocation().then((location) {
      currentLocation = location;
    });
    setState(() {

    });
  }

  late Size mq = MediaQuery.of(context).size;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            getCurrentLocation();
          });

        },
        child: Icon(
          Icons.location_on_outlined,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body:
      SafeArea(
        child: Stack(
          children: [
            currentLocation == null ? Center(child: Text("Press the top button to access your current location",style: TextStyle(),)) :
            GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller){
                _controller.complete(controller);
                setState(() {

                });
              },
              markers: {
                Marker(
                    markerId: MarkerId('Location'),
                    position: LatLng(currentLocation!.latitude!,currentLocation!.longitude!),
                  infoWindow: InfoWindow(
                    title: 'My Position',
                  )
                ),
              },
              zoomControlsEnabled: false,
              //mapType: MapType.satellite,
              initialCameraPosition:   CameraPosition(
               target: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
                 zoom: 14,
                ),
            ),
            Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  width: mq.width * 1,
                  height: mq.height * 0.08,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      //DHQ hospital
                      GestureDetector(
                        onTap: (){
                          Get.to(() => DHQHospital({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.hotel_sharp,color: Colors.blue,),
                                ),
                                Text("DHQ Hospital",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //Gomal market
                      GestureDetector(
                        onTap: (){
                          Get.to(() => GomalMarket({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.shopping_cart,color: Colors.blue,),
                                ),
                                Text("Gomal Market",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //River
                      GestureDetector(
                        onTap: (){
                          Get.to(()=> RiverScreen({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.auto_graph,color: Colors.blue,),
                                ),
                                Text("Sindh River",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //Qurtuba universities
                      GestureDetector(
                        onTap: (){
                          Get.to(() => UniLocation({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.school,color: Colors.blue,),
                                ),
                                Text("Qurtuba Universities",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //National club
                      GestureDetector(
                        onTap: (){
                        Get.to(() => NationalClub({
                          'currentLatitude' : currentLocation!.latitude!,
                          'currentLongitude' : currentLocation!.longitude!,
                        }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.hotel_class_outlined,color: Colors.blue,),
                                ),
                                Text("National Club",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //balmik mandir
                      GestureDetector(
                        onTap: (){
                        Get.to(() => HistoricalPlace({
                          'currentLatitude' : currentLocation!.latitude!,
                          'currentLongitude' : currentLocation!.longitude!,
                        }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.temple_hindu_sharp,color: Colors.blue,),
                                ),
                                Text("Balmik Mandir",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //commercial Market
                      GestureDetector(
                        onTap: (){
                          Get.to(() => commercialMarket({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.shopping_cart,color: Colors.blue,),
                                ),
                                Text("Commercial Market",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //khyber Market
                      GestureDetector(
                        onTap: (){
                          Get.to(() => khyberMarket({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.shopping_cart,color: Colors.blue,),
                                ),
                                Text("Khyber Market",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //misbah hospital
                      GestureDetector(
                        onTap: (){
                          Get.to(() => misbahHospital({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.hotel_sharp,color: Colors.blue,),
                                ),
                                Text("Misbah Hospital",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //Ali hospital
                      GestureDetector(
                        onTap: (){
                          Get.to(() => aliHospital({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.hotel_sharp,color: Colors.blue,),
                                ),
                                Text("Ali Hospital",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //shalimar Hotel
                      GestureDetector(
                        onTap: (){
                          Get.to(() => shalimarHotel({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.hotel_class_outlined,color: Colors.blue,),
                                ),
                                Text("Shalimar Hotel",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //gomal uni dikhan
                      GestureDetector(
                        onTap: (){
                          Get.to(() => gomalUni({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.school,color: Colors.blue,),
                                ),
                                Text("Gomal University Dikhan",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //lasani pizza
                      GestureDetector(
                        onTap: (){
                          Get.to(() => lasaniPizza({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.restaurant,color: Colors.blue,),
                                ),
                                Text("Lasani Pizza",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //tasty bite
                      GestureDetector(
                        onTap: (){
                          Get.to(() => tastybite({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.restaurant,color: Colors.blue,),
                                ),
                                Text("Tasty Bite",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),
                      //Alhafiz pulao
                      GestureDetector(
                        onTap: (){
                          Get.to(() => alHafiz({
                            'currentLatitude' : currentLocation!.latitude!,
                            'currentLongitude' : currentLocation!.longitude!,
                          }));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Icon(Icons.restaurant,color: Colors.blue,),
                                ),
                                Text("AlHafiz Pulao",style: TextStyle(color: Colors.white,fontSize: 15),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.width * 0.02,),

                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
