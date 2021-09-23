import 'package:http/http.dart' as http;

/// http://www.pythonchallenge.com/pc/def/linkedlist.php
///
/// answer peak.html

Future<void> main() async {
  // there is link with parameter "nothing". Follow it and see where it ends.
  // 400 times is more than enough!
  // <a href="linkedlist.php?nothing=12345"><img src="chainsaw.jpg" border="0"></a>
  // other pages say "and the next nothing is xxx"
  // until you hit 16044 and it tells you to divine by 2 and keep going

  var count = 0;
  var nothing = '12345'; // found from problem page source code
  while (true) {
    count++;
    if (count > 400) break; // just in case!
    var url = Uri.parse(
        'http://www.pythonchallenge.com/pc/def/linkedlist.php?nothing=$nothing');
    var response = await http.get(url);
    var body = response.body;
    var index = body.indexOf('and the next nothing is ');
    if (index != -1) {
      // there is next nothing!
      nothing = body.split(' ').last;
    } else {
      if (body.contains('Yes. Divide by two and keep going.')) {
        // special case!
        print('$body and old nothing: $nothing');
        nothing = (int.parse(nothing) ~/ 2)
            .toString(); // str -> int -> divide -> back to str
        print('new nothing $nothing');
      } else {
        print('$body');
        break;
      }
    }
  }
  print('$count'); // 251
}
