import 'package:flutter/material.dart';

class VehicleDetail extends StatefulWidget {
  final vehicleDetailName;
  final vehicleDetailPrice;
  final vehicleDetailPicture;
  final vehicleDetailCurrency;
  const VehicleDetail({
    this.vehicleDetailName,
    this.vehicleDetailPrice,
    this.vehicleDetailPicture,
    this.vehicleDetailCurrency
  });

  @override
  State<VehicleDetail> createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Vehicle Rental System'),
          actions: [
            IconButton(onPressed: null, icon: Icon(Icons.search,color: Colors.white,),),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(accountName: Text('Jermi'), accountEmail: Text('Jermi01@gmail.com'),
              currentAccountPicture: GestureDetector(child: 
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Page'),
                ),
              ),
               InkWell(
                onTap: () {},
                child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Page'),
                ),
              ),
               InkWell(
                onTap: () {},
                child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Page'),
                ),
              ),
               InkWell(
                onTap: () {},
                child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Page'),
                ),
              ),
               InkWell(
                onTap: () {},
                child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home Page'),
                ),
              ),
              Divider(
                thickness: 0.5,
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                leading: Icon(Icons.settings,color: Colors.blue,),
                title: Text('setting'),
                ),
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                leading: Icon(Icons.help,color: Colors.amber,),
                title: Text('about'),
                ),
              ),
              
            ],
          ),
        ),
     body: ListView(
      children: [
        Container(
          height: 300,
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(widget.vehicleDetailName,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
                title: Text("${widget.vehicleDetailPrice}",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
                subtitle: Text(widget.vehicleDetailCurrency,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            ),
            child: Image.asset(widget.vehicleDetailPicture,)),
        ),
      ],
     ),
      ),
    );
  }
}