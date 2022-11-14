import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayyid_themoviedb/screens/movie.dart';
import 'package:sayyid_themoviedb/screens/pageone.dart';
import 'package:sayyid_themoviedb/screens/profile.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  int _currentIndex = 0;
  final List<Widget> _widgetList = [
    const Movies(),
    const PageOne(),
    const Profiles(),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      // body: Container(
      //   color: Colors.white,
      //   width: MediaQuery.of(context).size.width,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         FirebaseAuth.instance.currentUser!.displayName!,
      //         style: const TextStyle(
      //           fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Text(
      //         FirebaseAuth.instance.currentUser!.email!,
      //         style: const TextStyle(
      //           fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87
      //         ),
      //       ),
      //       const SizedBox(
      //         height: 30,
      //       ),
      //       MaterialButton(
      //         padding: const EdgeInsets.all(10),
      //           color: Colors.green,
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(5)
      //           ),
      //           child: const Text(
      //             'LOG OUT',
      //             style: TextStyle(
      //               color: Colors.white,
      //               fontSize: 15
      //             ),
      //           ),
      //           onPressed: (){
      //           AuthService().signOut();
      //           })
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        unselectedLabelStyle: TextStyle(color: Colors.grey[400]),
        selectedLabelStyle: const TextStyle(color: Colors.blue),
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: onTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: Center(child: _widgetList[_currentIndex]),
    );
  }
  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
