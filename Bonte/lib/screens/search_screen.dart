import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(Search());

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var p_height = MediaQuery.of(context).size.height;
    var p_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFD9F0F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFD9F0F5),
        leading: Container(
          padding: EdgeInsets.only(left: 5, top: 5),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xFF1B5966B),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              // Add padding around the search bar
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              // Use a Material design search bar
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  // Add a clear button to the search bar
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Perform the search here
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),
          ),
            SizedBox(height: 40,),
            Container(
              height: p_height * 0.17,
              width: p_width * 0.9,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey
              ),
              child: Stack(
                children: [
                  Text(
                    'Etkinlikler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.07,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('İklim'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.29,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Hayvansever'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.27,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Afet Yardım'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Afet Yardım'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: p_height * 0.17,
              width: p_width * 0.9,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey
              ),
              child: Stack(
                children: [
                  Text(
                    'Keşfet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.07,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('İklim'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.29,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Hayvansever'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.27,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Afet Yardım'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Afet Yardım'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              height: p_height * 0.17,
              width: p_width * 0.9,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey
              ),
              child: Stack(
                children: [
                  Text(
                    'Dernekler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    top: p_height * 0.07,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('İklim'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.29,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Hayvansever'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.27,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Afet Yardım'),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: p_height * 0.05,
                            width: p_width * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: Text('Afet Yardım'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
    ],
        ),
      ),
    );
  }
}
