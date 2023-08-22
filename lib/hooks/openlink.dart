import 'package:url_launcher/url_launcher.dart';

Future openLink(String link) async {
  Uri url = Uri.parse(link);
  if (await launchUrl(url)) {
    await launchUrl(mode: LaunchMode.externalApplication, url);
  } else {
    throw Exception('Could not launch $url');
  }
}
