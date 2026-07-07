import 'package:harry_potter/HARRY_POTER/cubit/hogwarts_cubit.dart';
import 'package:harry_potter/HARRY_POTER/cubit/hogwarts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_potter/HARRY_POTER/presentation/widgets/character_not_found.dart';
import 'package:harry_potter/HARRY_POTER/presentation/widgets/custom_article_widget.dart';
import 'package:harry_potter/HARRY_POTER/presentation/widgets/custom_botton_curve.dart';
import 'package:harry_potter/HARRY_POTER/presentation/widgets/error_state_widget.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.charName});
  final String charName;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<HogwartsCubit, HogwartsState>(
      listener: (context, state) {
        if (state is FetchFailedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.failureMessage),
              backgroundColor: Color(0xFF5D4037),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is FetchLoadingState) {
          return const Scaffold(
            backgroundColor: Color(0xFFF5F0E6),
            body: Center(
              child: CircularProgressIndicator(
                color: Color(0xFF8B6F47),
                strokeWidth: 5,
              ),
            ),
          );
        }

        if (state is FetchSuccessState) {
          if (state.characters.isEmpty)
           { return CharacterNotFound(charName: charName, context: context);}

          final character = state.characters.first;

          return Scaffold(
            backgroundColor: const Color(0xFFF5F0E6),
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 40),

                    const Text(
                      "CHARACTER INTRODUCTION",
                      style: TextStyle(
                        fontSize: 14,
                        letterSpacing: 8,
                        color: Color(0xFF8B6F47),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      character.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Griffy',
                        fontSize: 44,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF5D4037),
                        shadows: [
                          Shadow(
                            offset: Offset(0, 3),
                            blurRadius: 12,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 380,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 300,
                            height: 300,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFDFC7B0),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: ClipPath(
                              clipper: BottomCurveClipper(),
                              child: Container(
                                width: size.width,
                                height: 200,
                                color: const Color(0xFFF5E6D3),
                              ),
                            ),
                          ),
                          Container(
                            width: 280,
                            height: 280,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF8B6F47),
                                width: 6,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  blurRadius: 25,
                                  offset: const Offset(0, 15),
                                ),
                              ],
                            ),
                            child: ClipOval(
                              child: Image.network(
                                character.image.isNotEmpty
                                    ? character.image
                                    : 'https://via.placeholder.com/280?text=?',
                                fit: BoxFit.cover,
                                alignment: const Alignment(0.0, -0.4),
                                loadingBuilder: (context, child, progress) {
                                  return progress == null
                                      ? child
                                      : const Center(
                                          child: CircularProgressIndicator(
                                            color: Color(0xFF8B6F47),
                                          ),
                                        );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [
                          CustomArticleWidget(
                            text:
                                "In the enchanted halls of Hogwarts and beyond, there walks a ${character.species} of remarkable destiny — ${character.name}, ${character.gender == 'male' ? 'a brave wizard' : 'a brilliant witch'} born in ${character.yearOfBirth == 'Unknown' ? 'a time shrouded in mystery' : 'the year ${character.yearOfBirth}'}.",
                          ),
                          const SizedBox(height: 20),

                          CustomArticleWidget(
                            text: character.alternateNames.isNotEmpty
                                ? "Whispered in legends as ${character.alternateNames.map((n) => '“$n”').join(', ')}, this soul carries many names and even greater tales."
                                : "Though known by one name alone, ${character.name}'s legend echoes through the ages.",
                          ),
                          const SizedBox(height: 20),

                          CustomArticleWidget(
                            text:
                                "Sworn to the noble house of ${_getHouseName(character.house)} ${character.house.isNotEmpty ? character.house : 'with no allegiance'}, bearing ${character.eyeColour.isNotEmpty ? character.eyeColour : 'mysterious'} eyes and ${character.hairColour.isNotEmpty ? character.hairColour : 'enchanting'} hair.",
                          ),
                          const SizedBox(height: 20),

                          CustomArticleWidget(
                            text: character.patronus.isNotEmpty
                                ? "When darkness falls, a radiant ${character.patronus} springs forth — a guardian of light and hope."
                                : "Some secrets of the soul remain forever hidden from even the mightiest spells.",
                          ),
                          const SizedBox(height: 30),

                          CustomArticleWidget(
                            text:
                                "Whether friend or foe, hero or enigma — ${character.name} has etched their name into the eternal tapestry of the wizarding world.",
                            isFinal: true,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          );
        }
      else if(state is FetchFailedState)
       { return ErrorStateWidget(
          context: context,
          errorMessage: state.failureMessage,
        );}
        else
        {
          return Text('Unknown Error');
        }
      },
    );
  }

  String _getHouseName(String house) {
    switch (house) {
      case 'Gryffindor':
        return 'the brave';
      case 'Slytherin':
        return 'the cunning';
      case 'Ravenclaw':
        return 'the wise';
      case 'Hufflepuff':
        return 'the loyal';
      default:
        return 'a soul';
    }
  }
}

