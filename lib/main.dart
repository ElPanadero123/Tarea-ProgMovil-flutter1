import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedText;

  final List<String> names = [
    'David Borg',
    'Lucy',
    'Jerry Cool West',
    'Bold',
  ]; // Lista de nombres

  final List<String> titles = [
    'Flying Wings',
    'Growing up trouble',
    "Sculptor's diary",
    'Illustration of tittle',
  ]; // Lista de títulos

  final List<String> imageLinks = [
    'https://icons.iconarchive.com/icons/papirus-team/papirus-apps/256/google-icon.png',
    'https://cdn-icons-png.flaticon.com/256/3898/3898082.png',
    'https://freeiconshop.com/wp-content/uploads/edd/code-flat.png',
    'https://icons.iconarchive.com/icons/flat-icons.com/flat/256/Clock-icon.png',
  ]; // Lista de enlaces de imágenes

  String generateRandomName(int index) {
    return names[index % names.length];
  }

  String generateRandomTitle(int index) {
    return titles[index % titles.length];
  }

  String generateRandomImageLink(int index) {
    return imageLinks[index % imageLinks.length];
  }

  Widget buildText(String text) {
    bool isSelected = selectedText == text;
    return GestureDetector(
      onTap: () => setState(() {
        selectedText = text;
      }),
      child: Column(
        children: [
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
            style: TextStyle(
              color: Colors.white,
              fontSize: isSelected ? 24 : 18,
            ),
            child: Text(text),
          ),
          SizedBox(height: 8),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.purple[100]?.withOpacity(0.7)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(2),
            ),
            height: 4,
            width: isSelected ? 80 : 0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      Colors.blue,
      Colors.orange,
      Colors.red,
      Colors.purple,
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildText('Designer'),
                buildText('Category'),
                buildText('Attention'),
              ],
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) => Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0),
                ),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [colors[index], colors[index].withOpacity(0.5)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(17.0),
                  ),
                  height: 150,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(70.0),
                              child: Image.network(
                                generateRandomImageLink(
                                    index), // Utilizar enlace de imagen aleatorio
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    generateRandomName(index),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Title: ${generateRandomTitle(index)}',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Text('...',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    )),
                                SizedBox(height: 10),
                                Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Ranking',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('${100 - index}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      )),
                                  Text('Popularity',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('${200 - index}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      )),
                                  Text('Likes',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('${300 - index}',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                      )),
                                  Text('Followed',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
