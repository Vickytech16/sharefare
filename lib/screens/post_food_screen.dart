import 'package:flutter/material.dart';

class PostFoodScreen extends StatefulWidget {
  static const routeName = '/post-food';

  @override
  _PostFoodScreenState createState() => _PostFoodScreenState();
}

class _PostFoodScreenState extends State<PostFoodScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPosted = false;

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isPosted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Food'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.greenAccent, Colors.teal],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: _isPosted
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 100),
                        SizedBox(height: 20),
                        Text(
                          'Food Posted Successfully!',
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isPosted = false;
                            });
                          },
                          child: Text('Post Another'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                        ),
                      ],
                    ),
                  )
                : Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Food Title'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the food title';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Description'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the food description';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Image URL'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter the image URL';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Post Food'),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
