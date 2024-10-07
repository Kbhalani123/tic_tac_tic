import 'package:flutter/material.dart';
import 'package:tic_tac_tic/game_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController player1controller = TextEditingController();
  final TextEditingController player2controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Color(0xFF323D6B),
    body: Form(
      key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Enter Players Name',
             style: TextStyle(
               color: Colors.white,
               fontSize: 30,
               fontWeight: FontWeight.bold
             ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: player1controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                  ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    ),
                  hintText: 'Player1 Name',
                  hintStyle: TextStyle(color: Colors.white)
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter Player 1 name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                controller: player2controller,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    hintText: 'Player2 Name',
                    hintStyle: TextStyle(color: Colors.white)
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please Enter Player 2 name';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 10,),
            InkWell(
              onTap: () {
                if(_formKey.currentState!.validate()){
                  Navigator.push(
                      context, MaterialPageRoute(
                    builder: (context) => GameScreen(
                        player1: player1controller.text,
                        player2: player2controller.text),)); 
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(vertical: 17,horizontal: 20),
                child: Text('Start Game',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),
              ),
            )
            ],




        )),
  );
  }
}
