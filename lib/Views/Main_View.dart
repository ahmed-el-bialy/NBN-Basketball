import 'package:flutter/material.dart';

import '../Widgets/Custom_Button.dart';
import '../Widgets/Team_Title.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int awayPoints = 0;
  int homePoints = 0;
  int lastPoint = 0;

  String? team;

  @override
  Widget build(BuildContext context) {
    void updateScore(int pts, String team) {
      setState(() {
        if (team == "Home") {
          homePoints += pts;
          team = "Home";
        } else {
          awayPoints += pts;
          team = "Away";
        }
        lastPoint = pts;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Point Counter 🏀",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 28),
                        children: [
                          TextSpan(
                            text: "Last : ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: lastPoint != 0 ? "+$lastPoint " : "- ",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: lastPoint != 0 ? "pts " : "- ",
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: lastPoint != 0 ? "$team" : "- ",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          TeamTitle(title: 'HOME'),

                          SizedBox(
                            height: 250,
                            width: MediaQuery.widthOf(context) * .45,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "$homePoints",
                                style: TextStyle(
                                  fontSize: 170,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          CustomButton(
                            onPress: () => updateScore(1, "Home"),
                            label: "+1 pts",
                            team: "home",
                          ),
                          CustomButton(
                            onPress: () => updateScore(2, "Home"),
                            label: "+2 pts",
                            team: "Home",
                          ),
                          CustomButton(
                            onPress: () => updateScore(3, "Home"),
                            label: "+3 pts",
                            team: "home",
                          ),
                        ],
                      ),
                    ),
                  ),

                  VerticalDivider(
                    endIndent: 10,
                    indent: 10,
                    thickness: 2,
                    color: Colors.white,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Card(
                      child: Column(
                        children: [
                          TeamTitle(title: "AWAY"),
                          SizedBox(
                            width: MediaQuery.widthOf(context) * .45,
                            height: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "$awayPoints",
                                style: TextStyle(fontSize: 170),
                              ),
                            ),
                          ),

                          CustomButton(
                            onPress: () => updateScore(1, "AWAY"),
                            label: "+1 pts",
                            team: "AWAY",
                          ),
                          CustomButton(
                            onPress: () => updateScore(2, "AWAY"),
                            label: "+2 pts",
                            team: "AWAY",
                          ),
                          CustomButton(
                            onPress: () => updateScore(3, "AWAY"),
                            label: "+3 pts",
                            team: "AWAY",
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 40),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  homePoints = 0;
                  awayPoints = 0;
                  lastPoint = 0;
                  team = "";
                });
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            Container(height: 30),
          ],
        ),
      ),
    );
  }
}
