///
/// [PREFIX PROVIDER PACKAGE]
///
library prefix_package;

/// LIST OF OPERATOR WITH DATA
List<Operator> datas = [
  Operator(
    name: "telkomsel",
    value: ["0812", "0813", "0821", "0822", "0852", "0853", "0823", "0851"],
  ),
  Operator(
    name: "indosat",
    value: ["0814", "0815", "0816", "0855", "0856", "0857", "0858"],
  ),
  Operator(
    name: "tri",
    value: ["0895", "0896", "0897", "0898", "0899"],
  ),
  Operator(
    name: "smartfren",
    value: ["0881", "0882", "0883", "0884", "0885", "0886", "0887", "0888", "0889"],
  ),
  Operator(
    name: "xl",
    value: ["0817", "0818", "0819", "0859", "0877", "0878"],
  ),
  Operator(
    name: "axis",
    value: ["0838", "0831", "0832", "0833"],
  ),
  Operator(
    name: "bolt",
    value: ["0999", "0998"],
  ),
];

/// METHOD PARSE OPERATOR
String? parseOperator(int? phone) {
  if (phone == null) {
  } else if (phone.toString().length < 3) {
  } else {
    for (Operator item in datas) {
      if (item.value!.contains("0$phone".toString().substring(0, 4))) {
        return item.name;
      }
    }
  }
  return null;
}

/// CLASS OPERATOR
class Operator {
  final String? name;
  final List<String>? value;

  Operator({this.name, this.value});
}
