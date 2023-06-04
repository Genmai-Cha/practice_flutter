import 'package:flutter/cupertino.dart';
import 'package:practice_flutter/page/top_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      title: 'テスト (ios風) ',
      theme: CupertinoThemeData(
        primaryColor: Color.fromRGBO(155, 203, 206, 1),
        scaffoldBackgroundColor: Color.fromRGBO(255, 246, 233, 1),
      ),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatefulWidget {
  const MyAppPage({super.key});

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(155, 203, 206, 1),
      ),
      child: SafeArea(
        child: BottomTabBar(),
      ),
    );
  }
}

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({Key? key}) : super(key: key);

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  static const _topPage = TopPage();

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'ホーム'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings), label: '設定'),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(builder: (BuildContext context) {
          return Center(
            child: index == 0 ? _topPage : Text('2ページめ！'),
          );
        });
      },
    );
  }
}
