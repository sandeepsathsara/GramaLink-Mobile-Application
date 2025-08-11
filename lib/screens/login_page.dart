import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String language;
  const LoginPage({super.key, required this.language});

  // Localized labels for each language
  Map<String, Map<String, String>> get _localizedText => {
    "si": {
      "title": "ඇතුල් වන්න",
      "username": "පරිශීලක නාමය",
      "password": "මුරපදය",
      "login": "ඇතුල් වන්න",
    },
    "ta": {
      "title": "உள்நுழை",
      "username": "பயனர் பெயர்",
      "password": "கடவுச்சொல்",
      "login": "உள்நுழை",
    },
    "en": {
      "title": "Login",
      "username": "Username",
      "password": "Password",
      "login": "Login",
    },
  };

  @override
  Widget build(BuildContext context) {
    final labels = _localizedText[language] ?? _localizedText["en"]!;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A237E), Color(0xFF283593)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(24),
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        labels["title"]!,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                      SizedBox(height: 30),
                      TextField(
                        decoration: InputDecoration(
                          labelText: labels["username"],
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: labels["password"],
                          prefixIcon: Icon(Icons.lock),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: Colors.blue[900],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${labels["login"]} successful"),
                            ),
                          );
                        },
                        child: Text(
                          labels["login"]!,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
