import 'package:flutter/material.dart';
import 'package:test_case/model/employeesModel.dart';
import 'package:test_case/model/notificationModel.dart';
import 'package:test_case/model/recordsModel.dart';
import 'package:test_case/model/rolesModel.dart';
import 'package:test_case/model/scheduleModel.dart';
import 'package:test_case/pages/addRolePage.dart';
import 'package:test_case/pages/detailsPage.dart';
import 'package:test_case/services/apiEmployeesFunction.dart';
import 'package:test_case/services/apiNotificationFunction.dart';
import 'package:test_case/services/apiRecordsFunction.dart';
import 'package:test_case/services/apiRolesFunction.dart';
import 'package:test_case/services/apiScheduleFunction.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  String resCode, resBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Dashboard',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 30.0)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 8.0),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text("Get Notification"),
              onPressed: () async {
                NotificationModel xx = await notificationGet();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("    Loading"),
                      ],
                    ),
                  ),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage(xx)));
              },
            ),
            RaisedButton(
              child: Text("Get High Temp Notification"),
              onPressed: () async {
                NotificationModel xx = await notificationHighTempGet();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("    Loading"),
                      ],
                    ),
                  ),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage(xx)));
              },
            ),
            RaisedButton(
              child: Text("Update Viewed Notification"),
              onPressed: () async {
                var xx = await notificationUpdate();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("    Loading"),
                      ],
                    ),
                  ),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage(xx)));
              },
            ),
            RaisedButton(
              child: Text("Get All Roles"),
              onPressed: () async {
                RolesModel xx = await rolesGet();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("    Loading"),
                      ],
                    ),
                  ),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage(xx)));
              },
            ),
            RaisedButton(
              child: Text("Add Role"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddRolePage()));
                // rolesAdd(groupId: null, groupName: null, department: null);
              },
            ),
            RaisedButton(
              child: Text("Get All Employees"),
              onPressed: () async {
                EmployeesModel xx = await employeesGet();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("    Loading"),
                      ],
                    ),
                  ),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage(xx)));
              },
            ),
            RaisedButton(
              child: Text("Get All Schedules"),
              onPressed: () async {
                ScheduleModel xx = await scheduleGet();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("    Loading"),
                      ],
                    ),
                  ),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage(xx)));
              },
            ),
            RaisedButton(
              child: Text("Add Schedule"),
              onPressed: () {
                // scheduleAdd(
                //     name: null,
                //     startTime: null,
                //     startMinutes: null,
                //     endTime: null,
                //     endMinutes: null);
              },
            ),
            RaisedButton(
              child: Text("Get All Records"),
              onPressed: () async {
                RecordsModel xx = await recordsGet();
                _scaffoldKey.currentState.showSnackBar(
                  SnackBar(
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Text("    Loading"),
                      ],
                    ),
                  ),
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailsPage(xx)));
              },
            ),
            RaisedButton(
              child: Text("Get All Records with filter"),
              onPressed: () {
                // recordsGetWithFilter(from: ,to: ,);
              },
            ),
          ],
        ),
      ),
    );
  }
}
