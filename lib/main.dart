import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  String DisplayData = "No Data Found !";
  List<String>  taskList = []; 
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ToDo App"),
          backgroundColor: Colors.purpleAccent,
          centerTitle: false,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Enter a Task"),
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    setState(() {
                      taskList.add(textController.text);
                      textController.clear();
                    });
                  },
                  child: Text("Add"),
                ),
              ],
            ),
            
            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context,index){
                  return Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(010),
                      child: Text(taskList[index]),
                    ),
                  ),
                  MaterialButton(
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          taskList.removeAt(index);
                        });
                      }),
                ],
              );
              },
              ),
            )
          ],
        ),
      ),
    );
  }
}