
import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {

  final TextEditingController _descriptionEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload'),
        centerTitle: true,
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          children: [

           Container(
              width: double.infinity,
              height: 250.0,
              color: Colors.grey,
              child: Center(
                child: RaisedButton(
                  onPressed: (){

                  },
                  color: Colors.pink,
                  child: Text('Choose Image',style: TextStyle(color: Colors.white , fontSize: 16.0),),

                ),
              ),

            ) ,
            SizedBox(height: 16.0,),

            TextField(
              controller: _descriptionEditingController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  labelText: 'Description'
              ),
            ),
            SizedBox(height: 40.0,),

            GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.pink,
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text('Add New Post',style: TextStyle(fontSize: 18.0 , color: Colors.white),),
                ),
              ),
            ),

          ],
        ),
      )
    );
  }
}
