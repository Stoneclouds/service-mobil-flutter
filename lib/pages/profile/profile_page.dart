import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import '../../models/profile_model.dart';
import '../../services/profile_service.dart';
import '../../services/session_service.dart';
import '../login_page.dart';
import '../../widgets/shimmer/profile_shimmer.dart';

class ProfilePage extends StatefulWidget {
  final int userId;
  final String username;
  final String role;

  const ProfilePage({
    super.key,
    required this.userId,
    required this.username,
    required this.role,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final ProfileService profileService = ProfileService();

  late Future<ProfileModel?> profile;

  @override
  void initState() {
    super.initState();
    profile = profileService.getProfile(widget.userId);
  }
  Future<void> logout() async {

    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Logout"),
        content: const Text(
          "Apakah Anda yakin ingin keluar?",
        ),
        actions: [

          TextButton(
            onPressed: (){
              Navigator.pop(context,false);
            },
            child: const Text("Batal"),
          ),

           ElevatedButton(

            onPressed: () async {

              await SessionService().logout();

              if (!context.mounted) return;

              Navigator.pushAndRemoveUntil(

                context,

                MaterialPageRoute(
                  builder: (_) => const LoginPage(),
                ),

                (route) => false,

              );

            },

            child: const Text("Logout"),

          ),

        ],
      ),
    );

    if(confirm != true) return;

    await SessionService().logout();

    if(!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (_) => const LoginPage(),
      ),
      (route)=>false,
    );

  }
    Future<void> refreshProfile() async {

      setState(() {

        profile =
            profileService.getProfile(widget.userId);

      });
    }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
      ),

      body: FutureBuilder<ProfileModel?>(

        future: profile,

        builder: (context,snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return const ProfileShimmer();
          }

          if(snapshot.hasError){

            return Center(

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  const Icon(
                    Icons.person_off,
                    size:80,
                    color:Colors.red,
                  ),

                  const SizedBox(height:20),

                  const Text(
                    "Profile gagal dimuat",
                  ),

                  ElevatedButton(

                    onPressed: (){

                      setState((){

                        profile =
                            profileService.getProfile(widget.userId);

                      });

                    },

                    child: const Text("Coba Lagi"),

                  )

                ],

              ),

            );

          }

          if(!snapshot.hasData){

            return const Center(
              child: Text("Data tidak ditemukan"),
            );

          }

          final user = snapshot.data!;

          return RefreshIndicator(

           onRefresh: refreshProfile,


            child: SingleChildScrollView(

            padding: const EdgeInsets.all(20),

            child: Column(

              children: [

                FadeInDown(

                  child: CircleAvatar(

                    radius: 55,

                    backgroundColor: Colors.blue,

                    child: Text(

                      user.username[0].toUpperCase(),

                      style: const TextStyle(
                        fontSize: 42,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),

                    ),

                  ),

                ),

                const SizedBox(height:20),

                Text(

                  user.username,

                  style: const TextStyle(

                    fontSize:24,
                    fontWeight: FontWeight.bold,

                  ),

                ),

                const SizedBox(height:8),

                Chip(

                  label: Text(user.role.toUpperCase()),

                  backgroundColor: Colors.blue.shade100,

                ),

                const SizedBox(height:30),

                Row(

                  children: [

                    Expanded(

                      child: Card(

                        child: Padding(

                          padding: const EdgeInsets.all(20),

                          child: Column(

                            children: [

                              const Icon(
                                Icons.calendar_month,
                                color: Colors.blue,
                                size: 40,
                              ),

                              const SizedBox(height:10),

                              const Text("Booking"),

                              Text(

                                user.booking.toString(),

                                style: const TextStyle(

                                  fontSize:26,
                                  fontWeight: FontWeight.bold,

                                ),

                              ),

                            ],

                          ),

                        ),

                      ),

                    ),

                    const SizedBox(width:15),

                    Expanded(

                      child: Card(

                        child: Padding(

                          padding: const EdgeInsets.all(20),

                          child: Column(

                            children: [

                              const Icon(

                                Icons.star,

                                color: Colors.orange,

                                size:40,

                              ),

                              const SizedBox(height:10),

                              const Text("Points"),

                              Text(

                                user.points.toString(),

                                style: const TextStyle(

                                  fontSize:26,
                                  fontWeight: FontWeight.bold,

                                ),

                              ),

                            ],

                          ),

                        ),

                      ),

                    ),

                  ],

                ),

                const SizedBox(height:40),

                SizedBox(

                  width: double.infinity,

                  height: 55,

                  child: ElevatedButton.icon(

                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.red,

                    ),

                    onPressed: logout,

                    icon: const Icon(Icons.logout),

                    label: const Text(

                      "Logout",

                      style: TextStyle(
                        color: Colors.white,
                      ),

                    ),

                  ),

                )

              ],

            ),

          )
          );

        },

      ),

    );

  }

}