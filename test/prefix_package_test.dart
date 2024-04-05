import 'package:flutter_test/flutter_test.dart';
import 'package:prefix_provider/prefix_provider.dart';

void main() {
  group('Prefix Package Test\n', () {
    test('Returns list of data telkomsel', () {
      final telkomselOperator = Operator(
        name: "telkomsel",
        value: ["0812", "0813", "0821", "0822", "0852", "0853", "0823", "0851"],
      );
      expect(datas[0].name, contains(telkomselOperator.name));
    });

    test('Constructor initializes correctly', () {
      final datas = Operator(name: 'telkomsel', value: ["0812", "0813", "0821", "0822", "0852", "0853", "0823", "0851"]);

      expect(datas.name, 'telkomsel');
      expect(datas.value, ["0812", "0813", "0821", "0822", "0852", "0853", "0823", "0851"]);
    });

    test('Constructor with null values initializes correctly', () {
      final data = Operator();

      expect(data.name, isNull);
      expect(data.value, isNull);
    });

    test('Returns correct operator name when valid input is provided', () {
      const phone = 1234567890;

      datas = [
        Operator(name: 'Operator1', value: ['0123', '4567']),
        Operator(name: 'Operator2', value: ['9876', '5432']),
      ];

      final result = parseOperator(phone);

      expect(result, 'Operator1');
    });

    test('Returns null when phone is null', () {
      const phone = null;

      final result = parseOperator(phone);

      expect(result, isNull);
    });

    test('Returns null when phone length is less than 3', () {
      const phone = 12;

      final result = parseOperator(phone);

      expect(result, isNull);
    });

    test('Data is not empty', () {
      expect(datas, isNotEmpty);
    });

    test('Returns null data', () {
      expect(datas = [], isEmpty);
    });

    test('Data does not contain unknown operator', () {
      final unknownOperator = Operator(name: "unknown", value: ["1234"]);

      expect(datas, isNot(contains(unknownOperator)));
    });
  });
}
