import 'package:http/http.dart' as http;

/// http://www.pythonchallenge.com/pc/def/ocr.html
///
/// answer equality

Future<void> main() async {
  var url = Uri.parse('http://www.pythonchallenge.com/pc/def/ocr.html');
  var response = await http.get(url);
  var start =
      response.body.lastIndexOf('<!--') + 4; // +4 so we skip starting <!--
  var end = response.body.lastIndexOf('-->');
  var messyString = response.body.substring(start, end);
  // var charCounts = SortedMap(Ordering.byValue());
  var charCounts = <String, int>{};
  messyString = messyString.trim(); //
  messyString.split('').forEach((char) {
    charCounts.update(char, (value) => ++value, ifAbsent: () => 0);
  });
  // i used sortermap before and found out that there are some letters
  // which are rare (they appear only once) so i do this removeWhere
  charCounts.removeWhere((key, value) => value > 1);
  print('${charCounts.keys.toString()}');
}
