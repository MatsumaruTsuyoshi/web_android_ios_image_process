import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ImageUpload {
  Future imageUpload(Uint8List uint8list) async {
    final url = Uri.parse('https://httpbin.org/post');
    final body = {
      "imageUint": uint8list,
    };
    var bodyEncode = json.encode(body);
    var response = await http.post(
      url,
      body: bodyEncode,
      headers: {"Accept": "application/json"},
    );
    if (response.statusCode == 200) {
      print('success');
    } else {
      print('failed');
    }
  }
}
