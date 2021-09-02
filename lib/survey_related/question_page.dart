import 'package:covid19appwithfirebase/widgets/buttom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:covid19appwithfirebase/model/survey_model.dart';
import 'package:covid19appwithfirebase/survey_related/storage.dart';

class QuestionPage extends StatelessWidget {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
            controller: _pageController,
            itemCount: questionList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 190,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(220),
                      ),
                    ),
                    child: Container(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
                            child: Container(
                              height: 180,
                              width: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/nurse.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 30, bottom: 10),
                                  child: Text(
                                    questionList[index].title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Text(
                                  questionList[index].subtitle,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.greenAccent),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 40, 0),
                    child: Text(
                      questionList[index].question,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () => changePage(index, context, true),
                        child: Text(
                          "Yes",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () => changePage(index, context, false),
                        child: Text(
                          "No",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  index > 0
                      ? IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                          ),
                          onPressed: () => _pageController.animateToPage(
                              index - 1,
                              duration: Duration(seconds: 5),
                              curve: Curves.easeInQuart),
                        )
                      : Container(),
                  SizedBox(height: 9),
                ],
              );
            }),
      ),
    );
  }

  void changePage(index, context, bool ans) {
    if (index == 2) {
      saveResult(index.toString(), ans); //answer passing yes or no
      GetStorage()
          .write('checkPage', true); // if once answered never comes again
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (ctx) => BottomBar())); //to never g oback uselessly
    } else {
      saveResult(index.toString(), ans);
      _pageController.animateToPage(index + 1,
          duration: Duration(milliseconds: 300), curve: Curves.easeInQuart);
    }
  }
}
