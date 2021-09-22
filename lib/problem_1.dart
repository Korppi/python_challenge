import 'dart:convert' show utf8;

/// http://www.pythonchallenge.com/pc/def/map.html
///
/// answer ocr

void main() {
  var crypticString =
      "g fmnc wms bgblr rpylqjyrc gr zw fylb. rfyrq ufyr amknsrcpq ypc dmp. bmgle gr gl zw fylb gq glcddgagclr ylb rfyr'q ufw rfgq rcvr gq qm jmle. sqgle qrpgle.kyicrpylq() gq pcamkkclbcb. lmu ynnjw ml rfc spj.";
  solveCrypticMessage(crypticString);
  crypticString = 'map';
  solveCrypticMessage(crypticString);
}

void solveCrypticMessage(String crypticString) {
  var codeUnits = crypticString.codeUnits;
  codeUnits = codeUnits.map((e) {
    if (e > 122 || e < 97) return e;
    if ((e + 2) > 122) {
      e = 94 + ((e + 2) % 122); // yz becomes ab
    }
    return e += 2;
  }).toList();
  var result = utf8.decode(codeUnits);
  print('$result');
}
