import 'package:flutter/material.dart';


class TabsPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Paginas(),
      bottomNavigationBar: _Navegacion(),
   );
  }
}

class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),

      ]
    );
  }
}

class _Paginas extends StatelessWidget {
  const _Paginas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [

        Container(
          color: Colors.red,
        ),

        Container(
          color: Colors.green,
        )

      ],
    );
  }
}