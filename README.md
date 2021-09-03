# web_android_ios_image_process

画像の取得はimage_pickerを使用

FlutterWebではFile系が使えないので、取得した画像をUint8Listに変換してFlutterWeb, Android, iOSで画像の表示を確認

取得したUint8Listを[httpbin](https://httpbin.org/post)にPOSTして、データのアップロードを確認

FlutterWebはChrome, Android, iOSともに実機で動作確認済み
