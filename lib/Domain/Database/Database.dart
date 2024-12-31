import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:swfl/Data/Model/AuthenticationModel.dart';

class Database {
  Future<bool> addNewMovie(UserDetailsAuth m) async {
    var db = await Db.create(
        "mongodb+srv://apnagodam:WOU8uu5VoGWuaaZW@cluster0.humxj.mongodb.net/");
    await db.open();

    final _mobileDeviceIdentifier =
        await MobileDeviceIdentifier().getDeviceId();
    print(_mobileDeviceIdentifier);
    var userDetailsCollection =
        db.collection(_mobileDeviceIdentifier.toString());

    try {
      await userDetailsCollection.insert(m.toMap());
      // await _movies
      //     .doc(_mobileDeviceIdentifier)
      //     .set(m.toMap()); // Adding a new document to our movies collection
      return true; // finally return true
    } catch (e) {
      return Future.error(e); // return error
    }
  }

  Future<bool> findData(UserDetailsAuth m) async {
    var db = await Db.create(
        "mongodb+srv://apnagodam:WOU8uu5VoGWuaaZW@cluster0.humxj.mongodb.net/");
    await db.open();

    final _mobileDeviceIdentifier =
        await MobileDeviceIdentifier().getDeviceId();

    var userDetailsCollection =
        db.collection(_mobileDeviceIdentifier.toString());

    try {
      await userDetailsCollection.insert(m.toMap());
      // await _movies
      //     .doc(_mobileDeviceIdentifier)
      //     .set(m.toMap()); // Adding a new document to our movies collection
      return true; // finally return true
    } catch (e) {
      return Future.error(e); // return error
    }
  }
}

// Creating a simple Riverpod provider that provides an instance of our Database class so that it can be used from our UI(by calling Database class methods)
final databaseProvider = Provider((ref) => Database());
