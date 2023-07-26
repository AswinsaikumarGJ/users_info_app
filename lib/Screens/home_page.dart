import 'package:flutter/material.dart';
import 'package:users_information_app/Screens/get_information_page.dart';

import '../Database/database_service.dart';

class HomePage extends StatefulWidget {
  // String ? usersInfo;

  // HomePage({
  //   required this.usersInfo
  // });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DatabaseService databaService = DatabaseService();
  var check;
  @override
  void initState() {
    // TODO: implement initState
     databaService.databaseget;
    databaService.fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => GetInformation()));
        return Future.value(true);
      },
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GetInformation()));
                },
                icon: Icon(Icons.arrow_back)),
            title: Text("List of users"),
          ),
          body: Container(
            height: h,
            width: w,
            padding: EdgeInsets.all(20),
            child: FutureBuilder(
              future: databaService.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: databaService.dbgetlist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: h * 0.2,
                          width: w,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 219, 210, 210)
                                  .withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(bottom: 10),
                          child: Stack(
                            children: [
                              Positioned(
                                  top: h * 0.03,
                                  left: w * 0.1,
                                  child: Text(
                                    "Name :",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Positioned(
                                  top: h * 0.03,
                                  left: w * 0.285,
                                  child: Text(
                                    "${databaService.dbgetlist[index]["name"]}",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Positioned(
                                  top: h * 0.065,
                                  left: w * 0.1,
                                  child: Text(
                                    "Email :",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Positioned(
                                  top: h * 0.065,
                                  left: w * 0.29,
                                  child: Text(
                                    "${databaService.dbgetlist[index]["email"]}",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Positioned(
                                  top: h * 0.1,
                                  left: w * 0.1,
                                  child: Text(
                                    "Mobile :",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Positioned(
                                  top: h * 0.1,
                                  left: w * 0.29,
                                  child: Text(
                                    "${databaService.dbgetlist[index]["mobile"]}",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Positioned(
                                  top: h * 0.135,
                                  left: w * 0.1,
                                  child: Text(
                                    "Gender :",
                                    style: TextStyle(fontSize: 20),
                                  )),
                              Positioned(
                                  top: h * 0.135,
                                  left: w * 0.3,
                                  child: Text(
                                    "${databaService.dbgetlist[index]["gender"]}",
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          )),
    );
  }
}
