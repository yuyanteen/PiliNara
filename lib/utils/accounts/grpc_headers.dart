import 'dart:convert';

import 'package:PiliPlus/common/constants.dart';
import 'package:PiliPlus/grpc/bilibili/metadata.pb.dart';
import 'package:PiliPlus/grpc/bilibili/metadata/device.pb.dart';
import 'package:PiliPlus/grpc/bilibili/metadata/fawkes.pb.dart';
import 'package:PiliPlus/grpc/bilibili/metadata/locale.pb.dart';
import 'package:PiliPlus/grpc/bilibili/metadata/network.pb.dart' as network;
import 'package:PiliPlus/utils/login_utils.dart';
import 'package:PiliPlus/utils/utils.dart';

abstract final class GrpcHeaders {
  static const _build = 8430300;
  static const _versionName = '8.43.0';
  static const _biliChannel = 'master';
  static const _mobiApp = 'android';
  static const _device = 'android';
  static const _brand = 'Redmi';
  static const _model = '23013RK75C';
  static const _osver = '16';
  static const _fp =
      'b62983f45c4d642dcc786fc02748a210202411020151005bed865a8569fdbf9f';
  static const _userAgent =
      'Dalvik/2.1.0 (Linux; U; Android $_osver; $_model Build/BP2A.250605.031.A3) '
      '$_versionName os/android model/$_model mobi_app/$_mobiApp '
      'build/$_build channel/master innerVer/$_build osVer/$_osver network/2';

  static String get _buvid => LoginUtils.buvid;
  static String get _traceId => Constants.traceId;

  static final Map<String, String> _base = {
    'grpc-encoding': 'gzip',
    'gzip-accept-encoding': 'gzip,identity',
    'user-agent': _userAgent,
    'x-bili-gaia-vtoken': '',
    'x-bili-aurora-zone': '',
    'x-bili-trace-id': _traceId,
    'buvid': _buvid,
    'bili-http-engine': 'cronet',
    // 'te': 'trailers', // dio not supported
    'x-bili-device-bin': base64Encode(
      Device(
        appId: 1,
        build: _build,
        buvid: _buvid,
        mobiApp: _mobiApp,
        platform: _device,
        channel: _biliChannel,
        brand: _brand,
        model: _model,
        osver: _osver,
        fpLocal: _fp,
        fpRemote: _fp,
        versionName: _versionName,
        fp: _fp,
      ).writeToBuffer(),
    ),
    'x-bili-network-bin': base64Encode(
      network.Network(type: network.NetworkType.WIFI).writeToBuffer(),
    ),
    'x-bili-locale-bin': base64Encode(
      Locale(
        cLocale: LocaleIds(language: 'zh', region: 'CN', script: 'Hans'),
        sLocale: LocaleIds(language: 'zh', region: 'CN', script: 'Hans'),
        timezone: 'Asia/Shanghai',
      ).writeToBuffer(),
    ),
    'x-bili-exps-bin': '',
  };

  static String get fawkes => base64Encode(
    FawkesReq(
      appkey: 'android64',
      env: 'prod',
      sessionId: Utils.generateRandomString(8),
    ).writeToBuffer(),
  );

  static Map<String, String> newHeaders([String? accessKey, int? mid]) {
    return {
      ..._base,
      if (accessKey != null) 'authorization': 'identify_v1 $accessKey',
      if (mid != null) 'x-bili-mid': '$mid',
      'x-bili-fawkes-req-bin': fawkes,
      'x-bili-metadata-bin': base64Encode(
        Metadata(
          accessKey: accessKey,
          mobiApp: _mobiApp,
          device: _device,
          build: _build,
          channel: _biliChannel,
          buvid: _buvid,
          platform: _device,
        ).writeToBuffer(),
      ),
    };
  }
}
