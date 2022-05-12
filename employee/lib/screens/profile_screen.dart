import 'package:employee/controller/profile_controller.dart';
import 'package:employee/controller/storage_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ProfileController _profileController;

  Future<Null> _refresh() async {
    await _profileController.reloadProfile();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profileController = Get.find<ProfileController>();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refresh,
      child: GetX<StorageController>(builder: (storageController) {
        return ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            Container(
              alignment: Alignment.center,
              child: CircleAvatar(
                radius: 50,
                child: FaIcon(
                  FontAwesomeIcons.userAlt,
                  color: Colors.indigo.shade600,
                  size: 45,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(8),
              child: Text(
                storageController.profile.value.name,
                style: GoogleFonts.firaSans(
                    color: Colors.indigo.shade700, fontSize: 25),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 3,
                left: 10,
                right: 10,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.indigo.shade600,
                ),
                title: Text(
                  'Username',
                  style: GoogleFonts.firaSans(
                      fontSize: 15,
                      color: Colors.indigo.shade600,
                      fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  storageController.profile.value.username,
                  style: GoogleFonts.firaSans(color: Colors.black54),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  color: Colors.indigo.shade600,
                ),
                title: Text(
                  'Email',
                  style: GoogleFonts.firaSans(
                      fontSize: 15,
                      color: Colors.indigo.shade600,
                      fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  storageController.profile.value.email,
                  style: GoogleFonts.firaSans(color: Colors.black54),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 3),
              child: ListTile(
                leading: Icon(
                  Icons.location_city,
                  color: Colors.indigo.shade600,
                ),
                title: Text(
                  'Address',
                  style: GoogleFonts.firaSans(
                      fontSize: 15,
                      color: Colors.indigo.shade600,
                      fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  'Painal Bihta Patna Bihar 801111',
                  style: GoogleFonts.firaSans(color: Colors.black54),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10, left: 10, bottom: 0),
              child: ListTile(
                leading: Icon(
                  Icons.verified,
                  color: Colors.indigo.shade600,
                ),
                title: Text(
                  'Status',
                  style: GoogleFonts.firaSans(
                      fontSize: 15,
                      color: Colors.indigo.shade600,
                      fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  // // storageController.profile.value.status == true
                  //     ? 'verified'
                  //     : 'Not Verified',
                  'verified',
                  style: GoogleFonts.firaSans(color: Colors.black54),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
