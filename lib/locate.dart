import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LocateUsScreen(),
    );
  }
}

class LocateUsScreen extends StatelessWidget {
  const LocateUsScreen({super.key});

  final String googleMapsUrl =
      "https://www.google.com/maps/place/Max+Burn+Fitness+Center/@7.3104963,80.6335188,17z/data=!3m1!4b1!4m6!3m5!1s0x3ae36725c0e6f63f:0x9b69711b2306c0dc!8m2!3d7.3104963!4d80.6360937!16s%2Fg%2F11hmz0mlgz?entry=ttu&g_ep=EgoyMDI1MDMxMi4wIKXMDSoASAFQAw%3D%3D";

  Future<void> _openGoogleMaps() async {
    Uri url = Uri.parse(googleMapsUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.4, 
              child: Image.asset(
                'assets/home.jpeg', 
                fit: BoxFit.cover,
              ),
            ),
          ),

       
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Icon(Icons.location_on, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      'Locate Us',
                      style: GoogleFonts.montserrat(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                Text(
                  'Visit Our Center',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),

                GestureDetector(
                  onTap: _openGoogleMaps,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.location_on, color: Colors.white),
                        const SizedBox(width: 10),
                        Text(
                          '202/3 Katugastota Rd, Kandy',
                          style: GoogleFonts.montserrat(
                            fontSize: 14,
                            color: Colors.blue, 
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
