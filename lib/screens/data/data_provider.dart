import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/models/user_model.dart';
import 'package:riverpod_flutter/services/api_service.dart';

final userDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(userProvider).getUsers();
});
