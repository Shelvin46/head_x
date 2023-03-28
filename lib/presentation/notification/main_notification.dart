import 'package:flutter/material.dart';
import 'package:head_x/core/uiConstWidget.dart';
import 'package:head_x/main.dart';
import 'package:head_x/presentation/widgets/app_bar_widget.dart';

class NotificationMain extends StatelessWidget {
  const NotificationMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Notifications",
          appbarColor: Color.fromARGB(
            255,
            110,
            105,
            167,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          notiGap,
          Padding(
            padding: EdgeInsets.only(left: myMediaQueryData.size.width * 0.02),
            child: Container(
                height: myMediaQueryData.size.height * 0.03,
                width: myMediaQueryData.size.width * 0.1,
                decoration: notiDec1,
                child: notiText),
          ),
          notiLine,
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 120,
                    child: ListTile(
                      leading: const Icon(
                        Icons.thumb_up,
                        color: Colors.blueGrey,
                      ),
                      title: Text(
                        "Order Placed",
                        style: mainTitle,
                      ),
                      subtitle: const Text(
                          "Your order for Sony WH-XB910N\nsuccessfully placed tab here for\nmore details"),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return notiLine;
                },
                itemCount: 2),
          )
        ],
      ),
    );
  }
}
