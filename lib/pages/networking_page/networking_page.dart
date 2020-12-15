import 'package:flutter/material.dart';
import 'package:flutter_test_solidsoftware/model/album.dart';
import 'package:flutter_test_solidsoftware/pages/networking_page/networking_provider.dart';
import 'package:provider/provider.dart';

class NetworkingPage extends StatefulWidget {
  @override
  _NetworkingPageState createState() => _NetworkingPageState();
}

class _NetworkingPageState extends State<NetworkingPage> {
  Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final provider = Provider.of<NetworkingProvider>(context, listen: false);
      futureAlbum = provider.fetchAlbum();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<NetworkingProvider>(
            builder: (context, provider, _) => provider.isLoading
                ? Center(child: CircularProgressIndicator())
                : FutureBuilder<List<Album>>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) => ListTile(
                                  title: Text(snapshot.data[index].title),
                                  leading: CircleAvatar(
                                    child: Text(
                                        snapshot.data[index].userId.toString()),
                                  ),
                                ));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    })));
  }
}
