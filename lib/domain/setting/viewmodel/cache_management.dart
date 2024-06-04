import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';


class CacheSizeWidget extends StatefulWidget {
  @override
  _CacheSizeWidgetState createState() => _CacheSizeWidgetState();
}

class _CacheSizeWidgetState extends State<CacheSizeWidget> {
  String _cacheSize = 'Calculating...';

  @override
  void initState() {
    super.initState();
    _updateCacheSize();
  }

  void _updateCacheSize() async {
    final cacheDir = await getTemporaryDirectory();
    final cacheSize = await _getTotalSizeOfFilesInDir(cacheDir);
    setState(() {
      _cacheSize = _formatBytes(cacheSize);
    });
  }

  Future<int> _getTotalSizeOfFilesInDir(final Directory dir) async {
    int totalSize = 0;
    await for (final entity in dir.list(recursive: true, followLinks: false)) {
      if (entity is File) {
        totalSize += await entity.length();
      }
    }
    return totalSize;
  }

  Future<void> _clearCache() async {
    final cacheDir = await getTemporaryDirectory();
    await _deleteDirectory(cacheDir);
    _updateCacheSize();
  }

  Future<void> _deleteDirectory(Directory dir) async {
    if (dir.existsSync()) {
      dir.listSync().forEach((file) {
        if (file is File) {
          file.deleteSync();
        } else if (file is Directory) {
          _deleteDirectory(file);
        }
      });
    }
  }

  String _formatBytes(int bytes, [int decimals = 2]) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    final i = (log(bytes) / log(1024)).floor();
    final size = bytes / pow(1024, i);
    return '${size.toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_cacheSize),
        ],
      ),
    );
  }
}
