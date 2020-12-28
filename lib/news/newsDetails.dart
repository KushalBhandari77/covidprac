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
      appBar: AppBar(title: Text(source,style: TextStyle(color: Theme.of(context).primaryColor),),backgroundColor: Colors.white,centerTitle: true,elevation: 50,),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: <Widget>[
              Image.network(image),
              CustomText(text: title),
              Text(source),
              Text(summary),
            ],
          ),
          ListTile(
            title: Text("Recommended For You"),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: routeargs.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.cover),
                            ),
                            width: 120,
                          ),
                          title: CustomText(text: title),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ]),
      ),
    );
  }
}
