import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class CallScreen extends StatefulWidget {
  final String channelName;
  const CallScreen({required this.channelName,Key? key}) : super(key: key);

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {

  AgoraClient? client;
  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {


    client= AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: "a79b8b60fa134333a093769bba7c525b",
        channelName: "testToken",//widget.channelName,
        tempToken: "007eJxTYDj2zY1dbW2X2M73obpX2a9InOfuPKl0SnTiLOUbOzkvubkrMCSaWyZZJJkZpCUaGpsYGxsnGlgam5tZJiUlmiebGpkmLex1TVa875Z84cR2JkYGCATxORlKUotLQvKzU/MYGADnOiL1"

      ),
    );
    await client!.initialize();

    print(client!.isInitialized);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    client!.sessionController.value.engine?.leaveChannel();
    if (client!.sessionController.value.connectionData!.rtmEnabled) {
      client!.sessionController.value.agoraRtmChannel?.leave();
      client!.sessionController.value.agoraRtmClient?.logout();
    }
    client!.sessionController.value.engine?.destroy();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Stand-up'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            AgoraVideoViewer(
              client: client!,
              layoutType: Layout.floating,
              enableHostControls: true, // Add this to enable host controls
            ),
            AgoraVideoButtons(
              client: client!,
            ),
          ],
        ),
      ),
    );
  }
}
