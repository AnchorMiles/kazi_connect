import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  String issueText = '';
  bool loading = false;

  sendIssue(text) async {
    if (text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please type your issue'),
        ),
      );
    } else {
      setState(() {
        loading = true;
      });
      Map<String, dynamic> data = {'issue': text, 'read': false};
      // await FirebaseFirestore.instance
      //     .collection('issues')
      //     .doc("$userID ${DateTime.now()}")
      //     .set(data)
      //     .whenComplete(
      //       () {
      //     setState(() {
      //       loading = false;
      //     });
      //     showDialog(
      //         context: context,
      //         builder: (ctx) {
      //           return const AlertDialog(
      //             title: Text('Report Sent'),
      //             content: Text('Thank you for reporting an issue'
      //                 ' to us. We will review it fix it.'),
      //           );
      //         }).whenComplete(() => Navigator.of(context).pop());
      //   },
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Feedback'),
          centerTitle: true,
          actions: [
            IconButton(
                tooltip: loading ? "Sending" : "Send",
                onPressed: () => sendIssue(issueText),
                icon: loading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      )
                    : Icon(
                        Icons.send_outlined,
                        color: Theme.of(context).primaryColor,
                      )),
          ],
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 810),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    issueText = value;
                  },
                  onFieldSubmitted: (value) => sendIssue(value),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.send,
                  autofocus: true,
                  minLines: 1,
                  maxLines: 12,
                  cursorHeight: 22,
                  cursorWidth: 2,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
