import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nbn_basketball/helper/constants.dart';

import '../Widgets/Custom_Button.dart';
import '../Widgets/Custom_Text.dart';
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

  String? teamName;

  @override
  Widget build(BuildContext context) {
    void updateScore(int pts, String team) {
      setState(() {
        if (team == kTeamOne) {
          homePoints += pts;
          teamName = kTeamOne;
        } else {
          awayPoints += pts;
          teamName = kTeamTwo;
        }
        lastPoint = pts;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NBN : 🏀 Counter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomText(lastPoint: lastPoint, teamName: teamName),
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
                          TeamTitle(title: kTeamOne),

                          SizedBox(
                            height: 250,
                            width: MediaQuery.widthOf(context) * .45,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "$homePoints",
                                style: TextStyle(
                                  fontSize: 170.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          CustomButton(
                            onPress: () => updateScore(1, kTeamOne),
                            label: "+1 pts",
                          ),
                          CustomButton(
                            onPress: () => updateScore(2, kTeamOne),
                            label: "+2 pts",
                          ),
                          CustomButton(
                            onPress: () => updateScore(3, kTeamOne),
                            label: "+3 pts",
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
                          TeamTitle(title: kTeamTwo),
                          SizedBox(
                            width: MediaQuery.widthOf(context) * .45,
                            height: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text(
                                "$awayPoints",
                                style: TextStyle(fontSize: 170.sp),
                              ),
                            ),
                          ),

                          CustomButton(
                            onPress: () => updateScore(1, kTeamTwo),
                            label: "+1 pts",
                          ),
                          CustomButton(
                            onPress: () => updateScore(2, kTeamTwo),
                            label: "+2 pts",
                          ),
                          CustomButton(
                            onPress: () => updateScore(3, kTeamTwo),
                            label: "+3 pts",
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
                  teamName = "";
                });
              },

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[800],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Reset",
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
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
