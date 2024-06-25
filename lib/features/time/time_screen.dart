import 'package:flutter/material.dart';
import 'package:streams_exercises/features/time/time_repository.dart';

class TimeScreen extends StatelessWidget {
  const TimeScreen({
    super.key,
    required this.timeRepository,
  });

  final TimeRepository timeRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Screen'),
      ),
      backgroundColor:
          Colors.black, // Hintergrundfarbe des gesamten Bildschirms
      body: Center(
        child: StreamBuilder<DateTime>(
          stream: timeRepository.dateTimeStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return const Text('Error occurred');
            } else if (snapshot.hasData) {
              return Text(
                'Current Time: ${snapshot.data}',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber, // Gold color
                ),
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
