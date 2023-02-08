import 'package:exchange_house_app/src/application/services/locator.dart';
import 'package:exchange_house_app/src/presentation/pages/home/home_page.dart';
import 'package:exchange_house_app/src/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../app/make_app.dart';

void main() {
  late MaterialApp app;

  setUp(() {
    setupGetIt();
    app = makeApp(const HomePage());
  });

  testWidgets('should have a custom button', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pump();
    final Finder customButton = find.byType(CustomButton);
    expect(customButton, findsOneWidget);
  });

}
