import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'dart:convert';

class TopPage extends StatefulWidget {
  const TopPage();

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  var imagePath = '';
  String notFoundUrl =
      'https://images.unsplash.com/photo-1584824486509-112e4181ff6b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1770&q=80';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          CupertinoButton.filled(
            child: const Text('芝犬と一緒'),
            onPressed: () async {
              try {
                var path = await _fetchShiba();
                setState(() {
                  imagePath = path;
                });
              } catch (e) {
                print(e);
              }
            },
          ),
          Image.network(imagePath.isNotEmpty ? imagePath : notFoundUrl),
        ],
      ),
    );
  }

  // 芝犬APIを叩く関数
  Future<String> _fetchShiba() async {
    String _url =
        'http://shibe.online/api/shibes?count=1&urls=true&httpsUrls=true';
    var response = await http.get(Uri.parse(_url));

    if (response.statusCode != 200) {
      throw Exception('データの取得にしっぱいしました...');
    }

    return jsonDecode(response.body)[0];
  }
}
