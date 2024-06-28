import 'package:flutter/material.dart';
import 'package:galaxy_planet/utils/theme_provider.dart';
import 'package:provider/provider.dart';

import '../home/provider/home_provider.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  ThemeProvider? providerWT;
  ThemeProvider? providerRT;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getPlanetData();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    providerWT = context.watch<ThemeProvider>();
    providerRT = context.read<ThemeProvider>();

    return Scaffold(
      body: Stack(
        children: [
          providerWT!.themeMode == true
              ? Image.network(
                  "https://i.pinimg.com/564x/1f/4a/d9/1f4ad9b6fef3e5eb47d3bc7b61549e08.jpg",
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height,
                )
              : Image.network(
                  "https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L25zMTEyNjgtaW1hZ2Uta3d2eWRoajYuanBn.jpg",
                  fit: BoxFit.cover,
                  height: MediaQuery.sizeOf(context).height,
                ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    const Text(
                      "Favorite Planets",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: providerW!.likeName.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: 200,
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: providerWT!.themeMode==true?Colors.black:Colors.white)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              providerW!.likePlanetImg[index],
                              height: 80,
                            ),
                            Text(
                              providerW!.likeName[index],
                              style: const TextStyle(fontSize: 5),
                            ),
                            IconButton(
                              onPressed: () {
                                providerW!.deleteLikePlanet(index);

                              },
                              icon: const Icon(Icons.delete_outline),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
