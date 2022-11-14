import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sayyid_themoviedb/Service/auth_service.dart';
import 'package:get/get.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:sayyid_themoviedb/controllers/bottom_navigator_controller.dart';

class Profiles extends StatefulWidget {
  const Profiles({Key? key}) : super(key: key);

  @override
  State<Profiles> createState() => _ProfilesState();
}

class _ProfilesState extends State<Profiles> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  tooltip: 'Back to home',
                  onPressed: () =>
                      Get.find<BottomNavigatorController>().setIndex(0),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                  ),
                ),


                const Tooltip(
                  message: 'Your Profile !',
                  triggerMode: TooltipTriggerMode.tap,
                  child: Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Welcome !',
              style: const TextStyle(
                  fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.network(FirebaseAuth.instance.currentUser!.photoURL!,),
            const SizedBox(
              height: 20,
            ),
            Text(
              FirebaseAuth.instance.currentUser!.displayName!,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white54
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            MaterialButton(
                padding: const EdgeInsets.all(10),
                color: Colors.redAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)
                ),
                child: const Text(
                  'LOG OUT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                  ),
                ),
                onPressed: (){
                  AuthService().signOut();
                }),
          ],
        ),
      ),
    );
  }
}
