import 'package:http/http.dart' as http;

/// http://www.pythonchallenge.com/pc/def/equality.html
///
/// answer linkedlist

Future<void> main() async {
  // One small letter, surrounded by EXACTLY three big bodyguards on each of
  //its sides. Like xXXXxXXXx
  var url = Uri.parse('http://www.pythonchallenge.com/pc/def/equality.html');
  var response = await http.get(url);
  var start = response.body.lastIndexOf('<!--');
  var messyString = response.body.substring(start);
  var regexp = RegExp(r'[^A-Z][A-Z]{3}[a-z][A-Z]{3}[^A-Z]');
  var results = regexp.allMatches(messyString);
  var answer = '';
  results.forEach((element) {
    answer += messyString.substring(element.start + 4, element.end - 4);
  });
  print('$answer');
}
