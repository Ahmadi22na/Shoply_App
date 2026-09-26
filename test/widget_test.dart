import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_shop_app/main.dart';

void main() {
  testWidgets('Login screen shows ShopApp title', (WidgetTester tester) async {
    await tester.pumpWidget(const ShopApp());

    // Sanity check: the Login screen (our home screen) renders its title.
    expect(find.text('ShopApp'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
  });
}
