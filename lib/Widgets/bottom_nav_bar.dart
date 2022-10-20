import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:ijob_code_cafe/Jobs/jobs_screen.dart';
import 'package:ijob_code_cafe/Jobs/upload_job.dart';
import 'package:ijob_code_cafe/Search/search_companies.dart';

class BottomNavigationBarForApp extends StatelessWidget {
  BottomNavigationBarForApp({super.key, required this.indexNum});

  int indexNum = 0;

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
          }
        });
  }
}
