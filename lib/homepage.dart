//import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//import 'package:laktrade_db/_listBox.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  List<Map<String, dynamic>> allData = [];
  List<Map<String, dynamic>> filteredData = [];
  dynamic sdb = Supabase.instance.client;
  bool isLoading = true;

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    initialize();
    fetchData();
    searchController.addListener(() {
      filterData(searchController.text);
    });
    super.initState();
  }

  void initialize() async {
    Supabase.instance.client.auth.admin;
  }

  Future<void> fetchData() async {
    dynamic dataSnapshot = await sdb.from('flavorDB').select('*');
    //print(dataSnapshot.toString());
    List<Map<String, dynamic>> results = [];
    dataSnapshot.forEach((flavor) {
      //print(flavor['Flavour'].toString());
      results.add({
        'Name': flavor['Flavour'],
        'Code': flavor['Code'],
        'Natural Emulsion': flavor['Natural Emulsion'],
        'Natural Liquid': flavor['Natural Liquid'],
        'Natural Nature Cell': flavor['Natural Nature Cell'],
        'Natural Powder': flavor['Natural Powder'],
        'Nature Identical Liquid': flavor['Nature Identical Liquid'],
        'Nature Identical Nature Cell': flavor['Nature Identical Nature Cell'],
        'Nature Identical Powder': flavor['Nature Identical Powder'],
        'Organic Liquid': flavor['Organic Liquid'],
        'Organic Nature Cell': flavor['Organic Nature Cell'],
        'Organic Powder': flavor['Organic Powder'],
      });
    });
    setState(() {
      allData = results;
      filteredData = results;
      isLoading = false;
    });
  }

  void filterData(String query) {
    List<Map<String, dynamic>> results = [];
    if (query.isEmpty) {
      results = allData;
    } else if (query.startsWith(RegExp(r'^\d+$'))) {
      results = allData
          .where((flavor) => flavor['Code']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    } else {
      results = allData
          .where((flavor) => flavor['Name']
              .toString()
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredData = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    //String searchTyped = "";
    return Scaffold(
      appBar: AppBar(
        title: Text('LAKTRADE DATABASE'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text(
            "Search: ",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          Center(
            child: Container(
              width: 350,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                    filled: true,
                    //fillColor: Colors.white,
                    //hintText: "Username",
                    labelText: "     Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50))),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(10)),
          //Padding(padding: EdgeInsets.all(10)),
          Expanded(
            child: Container(
                //color: Colors.amberAccent,

                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: filteredData.length,
                        itemBuilder: (context, index) {
                          dynamic flavorData = filteredData[index];
                          // print('Here');
                          // print(flavorData.toString());
                          return InkWell(
                            child: Card(
                              child: Column(
                                children: [
                                  Text(''),
                                  Text(flavorData['Name'].toString() +
                                      ' - ' +
                                      flavorData['Code'].toString()),
                                  Text(''),
                                ],
                              ),
                            ),
                            onTap: () {
                              String fType = 'N/A';
                              if (flavorData['Natural Emulsion'] == 'X') {
                                fType = 'Natural Emulsion';
                              } else if (flavorData['Natural Liquid'] == 'X') {
                                fType = 'Natural Liquid';
                              } else if (flavorData['Natural Nature Cell'] ==
                                  'X') {
                                fType = 'Natural Nature Cell';
                              } else if (flavorData['Natural Powder'] == 'X') {
                                fType = 'Natural Powder';
                              } else if (flavorData[
                                      'Nature Identical Liquid'] ==
                                  'X') {
                                fType = 'Nature Identical Liquid';
                              } else if (flavorData[
                                      'Nature Identical Nature Cell'] ==
                                  'X') {
                                fType = 'Nature Identical Nature Cell';
                              } else if (flavorData[
                                      'Nature Identical Powder'] ==
                                  'X') {
                                fType = 'Nature Identical Powder';
                              } else if (flavorData['Organic Liquid'] == 'X') {
                                fType = 'Organic Liquid';
                              } else if (flavorData['Oragnic Nature Cell'] ==
                                  'X') {
                                fType = 'Oragnic Nature Cell';
                              } else if (flavorData['Organic Powder'] == 'X') {
                                fType = 'Organic Powder';
                              }
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    'Flavor Details',
                                  ),
                                  actions: [
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text('Flavor Name: ' +
                                              flavorData['Name'].toString()),
                                          Text('Flavor Code: ' +
                                              flavorData['Code'].toString()),
                                          Text('Flavor Type: ' +
                                              fType.toString()),
                                          Padding(padding: EdgeInsets.all(10)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        })),
          ),
        ],
      ),
    );
  }
}
