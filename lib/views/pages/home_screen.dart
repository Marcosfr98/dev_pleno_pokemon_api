import "package:dev_pleno_pokemon_api/controllers/home/home_controller.dart";
import "package:dev_pleno_pokemon_api/models/get_pokemon.dart";
import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<GetPokemon?> _futurePokemon;
  final HomeController _homeController = HomeController();
  final _listController = ScrollController();
  int _offset = 0;

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _futurePokemon = _homeController.get();
    _listController.addListener(
      () async {
        if (_listController.position.maxScrollExtent ==
            _listController.offset) {
          _offset = _offset + 20;
          await _homeController.get(offset: _offset.toString());
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Pokémons"),
      ),
      body: FutureBuilder<GetPokemon?>(
        future: _futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LottieBuilder.asset("assets/animations/loading.json"),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                controller: _listController,
                itemBuilder: (context, index) {
                  if (index < snapshot.data!.results!.length) {
                    return ListTile(
                      title: Text(snapshot.data!.results![index].name!),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
                itemCount: snapshot.data!.results!.length + 1,
              );
            } else {
              return Center(
                child: Text("No data found!"),
              );
            }
          }
          return SizedBox();
        },
      ),
    );
  }
}
