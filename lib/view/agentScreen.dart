import 'package:flutter/material.dart';

class AgentScreen extends StatefulWidget {
  const AgentScreen({super.key});

  @override
  State<AgentScreen> createState() => _AgentScreenState();
}

class _AgentScreenState extends State<AgentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Center(child: Text("Our Agents",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Name : Ali Khan",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 10,),
                  Text("Phone : 03025912363",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 10,),
                  Text("Address : XYZ colony dera ismail khan",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 20,),
                  Divider(color: Colors.black,),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 40,
                      child: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Name : Hamza Saad",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 10,),
                  Text("Phone : 03400531169",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 10,),
                  Text("Address : ABC colony dera ismail khan",style: TextStyle(fontSize: 18),),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text("Our mision is to make your leisure time more enjoyable and hassle free. Whether you are a tourist exploring a new city or a local seeking fresh adventures.",style: TextStyle(
                fontSize: 16,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
