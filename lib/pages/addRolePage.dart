import 'package:flutter/material.dart';
import 'package:test_case/services/apiRolesFunction.dart';

class AddRolePage extends StatefulWidget {
  @override
  _AddRolePageState createState() => _AddRolePageState();
}

class _AddRolePageState extends State<AddRolePage> {
  final departmentControl = TextEditingController();
  final groupNameControl = TextEditingController();
  final groupIdControl = TextEditingController();

  final _userNameKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var xx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Form(
                key: _userNameKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) return 'Please enter Group Name';
                      },
                      controller: groupNameControl,
                      decoration: InputDecoration(
                        labelText: 'GroupName',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) return 'Please enter Group ID';
                      },
                      decoration: InputDecoration(
                        labelText: 'Group ID',
                      ),
                      controller: groupIdControl,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value.isEmpty) return 'Please enter Department';
                      },
                      decoration: InputDecoration(labelText: "Department"),
                      controller: departmentControl,
                    ),
                    RaisedButton(
                      child: Text("Add"),
                      onPressed: () async {
                        xx = await rolesAdd(
                            groupId: int.parse(groupIdControl.text),
                            groupName: groupNameControl.text,
                            department: departmentControl.text);

                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(xx.toString()),
                            ],
                          ),
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
