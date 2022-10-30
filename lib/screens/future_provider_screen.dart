import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/models/suggestion.dart';
import 'package:riverpod_flutter/services/api_service.dart';

final suggestionFutureProvider =
    FutureProvider.autoDispose.family<Suggestion, String>((ref, id) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getSuggestions(id);
});

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final suggestionRef = ref.watch(suggestionFutureProvider('1'));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Future Provider'),
        ),
        body: RefreshIndicator(
          onRefresh: () => ref.refresh(suggestionFutureProvider('1').future),
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: ListView(
              children: [
                suggestionRef.when(
                  data: (data) => Center(
                    child: Text(
                      data.activity,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                          color: Colors.purple),
                    ),
                  ),
                  error: (error, stackTrace) => Text(
                    error.toString(),
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                )
              ],
            ),
          ),
        ));
  }
}
