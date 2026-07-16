import 'package:flutter/material.dart';

import '../../models/booking_model.dart';
import '../../services/booking_service.dart';
import '../../widgets/success_dialog.dart';
import '../../widgets/error_dialog.dart';

class BookingPage extends StatefulWidget {
  final int userId;

  const BookingPage({
    super.key,
    required this.userId,
  });

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final vehicleName = TextEditingController();
  final vehicleNumber = TextEditingController();
  final notes = TextEditingController();

  String serviceType = "Servis Mesin";

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> booking() async {
    BookingModel booking = BookingModel(
      userId: widget.userId,
      vehicleName: vehicleName.text,
      vehicleNumber: vehicleNumber.text,
      serviceType: serviceType,
      bookingDate: selectedDate.toString().split(" ")[0],
      bookingTime: selectedTime.format(context),
      notes: notes.text,
    );

    bool success = await BookingService().booking(booking);

    

    if (success) {
      if (!mounted) return;
      
      await SuccessDialog.show(

        context,

        title: "Booking Berhasil",

        message:
            "Booking servis berhasil dibuat.\nSilakan datang sesuai jadwal.",

      );

      if (!mounted) return;

      Navigator.pop(context, true);
    } else {
        await ErrorDialog.show(

          context,

          title: "Booking Gagal",

          message:
              "Booking tidak dapat diproses.\nSilakan coba lagi.",

        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Service"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [

          TextField(
            controller: vehicleName,
            decoration: const InputDecoration(
              labelText: "Nama Kendaraan",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          TextField(
            controller: vehicleNumber,
            decoration: const InputDecoration(
              labelText: "Nomor Polisi",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 20),

          DropdownButtonFormField<String>(
            value: serviceType,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Jenis Servis",
            ),
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
            onChanged: (value) {
              setState(() {
                serviceType = value!;
              });
            },
          ),

          const SizedBox(height: 20),

          ListTile(
            tileColor: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            leading: const Icon(Icons.calendar_today),
            title: Text(
              selectedDate.toString().split(" ")[0],
            ),
            onTap: pickDate,
          ),

          const SizedBox(height: 15),

          ListTile(
            tileColor: Colors.grey.shade100,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            leading: const Icon(Icons.access_time),
            title: Text(
              selectedTime.format(context),
            ),
            onTap: pickTime,
          ),

          const SizedBox(height: 20),

          TextField(
            controller: notes,
            maxLines: 4,
            decoration: const InputDecoration(
              labelText: "Catatan",
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 30),

          SizedBox(
            height: 55,
            child: ElevatedButton.icon(
              onPressed: booking,
              icon: const Icon(Icons.send),
              label: const Text("Booking Sekarang"),
            ),
          ),
        ],
      ),
    );
  }
}