import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_portfolio_app/app.dart';

void main() {
  testWidgets('Portfolio app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: PortfolioApp(),
      ),
    );

    // Verify that the app loads with real name
    expect(find.text('Junaid Akram'), findsOneWidget);
  });
}
