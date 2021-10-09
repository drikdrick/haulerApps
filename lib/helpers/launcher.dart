import 'package:url_launcher/url_launcher.dart' as url_launcher;

void openEmail() {
  url_launcher.launch("mailto:angel@boksman.com");
}

void openWhatsapp() {
  url_launcher.launch("https://api.whatsapp.com/send/?phone=%2B6281380188482");
}

void openPhone() {
  url_launcher.launch("tel:+6281380188482");
}
