import 'package:exchange_house_app/main.dart' as app;
import 'package:exchange_house_app/src/presentation/widgets/custom_button.dart';
import 'package:exchange_house_app/src/presentation/widgets/custom_text_field.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Home Page 2E2 test', () {
    testWidgets('Test conversion request with textEditingController',
        (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(CustomTextField), '2');
      await tester.pumpAndSettle();

      expect(find.text('2'), findsOneWidget);

      var button = find.byType(CustomButton);
    });
  });
}
