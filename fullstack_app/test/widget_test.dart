import 'package:flutter_test/flutter_test.dart';
import 'package:fullstack_app/main.dart';
import 'package:fullstack_app/services/api_service.dart';

void main() {
  group('ApiService Tests', () {
    late ApiService apiService;

    setUp(() {
      apiService = ApiService();
    });

    test('fetchProducts returns initial list of products', () async {
      final products = await apiService.fetchProducts();
      expect(products.length, 2);
      expect(products.first.title, 'Flutter Developer Guide');
    });

    test('addProduct adds a new product to the list', () async {
      final newProduct = await apiService.addProduct('New Book', 'A description', 19.99);
      expect(newProduct.title, 'New Book');

      final products = await apiService.fetchProducts();
      expect(products.length, 3);
      expect(products.last.title, 'New Book');
    });
  });

  group('Widget Tests', () {
    testWidgets('FullStackApp displays title and product list', (WidgetTester tester) async {
      await tester.pumpWidget(const FullStackApp());
      expect(find.text('Fullstack Store'), findsOneWidget);

      await tester.pumpAndSettle();
      expect(find.text('Flutter Developer Guide'), findsOneWidget);
      expect(find.text('Cloud Architecture Handbook'), findsOneWidget);
    });
  });
}
