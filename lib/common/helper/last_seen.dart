String lastSeenMessage(lastSeen) {
  DateTime now = DateTime.now();
  Duration differenceDuration = now.difference(
    DateTime.fromMillisecondsSinceEpoch(lastSeen),
  );
  String mesage = differenceDuration.inSeconds > 59
      ? differenceDuration.inMinutes > 59
          ? differenceDuration.inDays > 23
              ? "${differenceDuration.inDays} ${differenceDuration.inDays == 1 ? 'day' : 'days'} ago"
              : "${differenceDuration.inHours} ${differenceDuration.inHours == 1 ? 'hour' : 'hours'} ago"
          : "${differenceDuration.inMinutes} ${differenceDuration.inMinutes == 1 ? 'minute' : 'miutes'} ago"
      : "online";
  return mesage;
}
