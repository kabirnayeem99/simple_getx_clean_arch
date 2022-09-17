import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entity/post.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Post post = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("{JSON}Placeholder"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(width: 0, height: 50),
              Text(
                post.title,
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(width: 0, height: 30),
              post.type == PostType.text
                  ? Text(post.body + post.body + post.body * 100)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(post.thumbnail),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
