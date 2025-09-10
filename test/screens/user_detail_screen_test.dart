import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:user_form_app/screens/user_detail_screen.dart';

void main() {
  testWidgets('UserDetailScreen renders user data', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: UserDetailScreen()));
    expect(find.text('Nombre: Juan'), findsOneWidget);
    expect(find.text('Apellido: Pérez'), findsOneWidget);
    expect(find.text('Fecha de nacimiento: 01/01/2000'), findsOneWidget);
    expect(find.text('Direcciones:'), findsOneWidget);
    expect(find.text('Calle 123 #45-67'), findsOneWidget);
    expect(find.text('Cra 10 #20-30'), findsOneWidget);
  });
}
