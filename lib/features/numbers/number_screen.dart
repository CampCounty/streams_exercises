import 'package:flutter/material.dart';
import 'package:streams_exercises/features/numbers/number_repository.dart';

class NumberScreen extends StatelessWidget {
  const NumberScreen({
    super.key,
    required this.numberRepository,
  });

  final NumberRepository numberRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Screen'),
      ),
      backgroundColor:
          Colors.black, // Hintergrundfarbe des gesamten Bildschirms
      body: Center(
        child: StreamBuilder<int>(
          stream: numberRepository.getNumberStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Error occurred');
            } else if (snapshot.hasData) {
              final number = snapshot.data.toString();

              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 4.0,
                children: List<Widget>.generate(number.length, (index) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.all(2.0),
                    child: Text(
                      number[index],
                      style: TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber, // Gold color
                      ),
                    ),
                  );
                }),
              );
            } else {
              return const Text('Stream completed');
            }
          },
        ),
      ),
    );
  }
}
