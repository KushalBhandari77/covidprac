import 'package:covid19appwithfirebase/utils/custom_text.dart';
import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  static const routeName = '/newsDetails';

  @override
  Widget build(BuildContext context) {
    //jhikna ko laagi

    final routeargs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final title = routeargs['title'];
    final image = routeargs['image'];
    final source = routeargs['source'];
    final summary = routeargs['summary'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          source,
        ),
        centerTitle: true,
        elevation: 50,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                Image.network(image),
                Text(
                  title,
                  style: TextStyle(fontSize: 18),
                ),
                Text(source),
                Text(summary),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
