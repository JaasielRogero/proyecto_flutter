import 'package:flutter/material.dart';
import 'package:protecto/paginas/anadirRegisto.dart';
import 'perfil.dart';

void main() {
  runApp(const Principal());
}

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<Principal> createState() => _MyAppState();
}

class _MyAppState extends State<Principal> {
  int indiceActual = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    List<String> diasDeLaSemana = [
      'Lunes',
      'Martes',
      'Miércoles',
      'Jueves',
      'Viernes',
      'Sábado',
      'Domingo'
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
        ),
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 200.0),
                        child: Text(
                          'Días de guardia',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          border: TableBorder.all(),
                          headingRowHeight: 40,
                          dataRowHeight: 40,
                          columns: diasDeLaSemana
                              .map((dia) => DataColumn(
                                    label: SizedBox(
                                      width: 62,
                                      child: Text(dia),
                                    ),
                                  ))
                              .toList(),
                          rows: <DataRow>[
                            DataRow(
                                color: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 197, 224, 179)),
                                cells: const <DataCell>[
                                  DataCell(
                                    SizedBox(
                                      width: 62,
                                      child: Text('Dia Libre',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: 62,
                                      child: Text('Dia Libre',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: 62,
                                      child: Text('Dia Libre',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: 62,
                                      child: Text('Dia Libre',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: 62,
                                      child: Text('Dia Libre',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: 62,
                                      child: Text('Dia Libre',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                  DataCell(
                                    SizedBox(
                                      width: 62,
                                      child: Text('Dia Libre',
                                          textAlign: TextAlign.center),
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                onItemTaped(context, 2);
                              },
                              style: const ButtonStyle(
                                alignment: Alignment.centerLeft,
                              ),
                              child: const Text(
                                'Expediente del paciente',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            TextButton(
                              onPressed: () {
                                onItemTaped(context, 1);
                              },
                              style: const ButtonStyle(
                                alignment: Alignment.centerLeft,
                              ),
                              child: const Text(
                                'Registro del paciente',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            TextButton(
                              onPressed: () {
                                onItemTaped(context, 1);
                              },
                              style: const ButtonStyle(
                                alignment: Alignment.centerLeft,
                              ),
                              child: const Text(
                                'Añadir registros',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 50),
                            TextButton(
                              onPressed: () {
                                onItemTaped(context, 1);
                              },
                              style: const ButtonStyle(
                                alignment: Alignment.centerLeft,
                              ),
                              child: const Text(
                                'Modificar registros',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const Perfil(),
                const AnadirReg(),
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
