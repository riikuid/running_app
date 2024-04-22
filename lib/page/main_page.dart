import 'package:latlong2/latlong.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:running_app/service/location_service.dart';
import 'package:running_app/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // late LocationData locationData;

  @override
  void initState() {
    // LocationService().getCurrentLocation();
    // getLocation();
    super.initState();
  }

  getLocation() async {
    LocationService locationService;
    // LocationData getLocation = locationService.getCurrentLocation();
    setState(() {
      // locationData = getLocation;
    });
  }

  final mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 60),
                width: double.infinity,
                color: backgroundColor,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "00:00:00",
                      style: durationTextStyle.copyWith(
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      "DURATION",
                      style: primaryTextStyle.copyWith(
                        letterSpacing: 5,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: LocationService().getCurrentLocation(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                      // return FlutterMap(
                      //   options: MapOptions(
                      //     minZoom: 5,
                      //     maxZoom: 18,
                      //     initialZoom: 13,
                      //   ),
                      //   children: [
                      //     TileLayer(
                      //       urlTemplate:
                      //           "https://api.mapbox.com/styles/v1/fahmiwa/cls0i9rrp00zt01qy3n5l1e7l/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZmFobWl3YSIsImEiOiJjbDM2d2FyMnExMGh6M2RxenlqeWZkeTEyIn0._wWnkctGLaTNn84M6aI6hQ",
                      //     ),
                      //   ],
                      // );
                    }
                    // LocationData? myLocation = snapshot.data;
                    return FlutterMap(
                      options: const MapOptions(
                        initialCenter: LatLng(-7.275760320293582,
                            112.7937588539844975021063940727),
                        minZoom: 5,
                        maxZoom: 18,
                        initialZoom: 13,
                      ),
                      mapController: mapController,
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://api.mapbox.com/styles/v1/fahmiwa/cls0i9rrp00zt01qy3n5l1e7l/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZmFobWl3YSIsImEiOiJjbDM2d2FyMnExMGh6M2RxenlqeWZkeTEyIn0._wWnkctGLaTNn84M6aI6hQ",
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 20,
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: secondaryColor,
                  foregroundColor: backgroundColor,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide.none,
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "START RUNNING",
                      style: primaryTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 16,
                        color: backgroundColor,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      weight: 1,
                      size: 20,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
