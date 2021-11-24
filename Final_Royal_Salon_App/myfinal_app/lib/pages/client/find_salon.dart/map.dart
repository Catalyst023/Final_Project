import 'dart:async';

import 'package:backendless_sdk/backendless_sdk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:myfinal_app/routes/routes.dart';
import 'package:myfinal_app/services/location_services.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:provider/provider.dart' as provider;

class FindSalon extends StatefulWidget {
  @override
  State<FindSalon> createState() => FindSalonState();
}

class FindSalonState extends State<FindSalon> {
  Completer<GoogleMapController> _controller = Completer();
  TextEditingController _searchController = TextEditingController();
  Set<Marker> _markers = Set<Marker>();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _setMarker(LatLng(37.42796133580664, -122.085749655962));
  }

  void _setMarker(LatLng point) {
    setState(() {
      _markers.add(Marker(markerId: MarkerId('marker'), position: point));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _searchController,
                  textCapitalization: TextCapitalization.words,
                  decoration: InputDecoration(hintText: 'Enter your City'),
                  onChanged: (value) {},
                ),
              ),
              IconButton(
                onPressed: () async {
                  var place =
                      await LocationServices().getPlace(_searchController.text);
                  LocationServices().getPlace(_searchController.text);
                  _goToPlace(place);
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              markers: _markers,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 200, top: 50),
              child: FloatingActionButton.extended(
                onPressed: () {
                  showBottomSheet1();
                },
                label: Text('Salon'),
                icon: Icon(Icons.home_work_outlined),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 50, bottom: 100),
              child: FloatingActionButton.extended(
                onPressed: () {
                  showBottomSheet();
                },
                label: Text('Salon'),
                icon: Icon(Icons.home_work_rounded),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _goToPlace(Map<String, dynamic> place) async {
    final double lat = place['geometry']['location']['lat'];
    final double lng = place['geometry']['location']['lng'];
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(lat, lng),
          zoom: 12,
        ),
      ),
    );
    _setMarker(LatLng(lat, lng));
  }

  void showBottomSheet1() => showModalBottomSheet(
      enableDrag: false,
      isDismissible: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      barrierColor: Colors.orange.withOpacity(0.2),
      context: context,
      builder: (context) => SizedBox(
            height: 200,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    provider.Selector<UserService, BackendlessUser?>(
                      selector: (context, value) => value.currentUser,
                      builder: (context, value, child) {
                        return value == null
                            ? Text('Salon name: xxx')
                            : Text(
                                'Salon name: ${value.getProperty('salon_name') == null ? 'xxx' : value.getProperty('salon_name')}',
                                style: GoogleFonts.sanchez(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 250),
                      child: provider.Selector<UserService, BackendlessUser?>(
                        selector: (context, value) => value.currentUser,
                        builder: (context, value, child) {
                          return value == null
                              ? Text('Salon Location: xxx')
                              : Text(
                                  'Salon Location: ${value.getProperty('salonLocation') == null ? 'xxx' : value.getProperty('salonLocation')}',
                                  style: GoogleFonts.sanchez(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                );
                        },
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.servicesPage);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        child: const Text('Services'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.reviewsPage);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        child: const Text('View Reviews'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RouteManager.getDirectionsPage);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ),
                        child: const Text('Get Directions'),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  child: const Text('Add to favourites'),
                ),
              ],
            ),
          ));

  void showBottomSheet() => showModalBottomSheet(
        enableDrag: false,
        isDismissible: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        barrierColor: Colors.orange.withOpacity(0.2),
        context: context,
        builder: (context) => const SizedBox(
          height: 100,
          child: Center(
            child: Text(
              'Sorry the salon will open at //time',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
