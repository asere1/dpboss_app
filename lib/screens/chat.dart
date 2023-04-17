import 'package:dpboss/screens/persisten_bottom_nav_bar.dart';
import 'package:dpboss/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messagesText = TextEditingController();

  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final firebaseProvider =
        Provider.of<FirebaseProvider>(context, listen: false);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 211, 50),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 211, 50),
          toolbarHeight: MediaQuery.of(context).size.height * .09,
          leading: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              InkWell(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    screen: const PersistenBottomNavBar(),
                    withNavBar: false, // OPTIONAL VALUE. True by default.
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: const ImageIcon(
                  AssetImage('assets/Dpboss_Net/ICON/arrow.png'),
                  size: 27,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          elevation: 0,
          leadingWidth: 45,
          title: const Text(
            'Chat',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: Material(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('messages')
                    .orderBy('time')
                    .snapshots(),
                builder: (BuildContext context, snapshot) {
                  List<MessageStreem> messageWidgets = [];
                  if (snapshot.hasData) {
                    final messages = snapshot.data!.docs.reversed;
                    for (var message in messages) {
                      final messageText = message.get('message');
                      final String messageId = message.get('userId') ?? 'null';

                      final currentUserId = firebaseProvider.userId;

                      final messageWidget = MessageStreem(
                        text: messageText,
                        isMe:
                            (messageId == currentUserId) && messageId != 'null',
                      );
                      messageWidgets.add(messageWidget);
                    }
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Expanded(
                    child: ListView(
                      reverse: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      children: messageWidgets,
                    ),
                  );
                },
              ),
              SizedBox(
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      border: Border(
                    top: BorderSide(
                        color: Color.fromARGB(255, 223, 183, 41), width: 2),
                  )),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            textInputAction: TextInputAction.send,
                            controller: messagesText,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                                hintText: 'Write your message here...',
                                border: InputBorder.none),
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            if (messagesText.text.isNotEmpty) {
                              try {
                                _firestore.collection('messages').add({
                                  'message': messagesText.text.toString(),
                                  'time': FieldValue.serverTimestamp(),
                                  'userId': firebaseProvider.userId,
                                }).then((value) => messagesText.clear());
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          },
                          child: Text(
                            'send',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ));
  }
}

class MessageStreem extends StatelessWidget {
  final String text;

  final bool isMe;
  const MessageStreem({
    required this.text,
    required this.isMe,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (isMe) ...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 5,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 230,
                  ),
                  child: Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: const Color.fromARGB(255, 223, 183, 41),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        text,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                        overflow: TextOverflow.fade,
                        softWrap: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
            const SizedBox(
              width: 6,
            ),
          ] else ...[
            const SizedBox(
              width: 6,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 230),
                  child: Material(
                    elevation: 5,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        text,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
