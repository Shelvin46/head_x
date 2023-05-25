// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:head_x/application/details_checking/details_checking_bloc.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/firebase/personDetails/details.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class EditProfileOne extends StatelessWidget {
  EditProfileOne({super.key});
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileNoController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<DetailsCheckingBloc>(context).add(ForDetails());
    });
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
              title: "Edit Profile", appbarColor: Color(0xFF24C7EB))),
      body: SingleChildScrollView(
        child: BlocBuilder<DetailsCheckingBloc, DetailsCheckingState>(
          builder: (context, state) {
            if (state.isLoading == true) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            nameController.text = state.firstName;
            lastNameController.text = state.lastName;
            mobileNoController.text = state.mobileNo;
            emailController.text = state.userid;
            return Column(
              children: [
                editGap1,
                Center(
                  child: CircleAvatar(
                    radius: 95,
                    backgroundImage: state.photo == ""
                        ? const AssetImage("assets/download.png")
                        : NetworkImage(state.photo)
                            as ImageProvider, // backgroundImage:,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: myMediaQueryData.size.height * 0.2,
                    decoration: const BoxDecoration(
                        color: Color(0xFF24C7EB),
                        borderRadius: BorderRadius.all(Radius.circular(90))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 0, 20, 0),
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                                labelText: "Firstname",
                                labelStyle: labelColor),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 0, 26, 0),
                          child: TextField(
                            controller: lastNameController,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                                labelText: "Lastname",
                                labelStyle: labelColor),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    await AddingDetails().toUpdateDetails(
                        state.photo,
                        nameController.text,
                        lastNameController.text,
                        mobileNoController.text,
                        emailController.text);
                    BlocProvider.of<DetailsCheckingBloc>(context)
                        .add(ForDetails());
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: myMediaQueryData.size.height * 0.06,
                    width: myMediaQueryData.size.width * 0.340,
                    decoration: const BoxDecoration(
                        color: Color(0xFF24C7EB),
                        borderRadius: BorderRadius.all(Radius.circular(90))),
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    height: myMediaQueryData.size.height * 0.2,
                    decoration: const BoxDecoration(
                        color: Color(0xFF24C7EB),
                        borderRadius: BorderRadius.all(Radius.circular(90))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 0, 20, 0),
                          child: TextField(
                            controller: mobileNoController,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                                labelText: "Mobile no",
                                labelStyle: labelColor),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(45, 0, 26, 0),
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                border: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.white,
                                )),
                                labelText: "Mail id",
                                labelStyle: labelColor),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                    await AddingDetails().toUpdateDetails(
                        state.photo,
                        nameController.text,
                        lastNameController.text,
                        mobileNoController.text,
                        emailController.text);
                    BlocProvider.of<DetailsCheckingBloc>(context)
                        .add(ForDetails());
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: myMediaQueryData.size.height * 0.06,
                    width: myMediaQueryData.size.width * 0.340,
                    decoration: const BoxDecoration(
                        color: Color(0xFF24C7EB),
                        borderRadius: BorderRadius.all(Radius.circular(90))),
                    child: const Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
