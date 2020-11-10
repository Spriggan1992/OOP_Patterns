import 'package:adapter/adapter/contact.dart';
import 'package:adapter/adapter/icontacts_adapter.dart';
import 'package:adapter/screens/adapter/contact_card.dart';
import 'package:flutter/material.dart';

class ContactsSection extends StatefulWidget {
  final IContactsAdapter adapter;
  final String headerText;

  const ContactsSection({
    @required this.adapter,
    @required this.headerText,
  })  : assert(adapter != null),
        assert(headerText != null);

  _ContactsSectionState createState() => _ContactsSectionState();
}

class _ContactsSectionState extends State<ContactsSection> {
  final List<Contact> contacts = List<Contact>();

  void _getContacts() {
    setState(() {
      contacts.addAll(widget.adapter.getContacts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.headerText),
        const SizedBox(height: 10),
        Stack(
          children: <Widget>[
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: contacts.length > 0 ? 1.0 : 0.0,
              child: Column(
                children: <Widget>[
                  for (var contact in contacts)
                    ContactCard(
                      contact: contact,
                    )
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: contacts.length == 0 ? 1.0 : 0.0,
              child: FlatButton(
                child: Text('Get contacts'),
                color: Colors.grey,
                // materialTextColor: Colors.white,
                onPressed: _getContacts,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
