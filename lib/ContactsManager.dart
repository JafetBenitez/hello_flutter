import 'dart:async';

List<String> CONTACTS = ['Juan', 'Luis', 'Pedro', 'Ana']; 

class ContactsManager {

  final StreamController<int> _contactsCounter = StreamController<int>();
  
  Stream<List<String>> get contactListNow async* {
    for (var i = 0; i < CONTACTS.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield CONTACTS.sublist(0, i+1);
    }

  }

  Stream<int> get contactsCounter => _contactsCounter.stream;

  ContactsManager() {
    contactListNow.listen( (list) => {
      _contactsCounter.add(list.length)
    });
  }  

}