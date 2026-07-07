import 'package:harry_potter/HARRY_POTER/cubit/hogwarts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter/HARRY_POTER/presentation/screens/details_screen.dart';

class SearchHome extends StatefulWidget {
  SearchHome({super.key});

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
final TextEditingController nameController = TextEditingController();

void dispose(){
  nameController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F0E2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),

              const Text(
                "Hogwarts",
                style: TextStyle(
                  fontFamily: 'Griffy',
                  fontSize: 48,
                  color: Color(0xFF5D4037),
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      offset: Offset(0, 3),
                      blurRadius: 10,
                      color: Colors.black26,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                  image: const DecorationImage(
                    image: NetworkImage(
                      "https://th.bing.com/th/id/OIP.K68xiOs8GqJIvMGvapJ7fgHaEK?w=290&h=180&c=7&r=0&o=7&dpr=1.5&pid=1.7&rm=3",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
               
              ),

              const SizedBox(height: 50),

              const Text(
                "Looking for someone?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Griffy',
                  fontSize: 32,
                  color: Color(0xFF5D4037),
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 10),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "The wizarding world will guide you.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Griffy',
                    fontSize: 24,
                    color: Color(0xFF7B5E3A),
                    height: 1.3,
                  ),
                ),
              ),

              const SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8E7),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: const Color(0xFF8B6F47),
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: nameController,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Griffy',
                      fontSize: 26,
                      color: Color(0xFF5D4037),
                    ),
                    decoration: const InputDecoration(
                      hintText: "Search for a wizard...",
                      hintStyle: TextStyle(
                        fontFamily: 'Griffy',
                        fontSize: 24,
                        color: Color(0xFF8B6F47),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 20),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.auto_stories,
                          color: Color(0xFF8B6F47),
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              ElevatedButton(
                onPressed: () async {
                  final query = nameController.text.trim();

                  if (query.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Who are you looking for?"),
                        backgroundColor: Color(0xFF8B6F47),
                        shape:RoundedRectangleBorder(borderRadius:BorderRadius.all(Radius.circular(8))),
                      ),
                    );
                    return;
                  }

                  await context
                      .read<HogwartsCubit>()
                      .fetchCharacterByName(query);

                  
                  if (context.mounted) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(charName: query),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8B6F47),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 18,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.4),
                ),
                child: const Text(
                  "Discover",
                  style: TextStyle(
                    fontFamily: 'Griffy',
                    fontSize: 28,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}