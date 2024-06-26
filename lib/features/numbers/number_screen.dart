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
      body: StreamBuilder<int>(
        stream: numberRepository.getNumberStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Fehler'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('Keine Daten vorhanden'),
            );
          } else {
            return Center(
              child: Text(
                'Current Number: ${snapshot.data}',
                style: const TextStyle(fontSize: 24),
              ),
            );
          }
        },
      ),
    );
  }
}
