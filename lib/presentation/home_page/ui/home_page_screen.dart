import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:searchable_paginated_dropdown/searchable_paginated_dropdown.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../cubit/home_page_cubit.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future<void> inits(Stream<LocationData> stream) async {
    stream.listen((LocationData currentLocation) async {
      if (currentLocation.longitude != null &&
          currentLocation.latitude != null) {
        final GoogleMapController controller = await _controller.future;
        controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          zoom: 15,
        )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final heightDevice = MediaQuery.of(context).size.height;
    return BlocConsumer<HomePageCubit, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
                body: SlidingUpPanel(
              maxHeight: heightDevice * 0.9,
              minHeight: heightDevice * 0.1,
              backdropEnabled: true,
              backdropColor: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              body: Stack(
                children: [
                  if (state is GetStream && state.locationStream != null)
                    GoogleMap(
                      mapType: MapType.hybrid,
                      initialCameraPosition: _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        inits(state.locationStream!);
                      },
                      myLocationButtonEnabled: true,
                      myLocationEnabled: true,
                      zoomControlsEnabled: false,
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () =>
                                context.read<HomePageCubit>().getStream(),
                            icon: Icon(Icons.search),
                            iconSize: 50,
                            color: Colors.red),
                        Expanded(
                            child: SearchableDropdown<int>.future(
                          hintText: const Text('Future request'),
                          margin: const EdgeInsets.all(15),
                          futureRequest: () async {
                            final paginatedList = await Future.delayed(
                                Duration(seconds: 5),
                                () => List.generate(10, (index) => index));
                            return paginatedList
                                .map((e) => SearchableDropdownMenuItem(
                                    value: e,
                                    label: e.toString(),
                                    child: Text(e.toString())))
                                .toList();
                          },
                          onChanged: (int? value) {
                            debugPrint('$value');
                          },
                        )),
                        CircleAvatar(
                            foregroundImage: NetworkImage(
                                'https://www.rd.com/wp-content/uploads/2020/11/redo-cat-meme6.jpg?w=1414'))
                      ],
                    ),
                  )
                ],
              ),
              panel: Container(
                padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 5,
                      indent: 125,
                      endIndent: 125,
                    ),
                    Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('People',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                                fontSize: 18)),
                        TextButton(
                            onPressed: ()=> context.read<HomePageCubit>().checkPermission(),
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.deepPurple.withOpacity(0.75),
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16.0))),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.purple,
                                  ),
                                  Text(
                                    'Places',
                                    style: TextStyle(color: Colors.purple),
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                    Expanded(
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100,
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            SizedBox(
                                              height: 80,
                                              width: 80,
                                              child: CircleAvatar(
                                                  foregroundImage: NetworkImage(
                                                      'https://www.rd.com/wp-content/uploads/2020/11/redo-cat-meme6.jpg?w=1414')),
                                            ),
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                padding: EdgeInsets.only(
                                                    left: 2.0, right: 2.0),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                8.0)),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 4,
                                                        offset: Offset(2,
                                                            2), // Shadow position
                                                      )
                                                    ]),
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.battery_5_bar),
                                                    Text('92%')
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(width: 10.0),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text('Mark',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Colors.deepPurple)),
                                            Text('Near First Ave NE',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.deepPurple)),
                                            Text('Since 3:12 pm',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.deepPurple))
                                          ],
                                        )
                                      ],
                                    )),
                                    IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.favorite_outline))
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Divider(
                                color: Colors.grey.withAlpha(100),
                                thickness: 1.0,
                              );
                            },
                            itemCount: 50))
                  ],
                ),
              ),
            )));
  }
}
