/*library ondart;
import 'package:dartlero/dartlero.dart';
import 'dart:html';
import 'dart:convert';

class Contact extends ConceptEntity<Contact> {
  String keyword;
  String aName;
  String aEmail;
  String aPhone;
  String get Name => aName;
  set Name(String pName) {
    aName = pName;
    if (code == null) {
      code = pName;
    }
  }
  String get Email => aEmail;
  set Email(String pEmail) {
    aEmail = pEmail;
    if (code == null) {
      code = pEmail;
    }
  }
  String get Phone => aPhone;
  set Phone(String pPhone) {
    aPhone = pPhone;
    if (code == null) {
      code = pPhone;
    }
  }
  Contact newEntity() => new Contact();
  Map<String, Object> toJson() {
    Map<String, Object> entityMap = super.toJson();
    entityMap['keyword'] = keyword;
    entityMap['name'] = aName;
    entityMap['email'] = aEmail;
    entityMap['phone'] = aPhone;
    return entityMap;
  }
  fromJson(Map<String, Object> entityMap) {
    entityMap['keyword'] = keyword;
    keyword = entityMap['keyword'];
    super.fromJson(entityMap);
    aName = entityMap['name'];
    aEmail = entityMap['email'];
    aPhone = entityMap['phone'];
  }
}
class Contacts extends ConceptEntities<Contact> {
  Contacts newEntities() => new Contacts();
  Contact newEntity() => new Contact();
}

class ContactModel extends ConceptModel {
  static const String aContact = 'Contact';
  Map<String, ConceptEntities> newEntries() {
    var lstContact = new Contacts();
    var map = new Map<String, ConceptEntities>();
    map[aContact] = lstContact;
    return map;
  }
  Contacts get contacts => getEntry(aContact);
}

class ContactTable {
  Contacts aContacts;    
  TableElement aContactTable;
  InputElement aInputName;
  InputElement aInputEmail;
  InputElement aInputPhone;
  ButtonElement addNote;
  ButtonElement clearNotes;
  ButtonElement loadNotes;
  ButtonElement saveNotes;
  ContactTable() {
    aContacts = new ContactModel().contacts;
    aInputName = document.querySelector('#name');
    aInputEmail = document.querySelector('#email');
    aInputPhone = document.querySelector('#phone');
    aContactTable = document.querySelector('#contacts-table');
    
    addNote = document.querySelector('#add-contact');
    addNote.onClick.listen((e) {
      addRowData(aInputName.value, aInputEmail.value,aInputPhone.value);
      aInputName.select();
    });
    clearNotes = document.querySelector('#clear-contacts');
    clearNotes.onClick.listen((e) {
      aContacts.clear();
      aContactTable.children.clear();
      aInputName.value = '';
      aInputEmail.value = '';
      aInputPhone.value = '';
      addTableCaption('Contacts');
      addColumnTitles();
    });
    loadNotes = document.querySelector('#load-notes');
    loadNotes.onClick.listen((e) {
      aContacts.fromJson(JSON.decode(window.localStorage['notes']));
      aContacts.forEach((contact) => addRowData(contact.Name, contact.Email, contact.Phone));
    });
    saveNotes = document.querySelector('#save-notes');
    saveNotes.onClick.listen((e) {
      window.localStorage['contacts'] = JSON.encode(aContacts.toJson());
    });
    addTableCaption('Contacts');
    addColumnTitles();
  }
  addTableCaption(String title) {
    var contactTableCaption = aContactTable.createCaption();
    contactTableCaption.text = title;
    aContactTable.caption = contactTableCaption;
  }
  addColumnTitles() {
    var row = new Element.tr();   
    aContactTable.children.add(row);
    addColumnTitle(row, 'Name', 30);
    addColumnTitle(row, 'Email', 34);
    addColumnTitle(row, 'Phone', 30);
    addColumnTitle(row, 'Remove', 6);
  }
  addColumnTitle(row, String title, num width) {
    var columnHeader = new Element.th();
    columnHeader.text = title; 
    columnHeader.style.width = '${width}%';
    row.children.add(columnHeader);
  }
  addRowData(String pname, String pemail, String pphone){
    var contact =new Contact();
    contact.Name = pname;
    contact.Email = pemail;
    contact.Phone = pphone;
    aContacts.add(contact);
    var contactRow = new Element.tr();
    var nameCell = new Element.td();
    var emailCell = new Element.td();
    var phoneCell = new Element.td();
    var removeCell = new Element.td();
    nameCell.style.width = '30%';
    emailCell.style.width = '34%';
    phoneCell.style.width = '30%';
    removeCell.style.width = '6%';
    nameCell.text = contact.Name;
    emailCell.text = contact.Email;
    phoneCell.text = contact.Phone;
    removeCell.text = 'X';
    aContactTable.children.add(contactRow);
    contactRow.children.add(nameCell);
    contactRow.children.add(emailCell);
    contactRow.children.add(phoneCell);
    contactRow.children.add(removeCell);
    nameCell.onClick.listen((e) {
      aInputName.value = nameCell.text;
      aInputEmail.value = emailCell.text;
      aInputPhone.value = phoneCell.text;
    });
    emailCell.onClick.listen((e) {
      aInputName.value = nameCell.text;
      aInputEmail.value = emailCell.text;
      aInputPhone.value = phoneCell.text;
    });
    phoneCell.onClick.listen((e) {
      aInputName.value = nameCell.text;
      aInputEmail.value = emailCell.text;
      aInputPhone.value = phoneCell.text;
    });
    removeCell.onClick.listen((e) {    
      aContacts.remove(aContacts.find(nameCell.text));
      contactRow.remove();
      aInputName.value = '';
      aInputEmail.value = '';
      aInputPhone.value = '';
    });
  }
}*/