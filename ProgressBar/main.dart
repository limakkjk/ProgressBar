import 'package:flutter/material.dart';

void main() {
  runApp(const ProgressApp());
}

class ProgressApp extends StatelessWidget {
  const ProgressApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Bar 💜',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),
      home: const ProgressPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  double progressValue = 0.0;

  void increaseProgress() {
    setState(() {
      progressValue += 0.1;
      if (progressValue > 1.0) {
        progressValue = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liviciuss Progress Bar rrsrs S2'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 247, 152, 223),
              Color.fromARGB(255, 195, 18, 226),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: CircularProgressIndicator(
                      value: progressValue,
                      strokeWidth: 10,
                      backgroundColor: Colors.white.withOpacity(0.4),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF7E57C2),
                      ),
                    ),
                  ),
                  Text(
                    '${(progressValue * 100).round()}%',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF512DA8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: increaseProgress,
                label: const Text('Continuar carregamento'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
