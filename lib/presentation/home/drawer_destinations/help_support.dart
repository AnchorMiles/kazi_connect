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
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.phone_outlined,
                    color: Colors.blue,
                  ),
                  title: const Text("Phone"),
                  subtitle: const Text("+2547123456789"),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.green,
                  ),
                  title: const Text("WhatsApp"),
                  subtitle: const Text("+2547123456789"),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(
                    Icons.email_outlined,
                    color: Colors.redAccent,
                  ),
                  title: const Text("Email"),
                  subtitle: const Text("help@kaziconnect.com"),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.phone_android,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text("Chat"),
                  subtitle: const Text("In-app"),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.report_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text("Report Issue"),
                  subtitle: const Text("In-app"),
                  onTap: () {},
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
