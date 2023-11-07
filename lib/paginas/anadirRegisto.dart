import 'package:flutter/material.dart';
import 'package:protecto/paginas/principal.dart';
import 'perfil.dart';

void main() {
  runApp(const AnadirReg());
}

class AnadirReg extends StatefulWidget {
  const AnadirReg({Key? key}) : super(key: key);

  @override
  State<AnadirReg> createState() => _MyAppState();
}

class _MyAppState extends State<AnadirReg> {
  int indiceActual = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/paginas/principal': (context) => const Principal(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        endDrawer: NavigationDrawer(
          onDestinationSelected: (value) {
            onItemTaped(context, value);
          },
          selectedIndex: indiceActual,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.lightBlue),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.home),
              selectedIcon: Icon(Icons.home_outlined),
              label: Text("Home"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.person),
              selectedIcon: Icon(Icons.person_outlined),
              label: Text("Perfil"),
            ),
            NavigationDrawerDestination(
              icon: Icon(Icons.exit_to_app),
              selectedIcon: Icon(Icons.exit_to_app_outlined),
              label: Text("Salir"),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
              child: Divider(),
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              height: 190,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 40.0, right: 10),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      SizedBox(width: 8),
                      Padding(
                        padding: EdgeInsets.only(top: 70.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nombre del personal ",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Area y puesto",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            IndexedStack(
              index: indiceActual,
              children: [
                Center(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 200.0),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Text(
                              'Añadir Registros',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            dividerThickness: .01,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0, color: Colors.white),
                            ),
                            columns: const <DataColumn>[
                              DataColumn(label: Text(' ')),
                              DataColumn(label: Text(' ')),
                            ],
                            rows: const <DataRow>[
                              DataRow(cells: [
                                DataCell(Text('Clave del paciente')),
                                DataCell(
                                  SizedBox(
                                    width: 200,
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                              DataRow(cells: [
                                DataCell(
                                  Text('Presion Arterial'),
                                ),
                                DataCell(
                                  SizedBox(
                                    width: 200,
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Pulso')),
                                DataCell(
                                  SizedBox(
                                    width: 200,
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Temperatura')),
                                DataCell(
                                  SizedBox(
                                    width: 200,
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Oxigenacion')),
                                DataCell(
                                  SizedBox(
                                    width: 200,
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                              DataRow(cells: [
                                DataCell(Text('Fecha/Hora')),
                                DataCell(
                                  SizedBox(
                                    width: 200,
                                    height: 40,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Center(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 202, 202, 202),
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black),
                            ),
                            onPressed: () {},
                            child: const Text('Guardar'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onItemTaped(BuildContext context, int index) {
    setState(() {
      indiceActual = index;
    });
  }
}
