import 'package:adapter/adapter/adapters/json_contacts_adapter.dart';
import 'package:adapter/adapter/adapters/xml_contacts_adapter.dart';
import 'package:adapter/screens/adapter/contacts_section.dart';
import 'package:flutter/material.dart';

class Adapter extends StatelessWidget {
  const Adapter({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              ContactsSection(
                adapter: JsonContactsAdapter(),
                headerText: 'Contacts from JSON API: ',
              ),
              const SizedBox(
                height: 20,
              ),
              ContactsSection(
                adapter: XmlContactsAdapter(),
                headerText: 'Contacts from JSON API: ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
