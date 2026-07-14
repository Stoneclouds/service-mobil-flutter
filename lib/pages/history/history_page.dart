import 'package:flutter/material.dart';

import '../../models/history_model.dart';
import '../../services/history_service.dart';

class HistoryPage extends StatefulWidget {
  final int userId;

  const HistoryPage({
    super.key,
    required this.userId,
  });

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {

  final HistoryService historyService = HistoryService();

  late Future<List<HistoryModel>> history;

  @override
  void initState() {
    super.initState();
    loadHistory();
  }

  Future<void> loadHistory() async {

    setState(() {

      history = historyService.getHistory(widget.userId);

    });

  }

  Color statusColor(String status){

    switch(status){

      case "Finished":
        return Colors.green;

      case "Process":
        return Colors.orange;

      default:
        return Colors.blue;

    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Booking History"),
        centerTitle: true,
      ),

      body: RefreshIndicator(

        onRefresh: loadHistory,

        child: FutureBuilder<List<HistoryModel>>(

          future: history,

          builder: (context,snapshot){

            if(snapshot.connectionState==ConnectionState.waiting){

              return const Center(
                child: CircularProgressIndicator(),
              );

            }

            if(snapshot.hasError){

              return const Center(
                child: Text("Gagal mengambil data"),
              );

            }

            if(!snapshot.hasData || snapshot.data!.isEmpty){

              return const Center(
                child: Text("Belum ada riwayat booking"),
              );

            }

            final data = snapshot.data!;

            return ListView.builder(

              padding: const EdgeInsets.all(15),

              itemCount: data.length,

              itemBuilder: (context,index){

                final item = data[index];

                return Card(

                  elevation: 4,

                  margin: const EdgeInsets.only(bottom:15),

                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(15),

                  ),

                  child: Padding(

                    padding: const EdgeInsets.all(18),

                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Row(

                          children: [

                            const Icon(
                              Icons.directions_car,
                              color: Colors.blue,
                            ),

                            const SizedBox(width:10),

                            Expanded(

                              child: Text(

                                item.vehicleName,

                                style: const TextStyle(

                                  fontSize:18,
                                  fontWeight: FontWeight.bold,

                                ),

                              ),

                            ),

                            Chip(

                              label: Text(item.status),

                              backgroundColor:
                                  statusColor(item.status)
                                      .withOpacity(.15),

                              labelStyle: TextStyle(

                                color: statusColor(item.status),

                              ),

                            )

                          ],

                        ),

                        const SizedBox(height:15),

                        Row(

                          children: [

                            const Icon(Icons.pin,size:18),

                            const SizedBox(width:8),

                            Text(item.vehicleNumber),

                          ],

                        ),

                        const SizedBox(height:8),

                        Row(

                          children: [

                            const Icon(Icons.build,size:18),

                            const SizedBox(width:8),

                            Text(item.serviceType),

                          ],

                        ),

                        const SizedBox(height:8),

                        Row(

                          children: [

                            const Icon(Icons.calendar_month,size:18),

                            const SizedBox(width:8),

                            Text(item.bookingDate),

                          ],

                        ),

                        const SizedBox(height:8),

                        Row(

                          children: [

                            const Icon(Icons.access_time,size:18),

                            const SizedBox(width:8),

                            Text(item.bookingTime),

                          ],

                        ),

                      ],

                    ),

                  ),

                );

              },

            );

          },

        ),

      ),

    );

  }

}