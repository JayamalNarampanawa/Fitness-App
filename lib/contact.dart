import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactUsScreen(),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/home.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.phone, color: Colors.white, size: 30),
                SizedBox(height: 10),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Contact us via :-',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 20),
                ContactField(icon: Icons.phone, text: '+94759225800', isPhone: true),
                SizedBox(height: 10),
                ContactField(icon: Icons.email, text: 'maxburnfitness@gmail.com', isPhone: false),
                SizedBox(height: 30),
                Text(
                  'Find Us On Social Media',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIcon(icon: FontAwesomeIcons.facebook, color: Colors.blue, url: 'https://www.facebook.com/p/MAX-BURN-fitness-centre-100064052262666/'),
                    SizedBox(width: 20),
                    SocialIcon(icon: FontAwesomeIcons.instagram, color: Colors.pink, url: 'https://www.instagram.com/maxburnfitnesscenter/?hl=en'),
                    SizedBox(width: 20),
                    SocialIcon(icon: FontAwesomeIcons.tiktok, color: const Color.fromARGB(255, 55, 54, 54), url: 'https://www.tiktok.com/@max_burn_fitness'),
                    SizedBox(width: 20),
                    SocialIcon(icon: FontAwesomeIcons.whatsapp, color: Colors.green, url: 'https://wa.me/94759225800'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactField extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool isPhone;
  ContactField({required this.icon, required this.text, required this.isPhone});

  void _launchPhone() async {
    final Uri uri = Uri.parse('tel:$text');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $text';
    }
  }

  void _launchEmail() async {
    final Uri uri = Uri(scheme: 'mailto', path: text, queryParameters: {
      'subject': 'Inquiry about Max Burn Fitness',
      'body': 'Hello, I would like to inquire about...'
    });
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch email client';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isPhone ? _launchPhone : _launchEmail,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String url;
  SocialIcon({required this.icon, required this.color, required this.url});

  void _launchURL() async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 20,
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}