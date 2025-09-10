import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_form_app/screens/address_list_screen.dart';

void main() {
  testWidgets('AddressListScreen renders and adds address', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: AddressListScreen()));
    expect(find.text('País'), findsOneWidget);
    expect(find.text('Departamento'), findsOneWidget);
    expect(find.text('Municipio'), findsOneWidget);
    expect(find.text('Dirección física'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'Colombia');
    await tester.enterText(find.byType(TextFormField).at(1), 'Antioquia');
    await tester.enterText(find.byType(TextFormField).at(2), 'Medellín');
    await tester.enterText(find.byType(TextFormField).at(3), 'Calle 123 #45-67');
    await tester.tap(find.text('Agregar dirección'));
    await tester.pump();
    expect(find.text('Calle 123 #45-67'), findsOneWidget);
  });
}
