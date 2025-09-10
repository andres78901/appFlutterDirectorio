import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_form_app/screens/user_form_screen.dart';

void main() {
  testWidgets('UserFormScreen renders and validates', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: UserFormScreen()));
    expect(find.text('Nombre'), findsOneWidget);
    expect(find.text('Apellido'), findsOneWidget);
    expect(find.text('Selecciona fecha de nacimiento'), findsOneWidget);

    await tester.enterText(find.byType(TextFormField).at(0), 'Juan');
    await tester.enterText(find.byType(TextFormField).at(1), 'Pérez');
    await tester.tap(find.text('Agregar dirección'));
    await tester.pump();
    expect(find.text('Agregar dirección'), findsOneWidget);
  });
}
