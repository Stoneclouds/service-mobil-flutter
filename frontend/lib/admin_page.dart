import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AdminPage extends StatefulWidget {

  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {

  List data=[];

  Future getData() async{

    var res=await http.get(

      Uri.parse(

"http://192.168.18.167/servis_mobile/api/get_all_services.php"

      ),

    );

    setState(() {

      data=json.decode(res.body);

    });

  }

  Future updateStatus(id,status) async{

    await http.post(

      Uri.parse(

"http://127.0.0.1:8080/servis_mobile/api/update_status.php"

      ),

      body:{

        "id":id.toString(),

        "status":status,

      },

    );

    getData();

  }

  @override
  void initState(){

    getData();

    super.initState();

  }

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(

        title: const Text("Kelola Servis"),

      ),

      body: ListView.builder(

        itemCount:data.length,

        itemBuilder:(context,index){

          return Card(

            margin: const EdgeInsets.all(10),

            child: ListTile(

              leading: CircleAvatar(

                child: Text(

                  data[index]["username"][0].toUpperCase(),

                ),

              ),

              title: Text(

                data[index]["username"],

              ),

              subtitle: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children:[

                  Text(data[index]["jenis_servis"]),

                  Text(data[index]["keluhan"]),

                  Text("Status : ${data[index]["status"]}")

                ],

              ),

              trailing: PopupMenuButton(

                onSelected:(v){

                  updateStatus(

                    data[index]["id"],

                    v,

                  );

                },

                itemBuilder:(context)=>[

                  const PopupMenuItem(

                    value:"Menunggu",

                    child: Text("Menunggu"),

                  ),

                  const PopupMenuItem(

                    value:"Diproses",

                    child: Text("Diproses"),

                  ),

                  const PopupMenuItem(

                    value:"Selesai",

                    child: Text("Selesai"),

                  ),

                ],

              ),

            ),

          );

        },

      ),

    );

  }

}