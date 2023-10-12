// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;
import 'package:ninety_nine_days_of_flutter/day_9/models/Bus.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<Bus?> busData;
  final TextEditingController controller = TextEditingController();
  bool hasFetched = false;

  Color determineColor(int minTillArr) {
    if (minTillArr < 3) {
      return Colors.redAccent;
    } else if (minTillArr < 6) {
      return Colors.orangeAccent;
    } else {
      return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Search Bus Stop'),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black87),
        body: Column(children: [
          // Legend to show what color means what
          Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              color: Colors.grey.withOpacity(0.2),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        width: 20,
                        height: 20,
                        color: Colors.redAccent,
                        margin: const EdgeInsets.all(5)),
                    const Text('< 3 minutes'),
                    Container(
                        width: 20,
                        height: 20,
                        color: Colors.orangeAccent,
                        margin: const EdgeInsets.all(5)),
                    const Text('< 6 minutes'),
                    Container(
                        width: 20,
                        height: 20,
                        color: Colors.greenAccent,
                        margin: const EdgeInsets.all(5)),
                    const Text('> 6 minutes')
                  ])),
          Expanded(
              child: hasFetched
                  ? FutureBuilder<Bus?>(
                      future: busData,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError || snapshot.data == null) {
                            return Center(
                                child: Text(
                                    'Error: ${snapshot.error ?? "No data found"}'));
                          }

                          return ListView.builder(
                              itemCount: snapshot.data!.services.length,
                              itemBuilder: (context, index) {
                                Service service =
                                    snapshot.data!.services[index];

                                Duration duration1 = Duration(
                                    milliseconds: service.next.durationMs);
                                Duration? duration2;
                                Duration? duration3;

                                if (service.next2 != null) {
                                  duration2 = Duration(
                                      milliseconds: service.next2!.durationMs);
                                }

                                if (service.next3 != null) {
                                  duration3 = Duration(
                                      milliseconds: service.next3!.durationMs);
                                }

                                int minutes1 = duration1.inMinutes;
                                int seconds1 = (duration1.inSeconds % 60);
                                int minutes2 = duration2?.inMinutes ?? 0;
                                int minutes3 = duration3?.inMinutes ?? 0;

                                String formattedDuration1 = '',
                                    formattedDuration2 = '',
                                    formattedDuration3 = '';

                                if (minutes1 == 0 ||
                                    minutes1 < 0 ||
                                    (minutes1 == 1 && seconds1 < 30)) {
                                  formattedDuration1 = 'Arriving';
                                } else {
                                  formattedDuration1 =
                                      '${minutes1.toString().padLeft(2)} min';
                                }
                                formattedDuration2 = minutes2 == 0
                                    ? 'Arriving'
                                    : '${minutes2.toString().padLeft(2)} min';
                                formattedDuration3 = minutes3 == 0
                                    ? 'Arriving'
                                    : '${minutes3.toString().padLeft(2)} min';

                                return Slidable(
                                    endActionPane: ActionPane(
                                        motion: const DrawerMotion(),
                                        children: [
                                          SlidableAction(
                                              onPressed: (context) => {},
                                              backgroundColor:
                                                  Colors.blueAccent,
                                              foregroundColor: Colors.white,
                                              icon:
                                                  Icons.favorite_border_rounded,
                                              label: 'Favorite')
                                        ]),
                                    key: const ValueKey(0),
                                    child: Material(
                                        child: ListTile(
                                            tileColor: determineColor(
                                                duration1.inMinutes),
                                            title: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Center(
                                                    child: Text(service.no,
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: 25)))),
                                            subtitle: Container(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      ArrivalBox(
                                                          duration:
                                                              formattedDuration1),
                                                      duration2 != null
                                                          ? ArrivalBox(
                                                              duration:
                                                                  formattedDuration2)
                                                          : const SizedBox(),
                                                      duration3 != null &&
                                                              duration2 != null
                                                          ? ArrivalBox(
                                                              duration:
                                                                  formattedDuration3)
                                                          : const SizedBox()
                                                    ])))));
                              });
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      })
                  : const Center(child: Text('Please enter a bus stop code'))),
          Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: fetchAndSetBusData)),
                  onSubmitted: (value) => fetchAndSetBusData()))
        ]));
  }

  void fetchAndSetBusData() {
    final trimmedCode = controller.text.trim();
    if (trimmedCode.isNotEmpty) {
      setState(() {
        hasFetched = true;
        busData = fetchBusData(trimmedCode);
      });
    } else {
      // handle empty input here, maybe show a snackbar or alert dialog
    }
  }

  Future<Bus?> fetchBusData(String busStopCode) async {
    try {
      final response = await http
          .get(Uri.parse('https://arrivelah2.busrouter.sg/?id=$busStopCode'));
      if (response.statusCode == 200) {
        return busFromJson(response.body);
      } else {
        print("Non-200 status code: ${response.statusCode}");
        throw Exception('Failed to load bus data');
      }
    } catch (e) {
      print("Error fetching data: $e");
      return null;
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class ArrivalBox extends StatelessWidget {
  final String duration;

  const ArrivalBox({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10)),
        child: Text(duration, style: const TextStyle(color: Colors.black87)));
  }
}
