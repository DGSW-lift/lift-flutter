import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lift/core/helpers/token_storage_helper.dart';
import 'package:lift/domain/login/view/login_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
    if (bytes <= 0) return "0B";
    const suffixes = ["B", "KB", "MB", "GB", "TB"];
    final i = (log(bytes) / log(1024)).floor();
    final size = bytes / pow(1024, i);
    return '${size.toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: SettingsList(
          sections: [
          SettingsSection(
            title: Text('개인환경설정'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                title: Text('일반'),
                onPressed: (_) {},
              ),
              SettingsTile.navigation(title: Text('테마'), onPressed: (_) {}),
            ],
          ),
          SettingsSection(
            title: Text('정보'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                title: Text('버전 정보'),
                onPressed: (_) {},
              ),
              SettingsTile.navigation(
                title: Text('개인정보 처리방침'),
                onPressed: (_) {},
              ),
              SettingsTile.navigation(
                title: Text('자주 묻는 질문'),
                onPressed: (_) {},
              ),
            ],
          ),
          SettingsSection(
            title: Text('유저'),
            tiles: [
              SettingsTile.navigation(
                  onPressed: (_) {
                    setState(() {
                      _clearCache;
                      _cacheSize = '0B';
                      print(_cacheSize);
                    });
                  },
                  title: Text('캐시 삭제'),
                  value: Text(_cacheSize)),
              SettingsTile.navigation(
                title: Text(
                  '로그아웃',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: (_) {
                  _showAlertDialog(context);
                },
              ),
              SettingsTile.navigation(
                title: Text(
                  '회원 탈퇴',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: (_) {},
              ),
            ],
          ),
        ]),
      ),
    ));
  }
}

void _showAlertDialog(BuildContext context) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('로그아웃'),
      content: const Text('정말 로그아웃 하시겠습니까?'),
      actions: <CupertinoDialogAction>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            TokenStorage().clear();
            Get.to(() => const LoginView());
          },
          child: const Text('확인'),
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('취소'),
        ),
      ],
    ),
  );
}
