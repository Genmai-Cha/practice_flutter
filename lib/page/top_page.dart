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
            onPressed: () {
              _fetchShiba().then((value) {
                if (value.statusCode != 200) {
                  // throw Exception('データの取得にしっぱ')
                  return print('データの取得に失敗しました...');
                }
                imagePath = jsonDecode(value.body)[0];
                print('---------------------');
                print(imagePath);
                print('---------------------');
              });
            },
          ),
          imagePath.isEmpty ? Text('ボタン押してね！') : Image.network(imagePath),
        ],
      ),
    );
  }

  Future<http.Response> _fetchShiba() {
    String _url =
        'http://shibe.online/api/shibes?count=1&urls=true&httpsUrls=true';
    return http.get(Uri.parse(_url));
  }
}
