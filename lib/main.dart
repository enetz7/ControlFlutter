import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    if(_counter<33){
        setState(() {
          _counter++;
        });
    }
  }
   void _decrementCounter() {
     if(_counter>0){
        setState(() {
          _counter--;
        });
     }
  }

  Widget listaContenedores(int index){

    if(index%15==0){
      return Container(
      alignment: Alignment.center,
      child: Text('FB',style: TextStyle(fontSize: 15),textAlign: TextAlign.center),
      decoration: BoxDecoration(border: Border.all(color:Colors.black)),
      );
    }else if(index%5==0){
      return Container(
      alignment: Alignment.center,
      child: Text('Book',style: TextStyle(fontSize: 15),textAlign: TextAlign.center),
      decoration: BoxDecoration(border: Border.all(color:Colors.black)),
      );
    }else if(index%3==0){
      return Container(
      alignment: Alignment.center,
      child: Text('Face',style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
      decoration: BoxDecoration(border: Border.all(color:Colors.black)),
      );
    }else{
      return Container(
      alignment: Alignment.center,
      child: Text(index.toString(),style: TextStyle(fontSize: 20),),
      decoration: BoxDecoration(border: Border.all(color:Colors.black)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Padding(padding: EdgeInsets.only(top:130,left: 130),
          child:
          Row(children: [
            FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
            ),
          ],),        
          ),
          Padding(padding: EdgeInsets.only(top:130,left:10,right:10),
          child: Container(
            height: 250,
            width: 500,
            child: GridView.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 8,
              children: List.generate(_counter, (index){
                return listaContenedores(index+1);
              }
              )
            )
            ,),
          ) 
          ],
        ),
      ),
    );
  }
}
