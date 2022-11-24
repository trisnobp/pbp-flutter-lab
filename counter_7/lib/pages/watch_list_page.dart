import 'package:counter_7/functions/fetch_data.dart';
import 'package:counter_7/pages/watch_list_detail.dart';
import 'package:counter_7/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/models/my_watch_list.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<WatchListPage> createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<WatchListPage> {
  bool? isWatched; // Buat validasi checkbox
  Color outlineColor = Colors
      .red; //Warna outline dari tiap card (diatur berdasarkan status ditonton)

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        drawer: const DrawerBar(),
        body: FutureBuilder(
            future: fetchWatchList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const Center(
                  child: CircularProgressIndicator(), // Loading
                );
              }
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "Tidak ada Watch List :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                  ],
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      isWatched = (snapshot.data![index].fields.watched ==
                              Watched.SUDAH)
                          ? true
                          : false; // Check apakah film sudah ditonton atau belum

                      // Menentukan outline color dari card
                      outlineColor = (isWatched == true) ? Colors.teal : Colors.red;
                      return InkWell(
                        onTap: (() {
                          // Jika card ditekan, akan langsung akses detail page yang berisi detail film tersebut
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WatchListDetail(
                                      film: snapshot.data![index])));
                        }),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: outlineColor, width: 2),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 2,
                                )
                              ]),
                          child: ListTile(
                            leading: Text(
                              "${snapshot.data![index].fields.title}", // Menampilkan judul
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            trailing: Checkbox(
                              value: isWatched,
                              onChanged: (bool? value) {
                                setState(() {
                                  isWatched = value!;
                                  // Ubah value watched dari film di lokal
                                  if (isWatched == false) {
                                    // Berarti di-unchecked
                                    snapshot.data![index].fields.watched =
                                        Watched.BELUM;
                                    outlineColor = Colors.red;
                                  } else {
                                    // Berarti di-checked
                                    snapshot.data![index].fields.watched =
                                        Watched.SUDAH;
                                    outlineColor = Colors.green;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      );
                    });
              }
            }),
      ),
    );
  }
}
