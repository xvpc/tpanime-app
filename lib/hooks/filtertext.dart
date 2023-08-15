String filterText(text) {
  return text
      .replaceAll(RegExp(r"<\w+>"), "")
      .replaceAll(RegExp(r"<\/\w+>"), "")
      .replaceAll(RegExp(r"Source:"), "")
      .replaceAll(RegExp(r"\(.*\)"), "");
}
