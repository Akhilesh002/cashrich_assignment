class Constant {
  Constant._internal();

  static const String BASE_URL = "https://pro-api.coinmarketcap.com/";
  static const String API_URL =
      "${BASE_URL}v1/cryptocurrency/quotes/latest?symbol=BTC,ETH,LTC";
  static const String AUTH_KEY = "X-CMC_PRO_API_KEY";
  static const String AUTH_VALUE = "27ab17d1-215f-49e5-9ca4-afd48810c149";
}
