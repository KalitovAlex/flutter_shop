String formatDate(DateTime? date) {
  if (date == null) return 'Н/Д';
  return '${date.day}.${date.month}.${date.year}';
}
