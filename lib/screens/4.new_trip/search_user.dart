import 'package:cached_network_image/cached_network_image.dart';
import 'package:fleming_expense_tracker/controllers/newtrip_controller.dart';
import 'package:fleming_expense_tracker/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fleming_expense_tracker/controllers/auth_controller.dart';

class SearchUser extends StatelessWidget {
  final NewtripController trip;

  SearchUser({@required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: userSearchField(),
      body: SingleChildScrollView(
        child: Container(
            width: Get.width,
            height: Get.height,
            child: GetBuilder<NewtripController>(builder: (controller) {
              return trip.searchUsers == null
                  ? EmptySearchContent()
                  : SearchResultsList(trip: trip);
            })),
      ),
    );
  }

  AppBar userSearchField() {
    return AppBar(
      leading: Icon(Icons.account_box),
      backgroundColor: Colors.deepPurpleAccent,
      elevation: 5.0,
      title: TextFormField(
        controller: trip.searchController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
            hintText: "Search for Users",
            hintStyle: GoogleFonts.quicksand(
              color: Colors.white,
            )),
        onFieldSubmitted: trip.handleSearchUser,
        style: GoogleFonts.quicksand(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.clear), onPressed: () => trip.clearSearch())
      ],
    );
  }
}

class EmptySearchContent extends StatelessWidget {
  const EmptySearchContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: Get.height,
        width: Get.width,
        child: Image.asset("assets/images/search_user.png"),
      ),
    );
  }
}

class SearchResultsList extends StatelessWidget {
  final NewtripController trip;

  SearchResultsList({@required this.trip});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: trip.searchUsers,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<Widget> searchResults = [];
        snapshot.data.documents.forEach((doc) {
          UserModel user = UserModel.fromMap(doc);
          searchResults.add(BuildUserSearchResultTile(
            user: user,
            trip: trip,
          ));
        });
        return ListView(
          children: searchResults,
        );
      },
    );
  }
}

class BuildUserSearchResultTile extends StatelessWidget {
  BuildUserSearchResultTile({
    Key key,
    @required this.user,
    @required this.trip,
  }) : super(key: key);

  final AuthController auth = Get.put(AuthController());
  final UserModel user;
  final NewtripController trip;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: user.photoUrl == ""
                        ? AssetImage('assets/images/default_avatar.png')
                        : CachedNetworkImageProvider(user.photoUrl),
                    radius: 25.0,
                  ),
                  title: Text(
                    user.name.capitalizeFirst,
                    style: GoogleFonts.quicksand(
                      color: Colors.white,
                      fontSize: 26.0,
                    ),
                  ),
                  subtitle: Text(
                    user.email,
                    style: GoogleFonts.quicksand(
                      color: Colors.white60,
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: user.uid != auth.firestoreUser.value.uid
                        ? IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () => trip.addTempTeamMember(user),
                          )
                        : Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Admin")),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
