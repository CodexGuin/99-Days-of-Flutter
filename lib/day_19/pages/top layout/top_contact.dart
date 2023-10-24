import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_19/data/user_data.dart';

class TopContact extends StatefulWidget {
  const TopContact({super.key});

  @override
  State<TopContact> createState() => _TopContactState();
}

class _TopContactState extends State<TopContact> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Text('User',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15)),
                  ),
                  Expanded(
                    child: Text('Email Address',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15)),
                  ),
                  Expanded(
                    child: Text('Phone Number',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15)),
                  ),
                  Expanded(
                    child: Text('Type',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15)),
                  ),
                  Expanded(
                    child: Text('Action',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 15)),
                  ),
                ],
              ),
              const Divider(color: Colors.white38),
              Expanded(
                child: ListView.builder(
                  itemCount: UserData().allContacts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                    UserData().allContacts[index]['name']!,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white70,
                                        fontSize: 15)),
                              ),
                              Expanded(
                                child: Text(
                                    UserData().allContacts[index]['email']!,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white38,
                                        fontSize: 15)),
                              ),
                              Expanded(
                                child: Text(
                                    UserData().allContacts[index]['phone']!,
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w200,
                                        color: Colors.white38,
                                        fontSize: 15)),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: TypeButton(
                                      isPro: UserData().allContacts[index]
                                              ['type'] ==
                                          'pro'),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.white38, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: const Row(
                                            children: [
                                              Icon(Icons.edit,
                                                  color: Colors.white38,
                                                  size: 15),
                                              SizedBox(width: 5),
                                              Text('Edit',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w200,
                                                      color: Colors.white38,
                                                      fontSize: 15)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          border: Border.all(
                                              color: Colors.red, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextButton(
                                          onPressed: () {
                                            setState(() {
                                              UserData()
                                                  .allContacts
                                                  .removeAt(index);
                                            });
                                          },
                                          child: const Icon(Icons.delete,
                                              color: Colors.red, size: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.white38,
                            thickness: 0.2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}

class TypeButton extends StatelessWidget {
  final bool isPro;

  const TypeButton({super.key, required this.isPro});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: isPro ? Colors.lightBlue : const Color(0xFF2c2c2c),
          borderRadius: BorderRadius.circular(20)),
      child: Text(isPro ? 'Pro' : 'Free',
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: isPro ? Colors.black : Colors.white60,
              fontSize: 15)),
    );
  }
}
