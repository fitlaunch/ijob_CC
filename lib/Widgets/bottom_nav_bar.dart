import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ijob_code_cafe/Jobs/jobs_screen.dart';
import 'package:ijob_code_cafe/Jobs/upload_job.dart';
import 'package:ijob_code_cafe/Search/profile.dart';
import 'package:ijob_code_cafe/Search/search_companies.dart';
import 'package:ijob_code_cafe/user_state.dart';

class BottomNavigationBarForApp extends StatelessWidget {
  BottomNavigationBarForApp({super.key, required this.indexNum});

  int indexNum = 0;

  void _logout(context) {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.black54,
            title: Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  ),
                )
              ],
            ),
            content: const Text(
              'Do you want to Log Out?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                },
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              ),
              TextButton(
                onPressed: () {
                  _auth.signOut();
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const UserState()),
                  );
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(color: Colors.green, fontSize: 18),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      animationDuration: const Duration(milliseconds: 600),
      animationCurve: Curves.easeOut,
      color: Colors.deepOrange.shade400,
      backgroundColor: Colors.blueAccent,
      buttonBackgroundColor: Colors.deepOrange.shade300,
      height: 50,
      index: indexNum,
      items: const [
        Icon(Icons.list, size: 22, color: Colors.black),
        Icon(Icons.search, size: 22, color: Colors.black),
        Icon(Icons.add, size: 22, color: Colors.black),
        Icon(Icons.person_2_outlined, size: 22, color: Colors.black),
        Icon(Icons.logout, size: 22, color: Colors.black),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const JobScreen()),
          );
        } else if (index == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => AllWorkersScreen()),
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const UploadJobNow()),
          );
        } else if (index == 3) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const ProfileScreen()),
          );
        } else if (index == 4) {
          _logout(context);
        }
      },
    );
  }
}
