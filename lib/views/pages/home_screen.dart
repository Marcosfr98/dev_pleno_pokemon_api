import "package:dev_pleno_pokemon_api/controllers/home_controller.dart";
import "package:dev_pleno_pokemon_api/controllers/pokemon_details_controller.dart";
import "package:dev_pleno_pokemon_api/models/details_pokemon.dart";
import "package:dev_pleno_pokemon_api/models/get_pokemon.dart";
import "package:dev_pleno_pokemon_api/views/pages/pokemon_details.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:google_fonts/google_fonts.dart";
import "package:lottie/lottie.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<PokemonDetails?>> _futureDetails;
  late Future<GetPokemon?> _futurePokemon;
  final HomeController _homeController = HomeController();
  late Future<bool> _init;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    _init = init();
    super.initState();
  }

  Future<bool> init() async {
    try {
      _futurePokemon = _homeController.get();
      _futureDetails = PokemonDetailsScreenController().getAllDetails();
      return true;
    } catch (error) {
      print(error);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Pokémons"),
      ),
      body: LayoutBuilder(
        builder: (context, sizes) {
          return FutureBuilder<bool>(
            future: _init,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LottieBuilder.asset("assets/animations/loading.json"),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                return FutureBuilder<GetPokemon?>(
                  future: _futurePokemon,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: LottieBuilder.asset(
                            "assets/animations/loading.json"),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            snapshot.error.toString(),
                          ),
                        );
                      } else if (snapshot.hasData) {
                        return SizedBox(
                          height: sizes.maxHeight.h,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemCount: snapshot.data!.results!.length,
                            itemBuilder: (context, index) {
                              return FutureBuilder<List<PokemonDetails?>>(
                                future: _futureDetails,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  } else if (snapshot.connectionState ==
                                      ConnectionState.done) {
                                    if (snapshot.hasData) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(() => PokemonDetailsScreen(
                                              pokemonDetails:
                                                  snapshot.data![index]!));
                                        },
                                        child: Center(
                                          child: Container(
                                            padding:
                                                EdgeInsets.only(bottom: 12.r),
                                            width: 150.w,
                                            height: 150.h,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  16,
                                                ),
                                                color: index == 0
                                                    ? Colors.green
                                                    : index == 1
                                                        ? Colors.green
                                                        : index == 2
                                                            ? Colors.redAccent
                                                            : index == 3
                                                                ? Colors.orange
                                                                : index == 4
                                                                    ? Colors.red
                                                                    : index == 5
                                                                        ? Colors
                                                                            .orange
                                                                        : index ==
                                                                                6
                                                                            ? Colors.cyan
                                                                            : index == 7
                                                                                ? Colors.purple
                                                                                : index == 8
                                                                                    ? Colors.blueGrey
                                                                                    : index == 9
                                                                                        ? Colors.greenAccent
                                                                                        : index == 10
                                                                                            ? Colors.lightGreenAccent
                                                                                            : index == 11
                                                                                                ? Colors.deepPurple
                                                                                                : index == 12
                                                                                                    ? Colors.yellow
                                                                                                    : index == 13
                                                                                                        ? Colors.brown
                                                                                                        : index == 14
                                                                                                            ? Colors.red.withBlue(200)
                                                                                                            : index == 15
                                                                                                                ? Colors.redAccent
                                                                                                                : index == 16
                                                                                                                    ? Colors.deepOrangeAccent
                                                                                                                    : index == 17
                                                                                                                        ? Colors.deepOrange
                                                                                                                        : index == 18
                                                                                                                            ? Colors.deepPurpleAccent
                                                                                                                            : Colors.brown.withRed(4)),
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Positioned(
                                                  top: -30.r,
                                                  left: ((100 - 50) / 2).r,
                                                  child: Image.network(
                                                    snapshot.data![index]!
                                                        .sprites!.frontDefault!,
                                                    width: 100.w,
                                                    height: 100.h,
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    snapshot
                                                        .data![index]!.name!,
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 20.sp,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: Chip(
                                                    side: BorderSide.none,
                                                    color:
                                                        MaterialStatePropertyAll(
                                                            Colors.white),
                                                    label: Text(
                                                      snapshot.data![index]!
                                                              .weight!
                                                              .toString() +
                                                          "Kg",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 15.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  }
                                  return SizedBox();
                                },
                              );
                            },
                          ),
                        );
                      } else {
                        return Center(
                          child: Text("No data found!"),
                        );
                      }
                    }
                    return SizedBox();
                  },
                );
              }
              return SizedBox(
                height: 24.h,
              );
            },
          );
        },
      ),
    );
  }
}
