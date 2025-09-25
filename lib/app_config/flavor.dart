enum Flavor {
  development('https://itsochvts.com/'),
  production('http://prod.itsochvts.com/');

  final String baseUrl;
  const Flavor(this.baseUrl);
}

class FlavorConfig {
  static late Flavor appFlavor;
}
