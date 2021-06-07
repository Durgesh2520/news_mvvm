class Constants {
  static const API_KEY = 'ab865fd97d27427586301af85cfea299';

  static const String TOP_HEADER_LINES_URL =
      'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$API_KEY';

  static const String APPLE_NEWS_URL =
      'https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=$API_KEY';

  static String headLinesFor(country) {
    return 'https://newsapi.org/v2/top-headlines?country=in&apiKey=$API_KEY';
  }

  static const Map<String, String> Countries = {
    'India': 'in',
  };
}
