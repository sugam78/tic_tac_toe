import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/ViewModel/home_screen_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    {
      final hsModel = HomeScreenModel();
      Size size = MediaQuery.of(context).size;
      return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text('Tic Tac Toe'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: size.height * 0.48,
                width: size.width * 0.80,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 4,
                        crossAxisSpacing: 4),
                    itemCount: 9,
                    itemBuilder: (context, index) {
                      return Obx(() => InkWell(
                        onTap: () {
                          hsModel.onTap(index);
                        },
                        child: Container(
                          height: size.height * 0.25,
                          width: size.height * 0.25,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                              Border.all(color: Colors.yellow, width: 4)),
                          child: Center(
                              child:Text(
                                hsModel.mode[index],
                                style: TextStyle(
                                    fontSize: size.height * 0.08,
                                    color: Colors.blue),
                              )),
                        ),
                      ));
                    }),
              ),
            ),
            Obx(() => hsModel.won.value == 'z'?SizedBox():hsModel.won.value == 'Draw'?Text('${hsModel.won.value} ',style: TextStyle(
    fontSize: size.height * 0.05,
    color: Colors.yellow),):Text('${hsModel.won.value} won the game',style: TextStyle(
                fontSize: size.height * 0.05,
                color: Colors.yellow),),),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            hsModel.resetState();
            setState(() {

            });
          },
          child: Icon(Icons.refresh),
        ),
      );
    }
  }
}

