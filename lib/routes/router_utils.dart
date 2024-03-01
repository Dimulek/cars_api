enum Pages {
  home,
  infoCar,
  error,
}

extension AppPageExtension on Pages {
  String get screenPath {
    return switch (this) {
      Pages.home => '/',
      Pages.infoCar => 'info_car_:id',
      Pages.error => 'error',
    };
  }

  String get screenName {
    return switch (this) {
      Pages.home => 'HOMECAR',
      Pages.infoCar => 'INFOCAR',
      Pages.error => 'ERROR',
    };
  }
}
