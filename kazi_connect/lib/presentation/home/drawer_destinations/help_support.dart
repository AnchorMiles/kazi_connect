import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Help and Support"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                ListTile(
                  title: const Text(
                    "Reach to us through these channels",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.phone_outlined,
                    color: Colors.blue,
                  ),
                  title: Text("Phone"),
                  subtitle: Text("+2547123456789"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                  ),
                  title: Text("WhatsApp"),
                  subtitle: Text("+2547123456789"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.email_outlined,
                    color: Colors.redAccent,
                  ),
                  title: Text("Email"),
                  subtitle: Text("help@kaziconnect.com"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text("Chat"),
                  subtitle: Text("In-app"),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.report_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text("Report Issue"),
                  subtitle: Text("In-app"),
                  onTap: () {},
                ),
                Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
