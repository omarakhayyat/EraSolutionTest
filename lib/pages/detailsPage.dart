import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:testCase/model/notificationModel.dart';

class DetailsPage extends StatelessWidget {
  final dynamic data;
  DetailsPage(this.data);
  @override
  Widget build(BuildContext context) {
    //Uint8List bytes = base64Decode(data.msg[0].checkPic.toString());

    return Container(
        child:
            //Center(child: Image.memory(bytes)

            Center(
      child: Text(
        data.msg[0].sId.toString(),
        style: TextStyle(fontSize: 20),
      ),
    ));
  }
}
