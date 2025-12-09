import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class IReadFilesRepository {
  Future<Uint8List> readBytesFromFile(String assetPath);
}

class ReadFilesRepository implements IReadFilesRepository {
  ReadFilesRepository();

  @override
  Future<Uint8List> readBytesFromFile(String assetPath) async {
    try {
      final ByteData data = await rootBundle.load(assetPath);
      final Uint8List bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      return bytes;
    } on FlutterError catch (_) {
      throw Exception('Falha ao ler o asset "$assetPath". Verifique se o caminho está correto no pubspec.yaml.');
    } catch (e) {
      throw Exception('Falha desconhecida ao ler o asset.');
    }
  }
}