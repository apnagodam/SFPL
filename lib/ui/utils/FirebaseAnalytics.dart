import 'package:firebase_analytics/firebase_analytics.dart';

class Firebaseanalytics {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> initialiseAnalytics() async {
    await FirebaseAnalytics.instance.logBeginCheckout(
        value: 10.0,
        currency: 'USD',
        items: [
          AnalyticsEventItem(
              itemName: 'Socks', itemId: 'xjw73ndnw', price: 10.0),
        ],
        coupon: '10PERCENTOFF');
  }
}
