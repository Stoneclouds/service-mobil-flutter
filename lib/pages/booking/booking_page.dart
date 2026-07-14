import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookingPage extends StatefulWidget {
  final String username;

  const BookingPage({
    super.key,
    required this.username,
  });

  @override
  State<BookingPage> createState() => _BookingState();
}

class _BookingState extends State<BookingPage> {

  final keluhan = TextEditingController();

  String jenisServis = "Servis Mesin";
  String prioritas = "Normal";

  Future booking() async {

    var res = await http.post(
      Uri.parse(
          "http://192.168.18.167/servis_mobile/api/booking.php"
      ),
      body: {
        "username": widget.username,
        "keluhan": keluhan.text,
        "jenis_servis": jenisServis,
        "prioritas": prioritas,
      },
    );

    var data = json.decode(res.body);

    if(data["status"]=="success"){

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Booking berhasil"),
        ),
      );

      Navigator.pop(context);

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Booking Servis"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: ListView(

          children: [

            TextField(
              controller: keluhan,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Keluhan Kendaraan",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height:20),

            DropdownButtonFormField(

              value: jenisServis,

              items: const [

                DropdownMenuItem(
                  value: "Servis Mesin",
                  child: Text("Servis Mesin"),
                ),

                DropdownMenuItem(
                  value: "Ganti Oli",
                  child: Text("Ganti Oli"),
                ),

                DropdownMenuItem(
                  value: "Servis AC",
                  child: Text("Servis AC"),
                ),

                DropdownMenuItem(
                  value: "Tune Up",
                  child: Text("Tune Up"),
                ),

              ],

              onChanged: (v){
                setState(() {
                  jenisServis=v!;
                });
              },

            ),

            const SizedBox(height:20),

            DropdownButtonFormField(

              value: prioritas,

              items: const [

                DropdownMenuItem(
                  value: "Normal",
                  child: Text("Normal"),
                ),

                DropdownMenuItem(
                  value: "Urgent",
                  child: Text("Urgent"),
                ),

              ],

              onChanged: (v){

                setState(() {

                  prioritas=v!;

                });

              },

            ),

            const SizedBox(height:30),

            ElevatedButton.icon(

              onPressed: booking,

              icon: const Icon(Icons.send),

              label: const Text("Booking Sekarang"),

            )

          ],

        ),

      ),

    );

  }

}