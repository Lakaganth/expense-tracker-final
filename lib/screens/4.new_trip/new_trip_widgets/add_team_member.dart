import 'package:fleming_expense_tracker/controllers/newtrip_controller.dart';
import 'package:fleming_expense_tracker/screens/4.new_trip/search_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BuildNewTeamMemberButton extends StatelessWidget {
  const BuildNewTeamMemberButton({
    Key key,
    @required this.trip,
  }) : super(key: key);

  final NewtripController trip;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        BuildFormHeader(
          header: "Add Team Member",
          headerColor: Color(0xFF8AB2E2),
        ),
        Flexible(
          child: GetBuilder<NewtripController>(builder: (controller) {
            return ListView.builder(
              itemCount: trip.tempTeamMember.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 80.0,
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: trip.tempTeamMember[index].photoUrl == ""
                          ? AssetImage('assets/images/default_avatar.png')
                          : CachedNetworkImageProvider(
                              trip.tempTeamMember[index].photoUrl),
                      radius: 25.0,
                    ),
                    title: Text(
                      trip.tempTeamMember[index].name
                          .toString()
                          .capitalizeFirst,
                      style: GoogleFonts.quicksand(
                        color: Colors.black,
                        fontSize: 26.0,
                      ),
                    ),
                    subtitle: Text(
                      trip.tempTeamMember[index].email,
                      style: GoogleFonts.quicksand(
                        color: Colors.grey,
                        fontSize: 20.0,
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.cancel),
                      onPressed: () =>
                          trip.removeTempUser(trip.tempTeamMember[index]),
                    ),
                  ),
                );
              },
            );
          }),
        ),
        RawMaterialButton(
          onPressed: () {
            Get.to(
              SearchUser(
                trip: trip,
              ),
              fullscreenDialog: true,
            );
          },
          elevation: 2.0,
          fillColor: Colors.blue,
          child: Icon(
            Icons.add,
            size: 30.0,
            color: Colors.white,
          ),
          padding: EdgeInsets.all(5.0),
          shape: CircleBorder(),
        ),
      ],
    );
  }
}

class BuildFormHeader extends StatelessWidget {
  final String header;
  final Color headerColor;

  BuildFormHeader({@required this.header, @required this.headerColor});
  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: GoogleFonts.quicksand(
        color: headerColor,
        fontSize: 28.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
