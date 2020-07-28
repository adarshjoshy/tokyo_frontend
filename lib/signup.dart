import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'const.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './globals.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Color c = Color(0xFFFFFFFF);

  var _name = null;
  var _uname = null;
  var _bgroup = null;
  var _mob = null;
  var _password = null;
  var _genderSelected;

  final nameCont = TextEditingController();
  final unameCont = TextEditingController();
  final bgroupCont = TextEditingController();
  final mobCont = TextEditingController();
  final passCont = TextEditingController();
  final pass2Cont = TextEditingController();

  Widget _buildNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: nameCont,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Colors.white,
              ),
              hintText: 'Name',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUnameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'User Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: unameCont,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.account_box,
                color: Colors.white,
              ),
              hintText: 'Enter your RollNo (BxxxxxxCS)',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBGroupTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Blood Group',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: bgroupCont,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.center_focus_strong,
                color: Colors.white,
              ),
              hintText: 'Blood Group (Eg: O+)',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  void _handleRadioChange(String value) {
    setState(() {
      _genderSelected = value;
    });
  }

  Widget _buildGenderF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Gender',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Radio(
                    value: 'M',
                    groupValue: _genderSelected,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      _handleRadioChange(value);
                    }),
                Text(
                  'Male',
                  style: kLabelStyle,
                ),
                Radio(
                    value: 'F',
                    groupValue: _genderSelected,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      _handleRadioChange(value);
                    }),
                Text(
                  'Female',
                  style: kLabelStyle,
                ),
                Radio(
                    value: 'O',
                    groupValue: _genderSelected,
                    activeColor: Colors.white,
                    onChanged: (value) {
                      _handleRadioChange(value);
                    }),
                Text(
                  'Other',
                  style: kLabelStyle,
                ),
              ],
            )),
      ],
    );
  }

  Widget _buildMobTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mobile',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: mobCont,
            keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.phone,
                color: Colors.white,
              ),
              hintText: 'Phone No',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: passCont,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: pass2Cont,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Re-Enter Password',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          print('SignUp Button Pressed');
          setState(() {
            if (unameCont.text == "" ||
                nameCont.text == "" ||
                bgroupCont.text == "" ||
                _genderSelected == null ||
                mobCont.text == "" ||
                passCont.text == "" ||
                pass2Cont.text == "") {
              print("All details not entered");
              //Give alert to enter all details
            } else if (passCont.text != pass2Cont.text) {
              print("Passwords do not match");
              //Give alert to check passwords
            } else {
              c = Color(0xff34eb61);
              _name = nameCont.text;
              _uname = unameCont.text;
              _bgroup = bgroupCont.text;
              _mob = mobCont.text;
              _password = passCont.text;

              _makeSignUpRequest();
            }
          });
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: c,
        child: Text(
          'SIGNUP',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  void _makeSignUpRequest() async {
    //Map<String, String> headers = {'Content-Type': 'application/json; charset=UTF-8'};
    //String json = '{"uname": "$_emailID", "passwd": "$_password"}';
    var response = await http.post(
      url + 'signup',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': _name,
        'uname': _uname,
        'gnd': _genderSelected,
        'bgroup': _bgroup,
        'mob': _mob,
        'passwd': _password
      }),
    );
    int status = response.statusCode;
    Map<String, dynamic> data = json.decode(response.body);
    if (data['ERROR'] != null) {
      print("ERROR: ${data['ERROR']}");
    } else {
      print("Give Alert: Signup Successful. Login to continue");
      Navigator.pop(context);
    }
    print("Response status from server: $status message: ${data['status']}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'NITC Health Care',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildNameTF(),
                      SizedBox(height: 25.0),
                      _buildUnameTF(),
                      SizedBox(height: 25.0),
                      _buildBGroupTF(),
                      SizedBox(height: 25.0),
                      _buildGenderF(),
                      SizedBox(height: 25.0),
                      _buildMobTF(),
                      SizedBox(height: 25.0),
                      _buildPasswordTF(),
                      _buildConfirmPasswordTF(),
                      SizedBox(height: 15.0),
                      _buildSignUpBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
