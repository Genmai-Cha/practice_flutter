import 'package:flutter/cupertino.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
       title: 'テスト (ios風) ',
       theme: CupertinoThemeData(
        scaffoldBackgroundColor: Color(0xFFFAFAFA)
      ),
      home:NavBar(),
    );
  }

}

class NavBar extends StatefulWidget {
  const NavBar();

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: const Text('Header'),
          backgroundColor: const Color.fromARGB(255, 14, 14, 227),
      ),
      child: Center (
        child:       Column(
        children: <Widget>[
          const Text(
            'ここにコンテンツ入ります',
            style: TextStyle(
              fontSize: 20,
              color:const Color.fromARGB(255, 14, 14, 227)
            )
          ),
          const SizedBox(height: 20),
          CupertinoButton.filled(
            child: const Text(
              'ただのボタン',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFFFAFAfA)
              ),
              ),
            onPressed: (){}
          ),
        ], 
      ),
      )

    );
  }
}