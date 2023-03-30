import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class EditProfileOne extends StatelessWidget {
  EditProfileOne({super.key});
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = "Shelvin";
    lastNameController.text = "Varghese";
    mobileNoController.text = "9995468468";
    emailController.text = "shelvinvarghese6@gmail.com";
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: "Edit Profile", appbarColor: Color(0xFF24C7EB))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            editGap1,
            const Center(
              child: CircleAvatar(
                radius: 95,
                backgroundImage: AssetImage("assets/download.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                    color: Color(0xFF24C7EB),
                    borderRadius: BorderRadius.all(Radius.circular(90))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(45, 0, 20, 0),
                      child: TextField(
                        
                        controller: nameController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            labelText: "Firstname",
                            labelStyle: labelColor),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(45, 0, 20, 0),
                      child: TextField(
                        controller: lastNameController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            labelText: "Lastname",
                            labelStyle: labelColor),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: 140,
              decoration: BoxDecoration(
                  color: Color(0xFF24C7EB),
                  borderRadius: BorderRadius.all(Radius.circular(90))),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                    color: Color(0xFF24C7EB),
                    borderRadius: BorderRadius.all(Radius.circular(90))),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(45, 0, 20, 0),
                      child: TextField(
                        controller: mobileNoController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            labelText: "Mobile no",
                            labelStyle: labelColor),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(45, 0, 20, 0),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.white,
                            )),
                            labelText: "Mail id",
                            labelStyle: labelColor),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 50,
              width: 140,
              decoration: BoxDecoration(
                  color: Color(0xFF24C7EB),
                  borderRadius: BorderRadius.all(Radius.circular(90))),
              child: Center(
                child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
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
