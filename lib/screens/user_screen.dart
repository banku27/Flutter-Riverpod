import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_flutter/models/user_model.dart';
import 'package:riverpod_flutter/screens/data/data_provider.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Riverpod"),
      ),
      body: _data.when(
          data: (_data) {
            List<UserModel> userList = _data.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                //   Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => DetailScreen(
                                //       e: userList[index],
                                //     ),
                                //   ),
                                // );
                              },
                              child: Card(
                                color: Colors.black,
                                elevation: 4,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  title: Text(
                                    userList[index].firstname,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(userList[index].lastname,
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  trailing: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(userList[index].avatar),
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              ),
            );
          },
          error: (err, s) => Text(err.toString()),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
