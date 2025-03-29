import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
      ),
      home: const XylophoneScreen(),
    );
  }
}

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({super.key});

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  final AudioPlayer _player = AudioPlayer();

  final List<Map<String, dynamic>> _keys = [
    {
      'color': const Color(0xFFE57373),
      'sound': 'note1.wav',
      'label': 'IAM NOT AFRAID'
    },
    {
      'color': const Color(0xFF4FC3F7),
      'sound': 'note2.wav',
      'label': 'LOSE YOURSELF'
    },
    {
      'color': const Color(0xFF81C784),
      'sound': 'note3.wav',
      'label': 'Fight Back'
    },
    {
      'color': const Color(0xFFFFD54F),
      'sound': 'note4.wav',
      'label': 'LIGHT WEIGHT BABY!!'
    },
    {
      'color': const Color(0xFF7986CB),
      'sound': 'note5.wav',
      'label': 'ROYALTY'
    },
  ];

  void _playSound(String soundFile) {
    _player.play(AssetSource(soundFile));
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Widget _buildKey(Map<String, dynamic> key) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
            color: key['color'],
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(
                  key['color'].red,
                  key['color'].green,
                  key['color'].blue,
                  0.4,
                ),
                spreadRadius: 1,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => _playSound(key['sound']),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    key['label'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          offset: Offset(1, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A237E),
              Color(0xFF000000),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(height: 24),
                const Text(
                  "Music Board",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        offset: Offset(2, 2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Tap to play",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(255, 255, 255, 0.6),
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: _keys.map((key) => _buildKey(key)).toList(),
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
