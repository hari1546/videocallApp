import 'package:flutter/material.dart';
import 'package:agora_uikit/agora_uikit.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Instantiate the client
  // Instantiate the client
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      appId: "86c86f940a974c89adb7004ca7ed8533",
      channelName: "test",
      username: "hari"
    ),
  );

// Initialize the Agora Engine
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

// Build your layout
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("my video app"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                showNumberOfUsers: false,
                client: client,
                layoutType:Layout.floating,
                enableHostControls: true,
              ),
              AgoraVideoButtons(
                  client: client,
                  addScreenSharing:false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



