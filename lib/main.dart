import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      accentColor:Colors.orange,
    ),

    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos =  [];
  String input = "";
  @override
  void initState() {

    
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
    todos.add("Item3");
    todos.add("Item4");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('mytodos'),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(

            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text("Add TodoList"),
            content: TextField(
              onChanged: (String value){
                input =value;

              },
            ),

            actions: <Widget>[
              FlatButton(onPressed: (){

                  setState(() {
                    todos.add(input);
                    
                  });
                  Navigator.of(context).pop();
              }, child: Text('Add'))
            ],
            
            

            
          );

          
        });
      },child: Icon(Icons.add,color: Colors.white,),),

      
      
      body: ListView.builder(
        
         itemCount : todos.length, itemBuilder: (BuildContext context,int index){
          return Dismissible(key: Key(todos[index]), child: Card(
            elevation: 4,
            margin: EdgeInsets.all(8),



            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

            child: ListTile(title: Text(todos[index]),
            trailing: IconButton(icon: Icon(Icons.delete,color: Colors.red,),onPressed: (){

              setState(() {
                todos.removeAt(index);
              });
            },),
            ),
            
          ),);

         }
    ));
    
  }
}

