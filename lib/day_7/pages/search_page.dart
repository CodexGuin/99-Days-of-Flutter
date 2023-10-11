// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ninety_nine_days_of_flutter/day_7/models/Bus.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late Future<Bus?> busData;
  final TextEditingController controller = TextEditingController();
  bool hasFetched = false;

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
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: fetchAndSetBusData)),
                  onSubmitted: (value) => fetchAndSetBusData())),
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
                                Duration duration = Duration(
                                    milliseconds: service.next.durationMs);
                                int minutes = duration.inMinutes;
                                int seconds = (duration.inSeconds % 60);

                                String formattedDuration =
                                    '${minutes.toString().padLeft(2)} min ${seconds.toString().padLeft(2)} seconds';
                                return ListTile(
                                    title: Center(child: Text(service.no)),
                                    subtitle: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(service.serviceOperator),
                                          Text(
                                              'Next bus in: $formattedDuration')
                                        ]));
                              });
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      })
                  : const Center(child: Text('Please enter a bus stop code')))
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
