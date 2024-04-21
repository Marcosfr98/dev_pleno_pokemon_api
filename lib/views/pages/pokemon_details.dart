import 'package:dev_pleno_pokemon_api/models/details_pokemon.dart';
import 'package:dev_pleno_pokemon_api/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonDetailsScreen extends StatefulWidget {
  final PokemonDetails? pokemonDetails;
  const PokemonDetailsScreen({super.key, required this.pokemonDetails});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  late PokemonDetails pokemonDetails;
  @override
  void initState() {
    pokemonDetails = widget.pokemonDetails!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
        title: Text(
          pokemonDetails.name.toString(),
        ),
      ),
      body: LayoutBuilder(builder: (context, sizes) {
        return Container(
          color: AppColors.primary,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 24.r),
                  height: sizes.maxHeight * .80,
                  width: sizes.maxWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32.r),
                      topRight: Radius.circular(32.r),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      Text(
                        "Habilidades",
                        style: GoogleFonts.nunito(
                          fontSize: 24.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: pokemonDetails.abilities!.length,
                          itemBuilder: (context, index) => Text(
                            pokemonDetails.abilities![index].ability!.name
                                .toString(),
                          ),
                        ),
                      ),
                      Text(
                        "Peso",
                        style: GoogleFonts.nunito(
                          fontSize: 24.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          pokemonDetails.weight.toString(),
                        ),
                      ),
                      Text(
                        "Número",
                        style: GoogleFonts.nunito(
                          fontSize: 24.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          pokemonDetails.id.toString(),
                        ),
                      ),
                      Text(
                        "Altura",
                        style: GoogleFonts.nunito(
                          fontSize: 24.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          pokemonDetails.height.toString(),
                        ),
                      ),
                      Text(
                        "Tipos",
                        style: GoogleFonts.nunito(
                          fontSize: 24.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: pokemonDetails.types!.length,
                          itemBuilder: (context, index) => Text(
                            pokemonDetails.types![index].type!.name.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: sizes.maxHeight * .20 - 50.r,
                left: sizes.maxWidth / 2 - 50.r,
                child: Transform.scale(
                  scale: 3,
                  child: Image.network(
                    pokemonDetails.sprites!.frontDefault!,
                    width: 100.w,
                    height: 100.h,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
