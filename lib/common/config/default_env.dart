class DefaultConfig {
  ///Base Url API
  static const String URL_GEOCODING_OPEN_MAPS = "https://nominatim.openstreetmap.org/reverse"; //Link get detail place(OpenStreetMaps)
  // static const baseUrl = 'https://api.chargenow.io/api/v1';
  static const baseUrlWebSocketDev= 'wss://chat-dev.toprate.io/websocket';
  static const baseUrlWebSocketProduct= 'wss://chat.chargenow.io/websocket';
  static const baseUrl = 'https://api.openweathermap.org';
  // static const baseUrlProdChat = 'https://chat.chargenow.io';
  static const baseUrlProdChat = 'https://chat-dev.toprate.io';

  ///Suffix API
  static const getWeatherNowEndPoint = '/data/2.5/weather';




  // static const loginUrl = baseUrl + imagePath;
  static const getWeatherNowUrl = baseUrl + getWeatherNowEndPoint;










}
