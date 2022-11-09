/// It converts a Duration object to a String in the format of mm:ss
class TimeConverts {
  TimeConverts._();

  /// It converts milliseconds to minutes and seconds.
  ///
  /// Args:
  ///   duration (Duration): The duration of the video.
  ///
  /// Returns:
  ///   A string that is the duration in minutes and seconds.
  static String millisecondstoMinute(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return '$n';
      return '0$n';
    }

    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
