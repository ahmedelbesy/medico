import 'dart:convert';


import 'package:http/http.dart';
import 'package:medicoo/Api/linkapi.dart';



import 'package:medicoo/Api/model_get_data.dart';



abstract class PostRepository {
  Future<List<Post>> getAllPosts();
}

class PostRepositoryImpl extends PostRepository {
  @override
  Future<List<Post>> getAllPosts() async {
    final response = await get(base_api+Getdata);
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Post>((item) => Post.fromJson(item)).toList();


    } else {
      throw Exception('Can not load posts');
    }
  }
}