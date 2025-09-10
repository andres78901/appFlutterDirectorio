import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:user_form_app/main.dart';

void main() {  
    testWidgets('UserFormScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.text('Nombre'), findsOneWidget);
      expect(find.text('Apellido'), findsOneWidget);
      expect(find.text('Selecciona fecha de nacimiento'), findsOneWidget);
    });
}
