import 'package:final_year_project/auth/api/apis.dart';
import 'package:final_year_project/auth/loginScreen.dart';
import 'package:final_year_project/components/emailField.dart';
import 'package:final_year_project/components/imageField.dart';
import 'package:final_year_project/components/txtfield.dart';
import 'package:final_year_project/mapScreens/locationScreen.dart';
import 'package:final_year_project/model/Model.dart';
import 'package:final_year_project/view/agentScreen.dart';
import 'package:final_year_project/view/discScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List images = [
    "assets/images/DHQ hospital.jpg",
    "assets/images/gomal market.jpg",
    "assets/images/river.jpg",
    "assets/images/qurtuba uni.jpg",
    "assets/images/national club.jpg",
    "assets/images/balmik mandir.jpg",
    "assets/images/commercial.jpg",
    "assets/images/khyber.jpg",
    "assets/images/misbah.jpg",
    "assets/images/ali hospital dikhan.jpeg",
    "assets/images/shalimar hotel.jpg",
    "assets/images/gomal.jpg",
    "assets/images/lasani.jpg",
    "assets/images/tastybite.jpeg",
    "assets/images/alhafiz.jpg",
  ];
  var categories = [
    'DHQ HOSPITAL',
    'GOMAL MARKET',
    'SINDH RIVER',
    'QURTUBA UNIVERSITY',
    'NATIONAL CLUB',
    'BALMIK MANDIR',
    'COMMERCIAL MARKET',
    'KHYBER MARKET',
    'MISBAH HOSPITAL',
    'ALI HOSPITAL',
    'SHALIMAR HOTEL',
    'GOMAL UNIVERSITY',
    'LASANI PIZZA',
    'TASTY BITES',
    'ALHAFIZ PULAO',
  ];
  var descrip = [
    //Dhq
    'DHQ Teaching Hospital Dera Ismail Khan.One of the leading Trauma center of Khyber Pakhtukhuwa, Pakistan.',
    //Gomal mrkt
    'Gomal Market is located in the mid of DIKhan',
    // Sindh
    'Dera Ismail Khan is situated on the west bank of the Indus River, at its junction with the Gomal River.',
    //qurtuba uni
    'Qurtuba university of science and information technology dera ismail khan is the best university in K.P.K.',
    // national club
    'View deals for National Club, including fully refundable rates with free cancellation. Breakfast, WiFi, and parking are free at this hotel.',
    //balmik mandir
    'Hindu temple in Dera Ismail Khan',
    //commercial mrkt
    'The Main Commercial Market is popular in dera ismail khan for shoping',
    //khyber market
    'Khyber market is located in misgaraan Bazar',
    //misbah hospital
    'Misbah international Hospital, South Circular Road, opposite Beesaki Ground, Dera Ismail Khan, Khyber Pakhtunkhwa 29050',
    //ali hospital
    'RV4Q+W5P, Dera Ismail Khan, Khyber Pakhtunkhwa',
    //shalimar hotel
    "Shalimar Hotel Dera Ismail Khan ; Address, Dera Ismail Khan, Khyber Pakhtunkhwa, Pakistan.",
    //gomal uni
    'Gomal university dera ismail khan is the beautiful university of dera and is located out of dikhan',
    //lasani
    'Fast food restaurant.Lasani Pizza Time, Dera Ismail Khan, Pakistan',
    //tasty bite
    "RWP5+35X, Dera Ismail Khan, Khyber Pakhtunkhwa",
    //Alhafiz pulao
    'AlHafiz Beef Pulao is located on Bannu road dera ismail khan',
  ];
  var extra = [ 
    //Dhq
    'DHQ Teaching Hospital Dera Ismail Khan. One of the leading Trauma center of Khyber Pakhtukhuwa, Pakistan. The hospital has various departments, including medicine, surgery, pediatrics, and gynecology. It also offers emergency services',
    //Gomal mrkt
    ' Gomal Market is Online Shopping Service To Provide Different Products to All Over the World.',
    // Sindh
    'Dera Ismail (D.I.) Khan District contains an area of 3,450 square miles between the right bank of the Indus River and the Sulaiman Range in westcentral West Pakistan.',
    //qurtuba uni
    'Welcome to Qurtuba University of Science and Information Technology D.I.Khan. The founder of this University, late Abdul Aziz Khan Niazi, has said that our university represents a continuation of the great and noble',
    // national club
    'Experience a magical Christmas getaway at National Club, with cozy accommodations and warm hospitality that will make your holiday truly unforgettable.',
    //balmik mandir
    "RWJ5+GPW, Jogianwala Mohallah Dera Ismail Khan, Khyber Pakhtunkhwa. it is the one of the most ancient historical place in D.I.Khan",
    //commercial mrkt
    'Mian Commercial Market is one of the top rated place listed as Shopping Mall in Dera Ismail Khan.',
    //khyber market
    'Khyber Market is a small food market located at Misgaraan Bazar Rd. in the city of Dera Ismail Khan, central Pakistan. The market is a private company, and due to a favorable location of the market (opposite of Sahabzada Stationary), it is quite a popular market which brings good incomes to its owners. There is a great number and nomenclature of goods in the market.',
    //misbah hospital
    'Misbah International Hospital, First Hospital in Dera ismail khan serving with International standar.Misbah hospital dikhan provides many facilities for the patients',
    //ali hospital
    'Health and Medicine, Treatment, Medical checkup, Laboratory tests,Hospitals and Local clinics',
    //shalimar hotel
    'The phone number for Shalimar Hotel Dera Ismail Khan is 0344 9399700',
    //gomal uni
    'Gomal University, is a public research university located in Dera Ismail Khan, Khyber Pakhtunkhwa, Pakistan. Founded and established in 1974, the university is one of the oldest institutions in the country and occupies one of the largest campuses in the Khyber-Pakhtunkhwa province.',
    //lasani
    'Salad Bar, Fresh Healthy and Delicious! Call Now for Free Home Delivery 03 111 555 881 ',
    //tasty bite
    ' Has all you can eat · Serves vegan dishes · Has kids menu. Phone: (0966) 711999',
    //Alhafiz pulao
    'Al Hafiz Bannu Beef Pulao Order now. Note: Free home delivery in city. Contact: 0336 760 5455 0347 195 7326 ',
  ];


 // For data used in the Drawer section
  List<ChatUser> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    APIs.getSelfInfo();
  }

  late Size mq = MediaQuery.of(context).size;

  TextEditingController _controller = TextEditingController();
  String search = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Travel Discovery',style: TextStyle(color: Colors.black),),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.5,
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              await GoogleSignIn().signOut().then((value) {
                Get.to(() => LoginScreen());
              }).onError((error, stackTrace) {
                Get.snackbar('Error', error.toString());
              });
            },
            child: Icon(
              Icons.logout,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
        ],
      ),
      drawer: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
              stream: APIs.Firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Center(child: CircularProgressIndicator());

                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data?.docs;
                    list = data
                            ?.map((e) => ChatUser.fromJson(e.data()))
                            .toList() ??
                        [];
                    if (list.isNotEmpty) {
                      return Column(
                        children: [
                          SizedBox(
                            height: mq.height * 0.02,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.close,
                                )),
                          ),
                          imageField(user: APIs.me),
                          SizedBox(
                            height: mq.height * 0.06,
                          ),
                          nameField(user: APIs.me),
                          SizedBox(
                            height: mq.height * 0.04,
                          ),
                          emailField(user: APIs.me),
                          SizedBox(
                            height: mq.height * 0.03,
                          ),
                          Text("This data is taken from your Email account."),
                          SizedBox(
                            height: mq.height * 0.04,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                onPressed: () async {
                                  await FirebaseAuth.instance.signOut();
                                  await GoogleSignIn().signOut().then((value) {
                                    Get.to(() => LoginScreen());
                                  }).onError((error, stackTrace) {
                                    Get.snackbar('Error', error.toString());
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                child: Text(
                                  'LogOut',
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      );
                    } else {
                      return Center(child: Text('Some thing went wrong'));
                    }
                }
              }),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _controller,
                    onChanged: (String? value){
                      print(value);
                      setState(() {
                        search = value.toString();
                      });
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Btn section
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(() => AgentScreen());
                        },
                        child: Text(
                          "Our Agents",
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(width: 10,),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Get.to(() => LocationScreen());
                        },
                        child: Text(
                          "Get started",
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),

                // Last section
                Column(
                  children: [
                    Container(
                      height: 450,
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: images.length,
                          itemBuilder: (BuildContext context, index) {
                            late String position = index.toString();
                            if(_controller.text.isEmpty){
                              return Padding(
                                padding: EdgeInsets.all(15),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => DescScreen({
                                      'background': images[index],
                                      'title': categories[index],
                                      'desc': descrip[index],
                                      'extra': extra[index],
                                    }));
                                  },
                                  child: Hero(
                                    tag: images[index],
                                    child: Container(
                                      height: 200,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Spacer(),
                                            Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  categories[index].toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage(images[index]),
                                            fit: BoxFit.cover,
                                            opacity: 0.8),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else if(categories[index].toLowerCase().contains(_controller.text.toLowerCase())){
                              return Padding(
                                padding: EdgeInsets.all(15),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(() => DescScreen({
                                      'background': images[index],
                                      'title': categories[index],
                                      'desc': descrip[index],
                                    }));
                                  },
                                  child: Hero(
                                    tag: images[index],
                                    child: Container(
                                      height: 200,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Spacer(),
                                            Container(
                                                alignment: Alignment.bottomLeft,
                                                child: Text(
                                                  categories[index].toString(),
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage(images[index],),
                                            fit: BoxFit.cover,
                                            opacity: 0.8),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else{
                              return Container(height: 0,);
                            }
                          }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
