import 'package:flutter/material.dart';
import 'package:formfun_flutter_test/screens/first/first_screen.dart';
import 'package:formfun_flutter_test/screens/second/second_screen.dart';

void main() {
  runApp(const FormAndFunApp());
}

class FormAndFunApp extends StatelessWidget {
  const FormAndFunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form&Fun Showcase',
      theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF1E1E1E),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        cardColor: const Color(0xFF2C2C2C),
      ),
      home: InitScreen(),
    );
  }
}

class ExerciseScreen {
  final String title;
  final Widget Function(BuildContext) builder;

  ExerciseScreen({
    required this.title,
    required this.builder,
  });
}

class DetailScreen extends StatelessWidget {
  final ExerciseScreen exercises;

  const DetailScreen({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exercises.title),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Hero(
        tag: 'exercise_${exercises.title}',
        child: exercises.builder(context),
      ),
    );
  }
}

class InitScreen extends StatelessWidget {
  InitScreen({super.key});

  final List<ExerciseScreen> exercises = [
    ExerciseScreen(
      title: 'Form&Fun First Exercise',
      builder: (context) => FirstScreen(),
    ),
    ExerciseScreen(
      title: 'Form&Fun Second Exercise',
      builder: (context) => SecondScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form&Fun Exercise Showcase'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          if (index < exercises.length) {
            return Center(
              child: Hero(
                tag: 'example_${exercises[index].title}',
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DetailScreen(
                                key: UniqueKey(),
                                exercises: exercises[index]
                            );
                          },
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                            Icons.animation,
                            size: 48,
                            color: Colors.black54
                        ),
                        const SizedBox(height: 8),
                        Text(
                          exercises[index].title,
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return SizedBox(
              height: MediaQuery.of(context)
                  .size
                  .height,
              child: Container(),
            );
          }
        },
      ),
    );
  }
}

