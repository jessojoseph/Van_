import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/custom_buttons.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Hide status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  @override
  void dispose() {
    // Restore status bar when leaving this screen
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Column(
              children: [
                // Top Orange Gradient Section with Image
                Container(
                  width: size.width,
                  height: size.height * 0.65,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    child: Image.asset(
                      'assets/welcome_screen.jpg',
                      width: size.width,
                      height: size.height * 0.9,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          decoration: BoxDecoration(
                          ),
                          child: Center(
                            child: Icon(
                              Icons.directions_walk,
                              size: 120,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                // Bottom White Section with Text and Button
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 38),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Main Heading
                          const Text(
                            'A walk in nature walks the soul back home.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              height: 1.2,
                            ),
                          ),
                          
                          const SizedBox(height: 10),
                          
                          // Subtitle
                          Text(
                            'Adopt the pace of nature.',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                              height: 1.4,
                            ),
                          ),
                          
                          const SizedBox(height: 24),
                          
                          // Log in Button
                          PrimaryButton(
                            text: 'Log in',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
