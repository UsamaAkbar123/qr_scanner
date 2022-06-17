// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:http/http.dart' as http;
import 'package:sas/widgets/colors.dart';
import 'package:flutter_tts/flutter_tts.dart';

// void main() => runApp(const MaterialApp(home: MyHome()));

// class MyHome extends StatelessWidget {
//   const MyHome({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Flutter Demo Home Page')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.of(context).push(MaterialPageRoute(
//               builder: (context) => const QRViewExample(),
//             ));
//           },
//           child: const Text('qrView'),
//         ),
//       ),
//     );
//   }
// }

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final FlutterTts tts = FlutterTts();
  final TextEditingController controller1 =
      TextEditingController(text: 'Hello world');

  speak(String msg) async {
    await tts.setLanguage('en-US');
    await tts.setPitch(1); // 0.5 to 1.5
    await tts.setSpeechRate(0.5);
    await tts.speak(msg);
  }

  Future<http.Response> postQrScanId() async {
    final data = {"qr_code": "5714016070248"};
    return await http.post(
      Uri.parse('http://saswes.com/api/insert'),
      body: data,
    );
  }

  // Future<int> postQrScanId() async {
  //   final url = Uri.parse('http://saswes.com/api/insert');
  //   Map data = {"qr_code": "3145216064944"};
  //   String body = json.encode(data);
  //   try {
  //     final http.Response response = await http.post(
  //       // Uri.parse('http://saswes.com/api/insert'),
  //       url,
  //       headers: <String, String>{
  //         // 'Content-Type': 'application/json; charset=UTF-8',
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       //body: body,
  //       body: jsonEncode(<String, String>{
  //         'qr_code': '3145216064944',
  //       }),
  //     );

  // debugPrint('Response Body : ${response.body} ');
  // debugPrint('Response Body : ${response.statusCode}');
  //     if (response.statusCode == 200) {
  // Map obj = {};
  // obj = jsonDecode(response.body);
  // debugPrint('Response Body : ${obj['msg'] ?? 'Empty Message'}');
  //       // int id = int.parse(obj);
  //       // debugPrint('tttttttt : $id');
  //       // return id;
  //     } else {
  //       throw Exception('loading failed!');
  //     }
  //   } catch (e) {
  //     debugPrint('tttttttt: ' + e.toString());
  //   }
  //   return -1;
  // }

  postQrCodeData(
    String userId,
  ) async {
    var response = await postQrScanId();
    if (response.statusCode == 200) {
      Map obj = {};
      obj = jsonDecode(response.body);
      debugPrint('Response Body : ${obj['msg'] ?? 'Empty Message'}');
      speak(obj['user'].toString() + ' your attendance has been marked ');
      //Get.snackbar('Message', '${obj['msg'] ?? 'Empty Message'}');
      Get.dialog(AlertDialog(
        backgroundColor: mainColor,
        title: const Text(
          'Message',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          '${obj['msg'] ?? 'Empty Message'}',
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              child: const Text(
                'ok',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ));
      debugPrint('Response Body : ${response.body} ');
      debugPrint('Response Body : ${response.statusCode}');
    }
  }

  @override
  void initState() {
    // postQrCodeData();
    super.initState();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  int count = 1;

  @override
  Widget build(BuildContext context) {
    if (result != null && count == 1) {
      count = 2;
      String val = result!.code.toString();
      debugPrint('Response Body val : $val');
      postQrCodeData(val);
    }
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          Align(
            alignment: Alignment.bottomCenter,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Container(                
                width: Get.width,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.all(8),                         
                          child: InkWell(
                            onTap: () async {
                              await controller?.toggleFlash();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getFlashStatus(),
                              builder: (context, snapshot) {
                                // return Text('Flash: ${snapshot.data}');
                                return snapshot.data == false
                                    ? const Icon(
                                        Icons.flash_off,
                                        size: 28.0,
                                        color: Colors.white,
                                      )
                                    : const Icon(
                                        Icons.flash_on,
                                        size: 28.0,
                                        color: Colors.white,
                                      );
                              },
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () async {
                              await controller?.flipCamera();
                              setState(() {});
                            },
                            child: FutureBuilder(
                              future: controller?.getCameraInfo(),
                              builder: (context, snapshot) {
                                if (snapshot.data != null) {
                                  // return Text(
                                  //     'Camera facing ${describeEnum(snapshot.data!)}');
                                  return const Icon(
                                    Icons.flip_camera_android,
                                    size: 28.0,
                                    color: Colors.white,
                                  );
                                } else {
                                  return const Text('loading');
                                }
                              },
                            ),
                          ),
                        )
                      ],
                    ),                   
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    // var scanArea = (MediaQuery.of(context).size.width < 400 ||
    //         MediaQuery.of(context).size.height < 400)
    //     ? 150.0
    //     : 300.0;
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? MediaQuery.of(context).size.height / 1.2
        : MediaQuery.of(context).size.height / 1.45;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      cameraFacing: CameraFacing.front,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {        
        result = scanData;
      });
      //postQrCodeData(result!.code.toString());
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
