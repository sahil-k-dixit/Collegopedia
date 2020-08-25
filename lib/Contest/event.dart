import 'package:googleapis/calendar/v3.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'dart:convert';
//
////get Service Account Credentials
//final accountCredentials = new ServiceAccountCredentials.fromJson({
//  "private_key_id": "108478922145744454927",
//  "private_key": "86aa98d1518c47677a4596996e8fec14e9721d46",
//  "client_email": "sahildxgeneration10@gmail.com",
//  "client_id": "",
//  "type": "service_account"
//});
//var _scopes = [CalendarApi.CalendarScope]; //defines the scopes for the calendar api
//
//void getCalendarEvents() {
//  clientViaServiceAccount(accountCredentials, _scopes).then((client) {
//    var calendar = new CalendarApi(client);
//    var calEvents = calendar.events.list("primary");
//    calEvents.then((Events events) {
//      events.items.forEach((Event event) {print(event.summary);});
//    });
//  });
//}

import 'package:http/http.dart' as http;

Future<http.Response> fetchEvents(http.Client client) async {

 // final response = await client.get('https://www.googleapis.com/calendar/v3/calendars/8a4ko50nq55ma5smhuhdp5rpmaek45lg@import.calendar.google.com/events?timeMax=2020-10-12T07%3A20%3A50.52Z&timeMin=2019-10-12T07%3A20%3A50.52Z&key=AIzaSyD4GvM4YABv1hXQLCiSHmRnFkvA752IX44');

  final response = await client.get('https://www.townscript.com/api/eventdata/getallupcomingeventsforuser');
  print((response.body));
}


//Future<List<Event>> getEvents() =>
//    calendarApi.events.list("primary",
//    )
//        .then((Events events){
//      return events.items;
//    }).catchError((e){
//      print("error encountered");
//      print("${e.toString()}");
//    });