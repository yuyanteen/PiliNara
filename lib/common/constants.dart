abstract final class Constants {
  static const appName = 'PiliNara';
  static const sourceCodeUrl = 'https://github.com/Starfallan/PiliNara';
  static const upstreamCodeUrl = 'https://github.com/bggRGjQaUbCoE/PiliPlus';
    

  // 粉版 Android（默认）
  static const String appKey = '1d8b6e7d45233436';
  static const String appSec = '560c52ccd288fed045859ed18bffd973';

  // HD 版（仅 getHDcode 使用）
  static const String appKeyHD = 'dfca71928277209b';
  static const String appSecHD = 'b5475a8825547a4fc26c7d518eaaa02e';

  static const String traceId =
      '11111111111111111111111111111111:1111111111111111:0:0';
  static const String userAgent =
      'Mozilla/5.0 BiliDroid/8.43.0 (bbcallen@gmail.com) os/android model/android mobi_app/android build/8430300 channel/master innerVer/8430300 osVer/15 network/2';
  static const String statistics =
      '{"appId":1,"platform":3,"version":"8.43.0","abtest":""}';

  // HD 版 UA/statistics（仅 getHDcode 使用）
  static const String userAgentHD =
      'Mozilla/5.0 BiliDroid/2.0.1 (bbcallen@gmail.com) os/android model/android_hd mobi_app/android_hd build/2001100 channel/master innerVer/2001100 osVer/15 network/2';
  static const String statisticsHD =
      '{"appId":5,"platform":3,"version":"2.0.1","abtest":""}';

  // 兼容别名（部分模块仍在使用）
  static const String userAgentApp = userAgent;
  static const String statisticsApp = statistics;

  static const baseHeaders = {
    // 'referer': HttpString.baseUrl,
    'env': 'prod',
    'app-key': 'android64',
    'x-bili-aurora-zone': 'sh001',
  };

  static final urlRegex = RegExp(
    r'https?://[-A-Za-z0-9+&@#/%?=~_|!:,.;]+[-A-Za-z0-9+&@#/%=~_|]',
  );

  static const goodsUrlPrefix = "https://gaoneng.bilibili.com/tetris";

  // 'itemOpusStyle,opusBigCover,onlyfansVote,endFooterHidden,decorationCard,onlyfansAssetsV2,ugcDelete,onlyfansQaCard,editable,opusPrivateVisible,avatarAutoTheme,sunflowerStyle,cardsEnhance,eva3CardOpus,eva3CardVideo,eva3CardComment,eva3CardVote,eva3CardUser'
  static const dynFeatures = 'itemOpusStyle,listOnlyfans,onlyfansQaCard';
}
