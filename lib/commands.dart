import 'enums.dart';
import 'dart:typed_data';

class EpsonEPOSCommand {
  String _enumText(dynamic enumName) {
    List<String> ns = enumName.toString().split('.');
    if (ns.length > 0) {
      return ns.last;
    }
    return enumName.toString();
  }

  Map<String, dynamic> append(dynamic data) {
    return {"id": "appendText", "value": data};
  }

  Map<String, dynamic> rawData(Uint8List data) {
    return {"id": "printRawData", "value": data};
  }

  Map<String, dynamic> addFeedLine(dynamic data) {
    return {"id": "addFeedLine", "value": data};
  }

  Map<String, dynamic> addLineSpace(dynamic data) {
    return {"id": "addLineSpace", "value": data};
  }

  Map<String, dynamic> addDrawer(dynamic data) {
    return {"id": "addDrawer", "value": data};
  }

  Map<String, dynamic> addCut(EpsonEPOSCut data) {
    final cutData = _enumText(data);
    return {"id": "addCut", "value": cutData};
  }

  Map<String, dynamic> addTextAlign(EpsonEPOSTextAlign data) {
    final cutData = _enumText(data);
    return {"id": "addTextAlign", "value": cutData};
  }

  Map<String, dynamic> appendBitmap(
      dynamic data, int width, int height, int posX, int posY) {
    Map<String, dynamic> cmd = {"id": "addImage", "value": data};
    cmd['width'] = width;
    cmd['height'] = height;
    cmd['posX'] = posX;
    cmd['posY'] = posY;

    return cmd;
  }
}
