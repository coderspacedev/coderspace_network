import 'package:flutter/material.dart';
import 'package:coderspace_network/coderspace_network.dart';

void main() {
  runApp(const MyApp());
}

/// A simple model representing a post.
class Post {
  final int id;
  final String title;

  Post({required this.id, required this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['id'] as int, title: json['title'] as String);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Coderspace Network Calls',
      home: PostsPage(),
    );
  }
}

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final _client = CoderClient(baseUrl: "https://jsonplaceholder.typicode.com");

  List<Post> _posts = [];
  String? _error;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    final result = await _client.get<List<Post>>(
      '/posts',
      parser: (data) => ensureList(data, (item) => Post.fromJson(item)),
    );

    if (result.isSuccess) {
      setState(() => _posts = result.data!);
    } else {
      setState(() => _error = result.error);
    }

    setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _error != null
          ? Center(child: Text("Error: $_error"))
          : ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                final post = _posts[index];
                return ListTile(
                  leading: Text(post.id.toString()),
                  title: Text(post.title),
                );
              },
            ),
    );
  }
}
