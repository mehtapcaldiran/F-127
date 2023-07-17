import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(const Search());

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var pHeight = MediaQuery.of(context).size.height;
    var pWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFD9F0F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFD9F0F5),
        leading: Container(
          padding: const EdgeInsets.only(left: 5, top: 5),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 35,
              color: Color(0xff1b5966b),
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
                    icon: const Icon(Icons.clear),
                    onPressed: () => _searchController.clear(),
                  ),
                  // Add a search icon or button to the search bar
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
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
            const SizedBox(height: 40,),
            Container(
              height: pHeight * 0.17,
              width: pWidth * 0.9,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blueGrey
              ),
              child: Stack(
                children: [
                  const Text(
                    'Etkinlikler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    top: pHeight * 0.07,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('İklim'),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.29,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('Hayvansever'),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.27,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('Afet Yardım'),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('Afet Yardım'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: pHeight * 0.17,
              width: pWidth * 0.9,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey
              ),
              child: Stack(
                children: [
                  const Text(
                    'Keşfet',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    top: pHeight * 0.07,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('İklim'),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.29,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('Hayvansever'),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.27,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('Afet Yardım'),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('Afet Yardım'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: pHeight * 0.17,
              width: pWidth * 0.9,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey
              ),
              child: Stack(
                children: [
                  const Text(
                    'Dernekler',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Positioned(
                    top: pHeight * 0.07,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.2,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('İklim'),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.29,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('Hayvansever'),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.27,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('Afet Yardım'),
                            ),
                          ),
                          const SizedBox(width: 10,),
                          SizedBox(
                            height: pHeight * 0.05,
                            width: pWidth * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1B5966),
                              ),
                              onPressed: (){},
                              child: const Text('Afet Yardım'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
    ],
        ),
      ),
    );
  }
}
