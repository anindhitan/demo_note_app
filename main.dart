// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDHDDtm1PyVvZN4utEip2B8RbDcszoPXJE",
          authDomain: "address-37eab.firebaseapp.com",
          projectId: "address-37eab",
          storageBucket: "address-37eab.appspot.com",
          messagingSenderId: "505757454878",
          appId: "1:505757454878:web:146b43acfa8437da4f940f",
          measurementId: "G-DZ1KLLL1FN"));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        hintColor: Colors.grey),
    home: MyApp(title: 'Note Edit Address'),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required String title});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? namaAdd, kategoriAdd, provinsiAdd, kecamatanAdd;
  double? kodePos, rtAdd, rwAdd;

  getNama(nama) {
    namaAdd = nama;
  }

  getKategori(kategori) {
    kategoriAdd = kategori;
  }

  getProvinsi(provinsi) {
    provinsiAdd = provinsi;
  }

  getKecamatan(kecamatan) {
    kecamatanAdd = kecamatan;
  }

  getKodePos(kodepos) {
    kodePos = double.parse(kodepos);
  }

  getRt(rt) {
    rtAdd = double.parse(rt);
  }

  getRw(rw) {
    rwAdd = double.parse(rw);
  }

  createData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyAddress").doc(namaAdd);

    //create Map
    Map<String, dynamic> address = {
      "Nama": namaAdd,
      "Kategori": kategoriAdd,
      "Provinsi": provinsiAdd,
      "Kecamatan": kecamatanAdd,
      "Kode Pos": kodePos,
      "RT": rtAdd,
      "RW": rwAdd
    };

    documentReference.set(address).whenComplete(() {
      ("$namaAdd created");
    });
  }

  readData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyAddress").doc(namaAdd);

    documentReference.get().then((datasnapshot) {
      datasnapshot.data();
    });
  }

  updateData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyAddress").doc(namaAdd);

    //update Map
    Map<String, dynamic> address = {
      "Nama": namaAdd,
      "Kategori": kategoriAdd,
      "Provinsi": provinsiAdd,
      "Kecamatan": kecamatanAdd,
      "Kode Pos": kodePos,
      "RT": rtAdd,
      "RW": rwAdd
    };

    documentReference.set(address).whenComplete(() {
      ("$namaAdd updated");
    });
  }

  deleteData() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("MyAddress").doc(namaAdd);

    documentReference.delete().whenComplete(() {
      ("$namaAdd deleted");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Note"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Nama"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Nama',
                    ),
                    onChanged: (String namaAdd) {
                      getNama(namaAdd);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Kategori"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Kategori',
                    ),
                    onChanged: (String kategoriAdd) {
                      getKategori(kategoriAdd);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Provinsi"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Provinsi',
                    ),
                    onChanged: (String provinsiAdd) {
                      getProvinsi(provinsiAdd);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Kecamatan"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Kecamatan',
                    ),
                    onChanged: (String kecamatanAdd) {
                      getKecamatan(kecamatanAdd);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Kode Pos"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Kode Pos',
                    ),
                    onChanged: (String kodePos) {
                      getKodePos(kodePos);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("RT"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'RT',
                    ),
                    onChanged: (String rtAdd) {
                      getRt(rtAdd);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("RW"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'RW',
                    ),
                    onChanged: (String rwAdd) {
                      getRw(rwAdd);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          createData();
                        },
                        child: const Text("Simpan")),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Row(
                //     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: <Widget>[
                //       Align(
                //         alignment: Alignment.centerRight,
                //         child: ElevatedButton(
                //           onPressed: () {
                //             createData();
                //           },
                //           child: const Text("Simpan")),
                //       ),
                //       // ElevatedButton(
                //       //     onPressed: () {
                //       //       readData();
                //       //     },
                //       //     child: const Text("Read")),
                //       // ElevatedButton(
                //       //     onPressed: () {
                //       //       updateData();
                //       //     },
                //       //     child: const Text("Update"))
                //     ],
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    textDirection: TextDirection.ltr,
                    children: const <Widget>[
                      Expanded(
                        child: Text(
                          "Nama",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Kategori",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Provinsi",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Kecamatan",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Kode Pos",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "RT",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "RW",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Delete",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 184, 184, 184),
                  indent: 5.0,
                  endIndent: 10.0,
                  thickness: 1.5,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("MyAddress")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot documentSnapshot =
                                snapshot.data!.docs[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(documentSnapshot["Nama"]),
                                  ),
                                  Expanded(
                                    child: Text(documentSnapshot["Kategori"]),
                                  ),
                                  Expanded(
                                    child: Text(documentSnapshot["Provinsi"]),
                                  ),
                                  Expanded(
                                    child: Text(documentSnapshot["Kecamatan"]),
                                  ),
                                  Expanded(
                                    child: Text(documentSnapshot["Kode Pos"]
                                        .toString()),
                                  ),
                                  Expanded(
                                    child:
                                        Text(documentSnapshot["RT"].toString()),
                                  ),
                                  Expanded(
                                    child:
                                        Text(documentSnapshot["RW"].toString()),
                                  ),
                                  Expanded(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          deleteData();
                                        },
                                        child: const Text("Delete")),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
