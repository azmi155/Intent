import 'dart:ffi';

import 'package:flutter/material.dart';

void main(){
  runApp(new MaterialApp(
    title: "INTENT",
    home: new Home(),
  ));
}


  
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> agama = ["Islam","Kristen","Hindu","Budha"];
  String _agama="Islam";

  String _Jk="";

  TextEditingController controllerNim = new TextEditingController();
  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerKontak = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();

  void _pilihJk(String value){
    setState(() {
      _Jk=value;
    });
  }

  void pilihAgama(String value){
    setState(() {
      _agama = value;
    });
  }

  Void kirimdata(){
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 300.0,
        child: new Column(
          children: <Widget>[
            new Text("NIM :  ${controllerNim.text}"),
            new Text("Nama Lengkap :  ${controllerNama.text}"),
            new Text("Kontak :  ${controllerKontak.text}"),
            new Text("E-Mail :  ${controllerEmail.text}"),
            new Text("Jenis Kelamin :  $_Jk"),
            new Text("Laki-laki:  $_agama"),
          ],
        ),
      ),
    );
    showDialog(context: context,child: alertDialog);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Isi Bio Data"),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNim,
                  decoration: new InputDecoration(
                    hintText: "Masukkan NIM",
                    labelText: "NIM",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 20.0)),
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Masukkan Nama Lengkap",
                    labelText: "Nama Lengkap",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                 new Padding(padding: EdgeInsets.only(top: 20.0)),
                new TextField(
                  controller: controllerKontak,
                  decoration: new InputDecoration(
                    
                    hintText: "Masukkan Nomor HP",
                    labelText: "Kontak",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 20.0)),
                new TextField(
                  controller: controllerEmail,
                  decoration: new InputDecoration(
                    hintText: "Masukkan E-Mail",
                    labelText: "E-Mail",
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0)
                    )
                  ),
                ),
                new Padding(padding: EdgeInsets.only(top: 20.0)),

                new RadioListTile(
                value: "Laki-Laki", 
                title: new Text("Laki-Laki"),
                groupValue: _Jk, 
                onChanged: (String value){
                  _pilihJk(value);
                },
                activeColor: Colors.red,
                subtitle: new Text("Pilih ini jika anda laki-laki"),
                ),
                new RadioListTile(
                value: "Perempuan", 
                title: new Text("Perempuan"),
                groupValue: _Jk, 
                onChanged: (String value){
                  _pilihJk(value);
                },
                activeColor: Colors.red,
                 subtitle: new Text("Pilih ini jika anda Perempuan"),
                ),
                new Padding(padding: EdgeInsets.only(top: 20.0)),
                
                new Row(
                  children: <Widget>[
                    new Text("Agama  :",style: new TextStyle(fontSize: 20.0, color: Colors.blue),),
                    new DropdownButton(
                  onChanged: (String value){
                    pilihAgama(value);
                  },
                  value: _agama,
                  items: agama.map((String value){
                    return new DropdownMenuItem(
                      value: value,
                      child: new Text(value)
                      
                      );
                  }).toList(), 
                  )

                  ],
                ),
                
                new RaisedButton(
                  child: new Text("OK"),
                  color: Colors.red,
                  onPressed: (){kirimdata();},
                )  
                 

              ],
            ),
          ),
        ],
      ),
    );
  }
}