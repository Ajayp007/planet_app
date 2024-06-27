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
                    scrollDirection: Axis.horizontal,
                    itemCount: providerW!.likePlanet.length,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 200,
                        alignment: Alignment.center,
                        width: MediaQuery.sizeOf(context).width,
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              providerW!.likePlanet[index],
                            ),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(providerW!.likePlanet[index]),
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
