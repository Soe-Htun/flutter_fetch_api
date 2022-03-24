import 'package:flutter/material.dart';
import 'package:flutter_api/model/user_model.dart';
import 'package:flutter_api/services/remoteService.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future <List<UserModel>> futureData;

  @override
  void initState() {
    // RemoteServices.getData();
    futureData = RemoteServices.getData();
    print("Future ${futureData}");
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureData,
        builder: (context, snapshot) {
          // if(snapshot.hasData) {
          //   return Center(
          //     child: Text("Name: ${snapshot.data!.name} "),
          //   );
          // }
          // else {
          //   return SizedBox(
          //     height: MediaQuery.of(context).size.height,
          //     child: const Center(
          //       child: CircularProgressIndicator()
          //     )
          //   ); 
          // }
          if(snapshot.connectionState == ConnectionState.waiting ) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator()
              )
            ); 
          } else if(snapshot.hasData) {
            List<UserModel> data = snapshot.data as List<UserModel>;
            return ListView.builder(
              // itemCount: users.length ,
              itemCount: data.length,
              itemBuilder: (context, index) {
                // return Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Text("Name:  ${data[index].name}"),
                // );

                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(data[index].name.toString()),
                      subtitle: Text(data[index].email.toString()),
                    ),
                  ),
                ); 
              });
          } else {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: Text("No Data")
              )
            ); 
          }
        },
      ),
    );
  }
}