import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('todo_box');
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
        theme:  ThemeData(primarySwatch: Colors.pink).copyWith(
            textTheme: TextTheme(
              headlineLarge:TextStyle(fontSize: 25,fontFamily:'Amaranth',color:Colors.white ),
              bodyLarge :TextStyle(fontSize: 18,fontFamily:'Amaranth',color:Colors.white ),
              bodyMedium: TextStyle(fontSize: 20,fontFamily:'Amaranth',color:Colors.black),
              bodySmall :TextStyle(fontSize: 17,fontFamily:'Amaranth',color:Colors.black ),
            )
        ),
    builder: FToastBuilder(),
    home: CRUD_HIVE(),));
}

class CRUD_HIVE extends StatefulWidget {
  @override
  State<CRUD_HIVE> createState() => _CRUD_HIVEState();
}

class _CRUD_HIVEState extends State<CRUD_HIVE> {
  List<Map<String, dynamic>> task = [];
  final tname    = TextEditingController();
  final tcontent = TextEditingController();


  //creating hive box
  final box = Hive.box('todo_box');

  @override
  void initState() {
    refresh_or_read_task();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
                    title: Text("TODO LIST",style: Theme.of(context).textTheme.headlineLarge),
        ),
        body: task.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
            itemCount: task.length,
            itemBuilder: (context, index) {
              return Card(

                color: Colors.primaries[index % Colors.primaries.length],
                child: ListTile(
                  leading:  Icon(Icons.task,color: Colors.green,),
                  title: Text(task[index]['taskname'],style: Theme.of(context).textTheme.bodyMedium),
                  subtitle: Text(task[index]['taskcontent'],style: Theme.of(context).textTheme.bodySmall),
                  trailing: Wrap(
                    children: [
                      IconButton(
                          onPressed: () {
                            create_or_edit_Task(task[index]['id']);
                          }, icon: const Icon(Icons.edit,color: Colors.black,)),
                      IconButton(
                          onPressed: () {
                            deleteTask(task[index]['id']);
                          }, icon: const Icon(Icons.delete,color: Colors.black)),
                Text(task[index]['task_time']),
                    ]
                  ),

                ),
              );
            }),
        floatingActionButton: FloatingActionButton.large(
            onPressed: () => create_or_edit_Task(null),
            child: Icon(Icons.add),
          elevation: 20.0, //shadow elevation of button
          shape: CircleBorder(),
          backgroundColor: Colors.pink[800],

        ));
  }

  void create_or_edit_Task(int? itemkey)//bottom sheet
  {
    // item key similar to id in sqflite
    if (itemkey != null) {
      final existing_task = task.firstWhere((element) => element['id']== itemkey);
      tname.text    = existing_task['taskname'];
      tcontent.text = existing_task['taskcontent'];
    }

    showModalBottomSheet(
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 120,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(style: Theme.of(context).textTheme.bodyMedium,
                  controller: tname,
                  decoration: InputDecoration(
                      hintText: 'Task Name'),
                ),
                TextField(style: Theme.of(context).textTheme.bodyMedium,
                  controller: tcontent,
                  decoration: InputDecoration(
                      hintText: 'Task Content'),
                ),
                ElevatedButton(
                    onPressed: (){

                      if(itemkey == null){
                        DateTime someDateTime = DateTime.now();
                        DateFormat formatter = DateFormat.jm();
                        String formatted = formatter.format(someDateTime);
                        createTask(
                            {
                              "task_name":tname.text.trim(),
                              "task_cont":tcontent.text.trim(),
                              "task_time":formatted.trim(),
                            }
                        );
                      }
                      if(itemkey != null){
                        ///edit the values that particular key in hive
                        DateTime someDateTime = DateTime.now();
                        DateFormat formatter = DateFormat.jm();
                        String formatted = formatter.format(someDateTime);
                        editTask(itemkey,{
                          'task_name':tname.text.trim(),
                          'task_cont':tcontent.text.trim(),
                          'task_time':formatted.trim(),
                        });
                      }
                      tname.text="";
                      tcontent.text="";
                      Navigator.pop(context);
                    },
                    child: Text(style: Theme.of(context).textTheme.bodyLarge,
                        itemkey == null ? 'Create Task': 'Edit Task'
                    ))
              ],
            ),
          );
        });
  }

  Future<void> createTask(Map<String, dynamic> newtask) async {
    await box.add(newtask);
    refresh_or_read_task();
  }

  void refresh_or_read_task() {
    // fetch all the keys from hive in ascending order
    // key - individual itemkeys will be available at key
    final task_from_hive = box.keys.map((key) {
      final map_of_that_single_key = box.get(key);
      return {
        'id' : key,   // key 1 key 2 etc
        'taskname'   :map_of_that_single_key['task_name'],
        'taskcontent':map_of_that_single_key['task_cont'],
        'task_time':map_of_that_single_key['task_time'],
      };
    }).toList();

    setState(() {
      task = task_from_hive.reversed.toList();
    });
  }

  Future<void> editTask(int itemkey, Map<String, dynamic> editedtask) async{
    await box.put(itemkey, editedtask);
    Fluttertoast.showToast(
        msg: "Successfully Edited",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        //timeInSecForIosWeb: 1,
        backgroundColor: Colors.pink[300],
        textColor: Colors.white,
        fontSize: 16.0
    );
    refresh_or_read_task();
  }

  Future<void> deleteTask(int itemkey) async{
    await box.delete(itemkey);
    refresh_or_read_task();

    Fluttertoast.showToast(
        msg: "Successfully Deleted",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        //timeInSecForIosWeb: 1,
        backgroundColor: Colors.pink[300],
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}