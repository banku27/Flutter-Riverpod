import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final valueStateProvider = StateProvider.autoDispose<int>((ref) => 7);

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(valueStateProvider);
    ref.listen(valueStateProvider, (previous, next) {
      if (next == 15) {
        //show a dialog
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('value is 15'),
          ),
        );
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Provider'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Center(
              child: Text(
                'the value is ${ref.watch(valueStateProvider)}',
                style: const TextStyle(fontSize: 21),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(valueStateProvider.notifier).state++;
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.invalidate(valueStateProvider);
              },
              child: const Text('Invalidate'),
            )
          ],
        ),
      ),
    );
  }
}
