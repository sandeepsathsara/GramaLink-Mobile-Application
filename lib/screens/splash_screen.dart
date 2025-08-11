import 'package:flutter/material.dart';
import 'login_page.dart';

// Localization map for 3 languages
const Map<String, Map<String, String>> localizedStrings = {
  'en': {
    'get_started': 'Get Started',
    'settings': 'Settings',
    'language': 'Language',
    'font_size': 'Font Size',
    'dark_mode': 'Dark Mode',
    'accent_color': 'Accent Color',
    'digital_services': 'Digital Village Services',
    'app_title': 'E-Grama Niladhari',
  },
  'si': {
    'get_started': 'ආරම්භ කරන්න',
    'settings': 'සැකසුම්',
    'language': 'භාෂාව',
    'font_size': 'අකුරු ප්‍රමාණය',
    'dark_mode': 'අඳුරු ක්‍රමය',
    'accent_color': 'අක්සෙන්ට් වර්ණය',
    'digital_services': 'ඩිජිටල් ග්‍රාම සේවාවන්',
    'app_title': 'ඊ-ග්‍රාම නිලධාරි',
  },
  'ta': {
    'get_started': 'தொடங்கு',
    'settings': 'அமைப்புகள்',
    'language': 'மொழி',
    'font_size': 'எழுத்து அளவு',
    'dark_mode': 'இருண்ட முறையை',
    'accent_color': 'நிறம்',
    'digital_services': 'டிஜிட்டல் கிராம சேவைகள்',
    'app_title': 'ஈ-கிராம நிர்வாகி',
  },
};

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  String _language = "en";
  double _fontSize = 18; // Slightly bigger
  bool _isDarkMode = false;
  Color _accentColor = const Color(0xFF00897B); // Teal tone

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.85,
      end: 1.15,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _openSettingsTop() {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: localizedStrings[_language]!['settings'],
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.topCenter,
          child: Material(
            color: Colors.white.withOpacity(0.95),
            elevation: 10,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.settings, size: 36, color: _accentColor),
                  const SizedBox(height: 8),
                  Text(
                    localizedStrings[_language]!['settings']!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Divider(),
                  _buildLanguageSelector(),
                  _buildFontSizeSlider(),
                  _buildDarkModeSwitch(),
                  _buildAccentColorPicker(),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.check),
                    label: Text(localizedStrings[_language]!['get_started']!),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _accentColor,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutCubic)),
          child: child,
        );
      },
    );
  }

  Widget _buildLanguageSelector() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          localizedStrings[_language]!['language']!,
          style: const TextStyle(fontSize: 18),
        ),
        DropdownButton<String>(
          value: _language,
          items: const [
            DropdownMenuItem(value: "en", child: Text("English")),
            DropdownMenuItem(value: "si", child: Text("සිංහල")),
            DropdownMenuItem(value: "ta", child: Text("தமிழ்")),
          ],
          onChanged: (value) {
            setState(() {
              _language = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildFontSizeSlider() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          localizedStrings[_language]!['font_size']!,
          style: const TextStyle(fontSize: 18),
        ),
        Expanded(
          child: Slider(
            value: _fontSize,
            min: 16,
            max: 28,
            divisions: 6,
            activeColor: _accentColor,
            label: _fontSize.round().toString(),
            onChanged: (value) {
              setState(() {
                _fontSize = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDarkModeSwitch() {
    return SwitchListTile(
      value: _isDarkMode,
      title: Text(
        localizedStrings[_language]!['dark_mode']!,
        style: const TextStyle(fontSize: 18),
      ),
      activeColor: _accentColor,
      onChanged: (val) {
        setState(() {
          _isDarkMode = val;
        });
      },
    );
  }

  Widget _buildAccentColorPicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          localizedStrings[_language]!['accent_color']!,
          style: const TextStyle(fontSize: 18),
        ),
        Row(
          children: [
            _colorDot(const Color(0xFF00897B)),
            _colorDot(Colors.blueGrey),
            _colorDot(Colors.deepOrange),
            _colorDot(Colors.indigo),
          ],
        ),
      ],
    );
  }

  Widget _colorDot(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _accentColor = color;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: _accentColor == color ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          image: const DecorationImage(
            image: AssetImage('assets/logo.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget _buildAnimatedDots() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(
              (_controller.value * 3).floor() % 3 == index ? 1 : 0.3,
            ),
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : null,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: _isDarkMode ? Colors.white : Colors.white,
              size: 28,
            ),
            onPressed: _openSettingsTop,
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: _isDarkMode
                ? [Colors.black, Colors.grey[900]!]
                : [const Color(0xFF004D40), const Color(0xFF00796B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                const SizedBox(height: 30),
                Text(
                  localizedStrings[_language]!['app_title']!,
                  style: TextStyle(
                    fontSize: _fontSize + 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  localizedStrings[_language]!['digital_services']!,
                  style: TextStyle(
                    fontSize: _fontSize,
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 50),
                _buildAnimatedDots(),
                const SizedBox(height: 60),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 15,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => LoginPage(language: _language),
                      ),
                    );
                  },
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.white, _accentColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(
                        minWidth: 150,
                        minHeight: 50,
                      ),
                      child: Text(
                        localizedStrings[_language]!['get_started']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
