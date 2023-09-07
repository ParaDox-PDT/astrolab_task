import 'package:file_download_tutorial/models/file_info.dart';
import 'package:file_download_tutorial/widgets/single_file_download.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int doublePress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black45,
        leading: const Icon(Icons.arrow_back_ios_new, color: Colors.blue,),
        title: const Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("ParaDox PDT", style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17,
                color: Colors.black
              ),),
              Text("17:35", style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.white
              ),)
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset("assets/images/profile.png",fit: BoxFit.cover,)),
          ),
          const SizedBox(width: 8,)
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset("assets/images/image.png", fit: BoxFit.cover,),
          ),
          ListView(
            children: List.generate(filesData.length, (index) {
              var singleFile = filesData[index];
              return SingleFileDownload(fileInfo: singleFile);
            }),
          )
        ],
      ),
    );
  }
}
