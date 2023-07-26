import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_information_app/Common_widgets/custom_button.dart';
import 'package:users_information_app/Common_widgets/custom_textformfield.dart';
import 'package:users_information_app/Providers/get_information_page_provider.dart';
import 'package:users_information_app/Screens/home_page.dart';

import '../Database/database_service.dart';

class GetInformation extends StatefulWidget {
  const GetInformation({super.key});

  @override
  State<GetInformation> createState() => _GetInformationState();
}

class _GetInformationState extends State<GetInformation> {
  bool insertdataCheck = false;
  DatabaseService databaService = DatabaseService();
  @override
  void initState() {
    super.initState();
    databaService.databaseget;
  }

  boolCheck(bool check) {
    setState(() {
      insertdataCheck = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    var getInformationProvider =
        Provider.of<GetInformationProvider>(context, listen: false);
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Get Information"),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              w: w * 0.9,
              labeltext: "Name",
              controller: getInformationProvider.name,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              w: w * 0.9,
              labeltext: "Email",
              keyboardtype: TextInputType.emailAddress,
              controller: getInformationProvider.email,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              w: w * 0.9,
              labeltext: "Mobile",
              keyboardtype: TextInputType.number,
              controller: getInformationProvider.mobile,
            ),
            SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              w: w * 0.9,
              labeltext: "Gender",
              controller: getInformationProvider.gender,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () async {
                if (getInformationProvider.name.text != "" &&
                    getInformationProvider.email.text != "" &&
                    getInformationProvider.mobile.text != "" &&
                    getInformationProvider.gender.text != "") {
                  await getInformationProvider.postInformation(boolCheck);
                  if (insertdataCheck == true) {
                    databaService
                        .insertData(
                            getInformationProvider.name.text,
                            getInformationProvider.email.text,
                            getInformationProvider.mobile.text,
                            getInformationProvider.gender.text)
                        .whenComplete(() {
                      getInformationProvider.name.text = "";
                      getInformationProvider.email.text = "";
                      getInformationProvider.mobile.text = "";
                      getInformationProvider.gender.text = "";
                      var snackBar = SnackBar(
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 2),
                        content: Text('Information added successfully'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    });
                  }
                }
                else{
                    var snackBar = SnackBar(
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 1),
                        content: Text('Please fill all the fields'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
