// ignore_for_file: use_full_hex_values_for_flutter_colors

import "package:flutter/material.dart";

class MaterialTheme {
  // final TextTheme textTheme;

  const MaterialTheme();

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278217074),
      surfaceTint: Color(4278217074),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288540922),
      onPrimaryContainer: Color(4278198051),
      secondary: Color(4283065190),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291684331),
      onSecondaryContainer: Color(4278525730),
      tertiary: Color(4283522685),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4292403967),
      onTertiaryContainer: Color(4278983478),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      background: Color(4294310651),
      onBackground: Color(4279704861),
      surface: Color(4294310651),
      onSurface: Color(4279704861),
      surfaceVariant: Color(4292535526),
      onSurfaceVariant: Color(4282337354),
      outline: Color(4285495674),
      outlineVariant: Color(4290693322),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020722),
      inverseOnSurface: Color(4293718770),
      inversePrimary: Color(4286698462),
      primaryFixed: Color(4288540922),
      onPrimaryFixed: Color(4278198051),
      primaryFixedDim: Color(4286698462),
      onPrimaryFixedVariant: Color(4278210390),
      secondaryFixed: Color(4291684331),
      onSecondaryFixed: Color(4278525730),
      secondaryFixedDim: Color(4289842127),
      onSecondaryFixedVariant: Color(4281486158),
      tertiaryFixed: Color(4292403967),
      onTertiaryFixed: Color(4278983478),
      tertiaryFixedDim: Color(4290365162),
      onTertiaryFixedVariant: Color(4281943652),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916149),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797668),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme lightMediumContrastScheme() {
    return const MaterialScheme(

      brightness: Brightness.light,
      primary: Color(4278209361),
      surfaceTint: Color(4278217074),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280582282),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281222986),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284512636),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281680736),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284970133),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      background: Color(4294310651),
      onBackground: Color(4279704861),
      surface: Color(4294310651),
      onSurface: Color(4279704861),
      surfaceVariant: Color(4292535526),
      onSurfaceVariant: Color(4282074182),
      outline: Color(4283916642),
      outlineVariant: Color(4285758590),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020722),
      inverseOnSurface: Color(4293718770),
      inversePrimary: Color(4286698462),
      primaryFixed: Color(4280582282),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278216303),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284512636),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282933347),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284970133),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283325563),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916149),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797668),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme lightHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(4278200107),
      surfaceTint: Color(4278217074),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209361),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278986281),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281222986),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279444029),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281680736),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      background: Color(4294310651),
      onBackground: Color(4279704861),
      surface: Color(4294310651),
      onSurface: Color(4278190080),
      surfaceVariant: Color(4292535526),
      onSurfaceVariant: Color(4280034599),
      outline: Color(4282074182),
      outlineVariant: Color(4282074182),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020722),
      inverseOnSurface: Color(4294967295),
      inversePrimary: Color(4290312191),
      primaryFixed: Color(4278209361),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278202935),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281222986),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279775283),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281680736),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280233033),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205532),
      surfaceBright: Color(4294310651),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916149),
      surfaceContainer: Color(4293521392),
      surfaceContainerHigh: Color(4293126634),
      surfaceContainerHighest: Color(4292797668),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4286698462),
      surfaceTint: Color(4286698462),
      onPrimary: Color(4278203964),
      primaryContainer: Color(4278210390),
      onPrimaryContainer: Color(4288540922),
      secondary: Color(4289842127),
      onSecondary: Color(4280038455),
      secondaryContainer: Color(4281486158),
      onSecondaryContainer: Color(4291684331),
      tertiary: Color(4290365162),
      onTertiary: Color(4280430669),
      tertiaryContainer: Color(4281943652),
      onTertiaryContainer: Color(4292403967),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      background: Color(4279112725),
      onBackground: Color(4292797668),
      surface: Color(4279112725),
      onSurface: Color(4292797668),
      surfaceVariant: Color(4282337354),
      onSurfaceVariant: Color(4290693322),
      outline: Color(4287206036),
      outlineVariant: Color(4282337354),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797668),
      inverseOnSurface: Color(4281020722),
      inversePrimary: Color(4278217074),
      primaryFixed: Color(4288540922),
      onPrimaryFixed: Color(4278198051),
      primaryFixedDim: Color(4286698462),
      onPrimaryFixedVariant: Color(4278210390),
      secondaryFixed: Color(4291684331),
      onSecondaryFixed: Color(4278525730),
      secondaryFixedDim: Color(4289842127),
      onSecondaryFixedVariant: Color(4281486158),
      tertiaryFixed: Color(4292403967),
      onTertiaryFixed: Color(4278983478),
      tertiaryFixedDim: Color(4290365162),
      onTertiaryFixedVariant: Color(4281943652),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279704861),
      surfaceContainer: Color(4279968033),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  static MaterialScheme darkMediumContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4286961890),
      surfaceTint: Color(4286698462),
      onPrimary: Color(4278196765),
      primaryContainer: Color(4282949031),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4290105555),
      onSecondary: Color(4278196765),
      secondaryContainer: Color(4286354841),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4290628334),
      onTertiary: Color(4278588721),
      tertiaryContainer: Color(4286812338),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      background: Color(4279112725),
      onBackground: Color(4292797668),
      surface: Color(4279112725),
      onSurface: Color(4294376700),
      surfaceVariant: Color(4282337354),
      onSurfaceVariant: Color(4291022286),
      outline: Color(4288390566),
      outlineVariant: Color(4286285190),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797668),
      inverseOnSurface: Color(4280625964),
      inversePrimary: Color(4278210647),
      primaryFixed: Color(4288540922),
      onPrimaryFixed: Color(4278195223),
      primaryFixedDim: Color(4286698462),
      onPrimaryFixedVariant: Color(4278205762),
      secondaryFixed: Color(4291684331),
      onSecondaryFixed: Color(4278195223),
      secondaryFixedDim: Color(4289842127),
      onSecondaryFixedVariant: Color(4280433213),
      tertiaryFixed: Color(4292403967),
      onTertiaryFixed: Color(4278325292),
      tertiaryFixedDim: Color(4290365162),
      onTertiaryFixedVariant: Color(4280825427),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279704861),
      surfaceContainer: Color(4279968033),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme().toColorScheme());
  }

  static MaterialScheme darkHighContrastScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(4293983743),
      surfaceTint: Color(4286698462),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4286961890),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293983743),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4290105555),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294703871),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4290628334),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      background: Color(4279112725),
      onBackground: Color(4292797668),
      surface: Color(4279112725),
      onSurface: Color(4294967295),
      surfaceVariant: Color(4282337354),
      onSurfaceVariant: Color(4294180350),
      outline: Color(4291022286),
      outlineVariant: Color(4291022286),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292797668),
      inverseOnSurface: Color(4278190080),
      inversePrimary: Color(4278202164),
      primaryFixed: Color(4288804095),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4286961890),
      onPrimaryFixedVariant: Color(4278196765),
      secondaryFixed: Color(4291947759),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4290105555),
      onSecondaryFixedVariant: Color(4278196765),
      tertiaryFixed: Color(4292863743),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290628334),
      onTertiaryFixedVariant: Color(4278588721),
      surfaceDim: Color(4279112725),
      surfaceBright: Color(4281612859),
      surfaceContainerLowest: Color(4278783760),
      surfaceContainerLow: Color(4279704861),
      surfaceContainer: Color(4279968033),
      surfaceContainerHigh: Color(4280625964),
      surfaceContainerHighest: Color(4281349687),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme().toColorScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     // textTheme: textTheme.apply(
     //   bodyColor: colorScheme.onSurface,
     //   displayColor: colorScheme.onSurface,
     // ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary, 
    required this.surfaceTint, 
    required this.onPrimary, 
    required this.primaryContainer, 
    required this.onPrimaryContainer, 
    required this.secondary, 
    required this.onSecondary, 
    required this.secondaryContainer, 
    required this.onSecondaryContainer, 
    required this.tertiary, 
    required this.onTertiary, 
    required this.tertiaryContainer, 
    required this.onTertiaryContainer, 
    required this.error, 
    required this.onError, 
    required this.errorContainer, 
    required this.onErrorContainer, 
    required this.background, 
    required this.onBackground, 
    required this.surface, 
    required this.onSurface, 
    required this.surfaceVariant, 
    required this.onSurfaceVariant, 
    required this.outline, 
    required this.outlineVariant, 
    required this.shadow, 
    required this.scrim, 
    required this.inverseSurface, 
    required this.inverseOnSurface, 
    required this.inversePrimary, 
    required this.primaryFixed, 
    required this.onPrimaryFixed, 
    required this.primaryFixedDim, 
    required this.onPrimaryFixedVariant, 
    required this.secondaryFixed, 
    required this.onSecondaryFixed, 
    required this.secondaryFixedDim, 
    required this.onSecondaryFixedVariant, 
    required this.tertiaryFixed, 
    required this.onTertiaryFixed, 
    required this.tertiaryFixedDim, 
    required this.onTertiaryFixedVariant, 
    required this.surfaceDim, 
    required this.surfaceBright, 
    required this.surfaceContainerLowest, 
    required this.surfaceContainerLow, 
    required this.surfaceContainer, 
    required this.surfaceContainerHigh, 
    required this.surfaceContainerHighest, 
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
