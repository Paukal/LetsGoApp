import 'package:flutter/material.dart';
import './map.dart';
import 'menu.dart';
import 'client.dart';

class AddEvent extends StatefulWidget {
  String city;
  String street;
  String enteredAddress;

  AddEvent(this.city, this.street, this.enteredAddress);

  @override
  State<AddEvent> createState() => AddEventState(city, street, enteredAddress);
}

class AddEventState extends State<AddEvent> {
  String city;
  String street;
  String enteredAddress;

  AddEventState(this.city, this.street, this.enteredAddress);

  var s1 = LoggedInSingleton();
  bool public = false;
  bool popUpForVerify = false;
  final _formKey = GlobalKey<FormState>();

  String eventName = "";
  String placeName = "";
  String link = "";
  String startDate = "";
  String userId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("Add a new event"),
        ),
        body: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Column(children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Event name"),
                  onTap: () {
                    setState(() {
                      popUpForVerify = false;
                    });
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      eventName = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field can't be empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                  InputDecoration(labelText: "Place name (optional)"),
                  onTap: () {
                    setState(() {
                      popUpForVerify = false;
                    });
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      placeName = newValue!;
                    });
                  },
                ),
                TextFormField(
                  decoration:
                  InputDecoration(labelText: "Link to event page (optional)"),
                  onTap: () {
                    setState(() {
                      popUpForVerify = false;
                    });
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      link = newValue!;
                    });
                  },
                ),
                TextFormField(
                  initialValue: "2021-07-30 19:00:00",
                  decoration: InputDecoration(labelText: "Start date"),
                  keyboardType: TextInputType.datetime,
                  onTap: () {
                    setState(() {
                      popUpForVerify = false;
                    });
                  },
                  onChanged: (String? newValue) {
                    setState(() {
                      startDate = newValue!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field can't be empty";
                    }
                    return null;
                  },
                ),
                SwitchListTile(
                  onChanged: (bool value) {
                    if (s1.accVerified) {
                      setState(() {
                        public = !public;
                      });
                    } else {
                      setState(() {
                        popUpForVerify = true;
                      });
                    }
                  },
                  value: public,
                  title: new Text('Public event',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.red)),
                ),
                popUpForVerify
                    ? Text("Need to verify account to make your event public")
                    : Container(),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Processing Data')));

                      userId = s1.userId;
                      if(placeName == ""){
                        placeName = enteredAddress;
                      }

                      sendNewEventDataToServer(eventName, placeName, link, street, city, startDate, public.toString(), userId);
                    }
                  },
                  child: Text('Submit'),
                )
              ]),
            ])));
  }
}
