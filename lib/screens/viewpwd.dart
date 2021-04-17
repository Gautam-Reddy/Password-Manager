import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewPwd extends StatefulWidget {
  final Map data;
  final String time;
  final DocumentReference ref;

  ViewPwd(this.data,this.time,this.ref);

  @override
  _ViewPwdState createState() => _ViewPwdState();
}

class _ViewPwdState extends State<ViewPwd> {

  String type;
  String name;
  String pwd;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, 
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 24.0,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.grey[700],
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 8.0
                            )
                          ),
                        ),
                    ),
                    ElevatedButton(
                      onPressed: delete, 
                        child: Icon(
                          Icons.delete_forever,
                          size: 24.0,
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.red[300],
                          ),
                          padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(
                              horizontal: 25.0,
                              vertical: 8.0

                            )
                          ),
                        ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Column(
                  children: [
                    Text(
                      "${widget.data['type']}",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontFamily: "lato",
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      
                    ),
                     Padding(
                       padding: const EdgeInsets.only(top:12.0 , bottom: 12.0),
                       child: Text(
                        widget.time,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "lato",
                            color: Colors.grey,
                          ),
                        
                    ),
                     ),
                    Container(
                      child: Text(
                        "Username: "+ widget.data['name'],
                          style: TextStyle(
                            fontSize: 20.0,
                            fontFamily: "lato",
                            color: Colors.grey,
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Container(
                        child: Text(
                          "Password: "+"${widget.data['pwd']}",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontFamily: "lato",
                              color: Colors.grey,
                            ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }


      void delete() async{
     
      await widget.ref.delete();
      Navigator.pop(context);
    }





}