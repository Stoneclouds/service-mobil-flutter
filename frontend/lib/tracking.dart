import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Tracking extends StatefulWidget {

  final String username;

  const Tracking({
    super.key,
    required this.username,
  });

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {

  List data=[];

  Future getData() async{

    var res = await http.get(

      Uri.parse(

"http://192.168.18.167/servis_mobile/api/get_services.php?username=${widget.username}"

      ),

    );

    setState(() {

      data=json.decode(res.body);

    });

  }

  @override
  void initState() {

    getData();

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Tracking Servis"),
      ),

      body: ListView.builder(

        itemCount: data.length,

        itemBuilder: (context,index){

          return Card(

            margin: const EdgeInsets.all(10),

            child: ListTile(

              leading: const Icon(
                Icons.car_repair,
                color: Colors.blue,
              ),

              title: Text(
                data[index]["jenis_servis"],
              ),

              subtitle: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(data[index]["keluhan"]),

                  const SizedBox(height:5),

                  Text(
                    "Prioritas : ${data[index]["prioritas"]}",
                  ),

                ],

              ),

              trailing: Chip(

                label: Text(
                  data[index]["status"],
                ),

              ),

            ),

          );

        },

      ),

    );

  }

}