import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:http/http.dart' as http;

/// http://www.pythonchallenge.com/pc/def/channel.html
///
/// answer

Future<void> main() async {
  // in the page source there is comment "zip"
  // http://www.pythonchallenge.com/pc/def/channel.zip
  var response = await http
      .get(Uri.parse('http://www.pythonchallenge.com/pc/def/channel.zip'));
  var archive = ZipDecoder().decodeBytes(response.bodyBytes);
  /* this reveals hints inside readme.txt
   hint 1: start from 90052
   hint 2: answer is inside the zip
  for (var file in archive) {
    print('name: ${file.name} content: ${utf8.decode(file.content)}');
  }*/
  var nothing = 90052;
  // this while revealed another hint: collect the comments
  while (true) {
    var file =
        archive.files.where((element) => element.name == '$nothing.txt').first;
    var content = utf8.decode(file.content);
    if (content.contains('Next nothing is')) {
      nothing = int.parse(content.split(' ').last);
      print('next nothing: $nothing');
    } else {
      print('breaking content: $content');
      break;
    }
  }
  /*
  for (var file in archive) {
    print(
        'file: ${file.name} comment: ${file.comment}'); // comments are all null
  }*/
  // after looking at dart archive package i found out there is no support for comments...
  // ArchiveFile has field for comment but it is never populated
  // fall back to python then :|
}
