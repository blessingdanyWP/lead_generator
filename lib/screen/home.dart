import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Center(child: Text('Rest API Call',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
      ),
      body: ListView.builder(
      itemCount: users.length,
      itemBuilder: (context,index){
        final user = users[index];
        final name = user['name']['first'];
        final email = user['email'];
        final phone = user['cell'];
        final image = user['picture']['thumbnail'];
        return ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(image)),
          title: Text(name),
          subtitle: Text(email,),
          trailing: Text(phone),
          
        );
      }),
      floatingActionButton:
      Container(
        height: 50,
        width: 140,
        child: FloatingActionButton.extended(
          
          backgroundColor: Colors.blue,
          onPressed: fetchUsers,
          label:Text('Generate', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          icon: Icon(Icons.cloud_sync_outlined, ),
          
          
          
          
            
          
           ),
      ),
    );
  }

  // Future<void> fetchUsers() async {
  //   final response = await UserApi.fetchUsers();
  //   setState(() {
  //     users = response;
  //   });
  // }

  void fetchUsers() async {
    
    const link = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(link);
    final response = await http.get(uri);
    final body = response.body;
    final json =jsonDecode(body);
    setState(() {
      users = json['results'];
    });
  }
}