import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/student_model.dart';

class StudentsProvider with ChangeNotifier {
  List<StudentModel> _studentItems = [
    StudentModel(
      id: '1',
      categoriesId: 'se',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/13164402_1222684387764150_6477654281753606023_n.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=0quF60pbwGkAX8H0rgV&_nc_ht=scontent-mxp1-2.xx&oh=bfc1c7fba9e9886ee34f45e2069ccf44&oe=600BD880',
      firstName: 'Arjanit',
      lastName: 'Kotorri',
      profession: 'Mobile Developer',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349810507',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'niityyy',
      facebook: 'niti.kfg',
      linkedIn: 'niityyy',
      twitter: 'niityyy',
    ),
    StudentModel(
      id: '2',
      categoriesId: 'se',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/32737294_365232333985978_5537160310034530304_n.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_ohc=M3ChFfQcresAX9trApG&_nc_ht=scontent-mxp1-2.xx&oh=f18ec964cf26455e8da2cb2690d7ee7a&oe=600D0DF3',
      firstName: 'Arber',
      lastName: 'Mirena',
      profession: 'Front End Developer',
      grade: '10.0',
      email: 'mirenaarber@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'arbermirena',
      facebook: 'arbermirena',
      linkedIn: 'arbermirena',
      twitter: 'arbermirena',
      isPromoted: false,
    ),
    StudentModel(
      id: '3',
      categoriesId: 'se',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/82281086_624218655015356_4381719446331326464_n.jpg?_nc_cat=100&ccb=2&_nc_sid=09cbfe&_nc_ohc=iq8Mv5fXRssAX__7pO7&_nc_ht=scontent-mxp1-2.xx&oh=827739925af0a3c60affb1bbca89f062&oe=600ED147',
      firstName: 'Diellza',
      lastName: 'Lushi',
      profession: 'Front End Developer',
      grade: '10.0',
      email: 'lushidiellza@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'diellzalushi',
      facebook: 'diellzalushi',
      linkedIn: 'diellzalushi',
      twitter: 'diellzalushi',
      isPromoted: false,
    ),
    StudentModel(
      id: '4',
      categoriesId: 'se',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Ideal',
      lastName: 'Haziraj',
      profession: 'Back End Developer',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '5',
      categoriesId: 'gd',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Hamdi',
      lastName: 'Gashi',
      profession: 'Graphic Design',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '6',
      categoriesId: 'gd',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Shukri',
      lastName: 'Gashi',
      profession: 'Graphic Design',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '7',
      categoriesId: 'gd',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Sevdaim',
      lastName: 'Gashi',
      profession: 'Graphic Design',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '8',
      categoriesId: 'gd',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Shpresmir',
      lastName: 'Gashi',
      profession: 'Graphic Design',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '9',
      categoriesId: 'bm',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Albin',
      lastName: 'Kurti',
      profession: 'Business Management',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '10',
      categoriesId: 'bm',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Isa',
      lastName: 'Mustafa',
      profession: 'Business Management',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '11',
      categoriesId: 'inf',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Donika',
      lastName: 'Gashi',
      profession: 'Infirmary',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '12',
      categoriesId: 'inf',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Shpresa',
      lastName: 'Gashi',
      profession: 'Infirmary',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '13',
      categoriesId: 'eng',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Blerta',
      lastName: 'Gashi',
      profession: 'English',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
    StudentModel(
      id: '14',
      categoriesId: 'eng',
      imageUrl:
          'https://scontent-mxp1-2.xx.fbcdn.net/v/t1.0-9/189918_172478429564308_191876033_n.jpg?_nc_cat=102&ccb=2&_nc_sid=de6eea&_nc_ohc=6x950toLvhoAX8Q9Id4&_nc_ht=scontent-mxp1-2.xx&oh=e03a84d71f926f93fb014d24f0697465&oe=600E1E9B',
      firstName: 'Arta',
      lastName: 'Gashi',
      profession: 'English',
      grade: '10.0',
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry'
          's '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: 'idealhaziraj',
      facebook: 'idealhaziraj',
      linkedIn: 'idealhaziraj',
      twitter: 'idealhaziraj',
      isPromoted: false,
    ),
  ];

  List<StudentModel> get studentItems {
    return [..._studentItems];
  }

  List<StudentModel> get favoriteStudent {
    return _studentItems.where((studItem) => studItem.isFavorite).toList();
  }

  StudentModel findStudentById(String id) {
    return studentItems.firstWhere((stud) => stud.id == id);
  }

  Future<void> addStudent(StudentModel student) async{
    const url = 'https://srecruiter-96183-default-rtdb.firebaseio.com/students.json';
    try{
      final response = await http.post(url, body: json.encode({
          'categoriesId': student.categoriesId,
          'imageUrl': student.imageUrl,
          'firstName': student.firstName,
          'lastName': student.lastName,
          'profession': student.profession,
          'grade': student.grade,
          'email': student.email,
          'phoneNumber': student.phoneNumber,
          'biography': student.biography,
          'instagram': student.instagram,
          'facebook': student.facebook,
          'linkedIn': student.linkedIn,
          'twitter': student.twitter,
          'isFavorite': student.isFavorite,
      }));
      final newStudent = StudentModel(
        id: json.decode(response.body)['name'],
        categoriesId: student.categoriesId,
        imageUrl: student.imageUrl,
        firstName: student.firstName,
        lastName: student.lastName,
        profession: student.profession,
        grade: student.grade,
        email: student.email,
        phoneNumber: student.phoneNumber,
        biography: student.biography,
        instagram: student.instagram,
        facebook: student.facebook,
        linkedIn: student.linkedIn,
        twitter: student.twitter,
      );
      _studentItems.add(newStudent);
      notifyListeners();
    }catch(error){
      throw error;
    }
  }
  
  void updateStudent(String id, StudentModel newStudent){
    final studIndex = _studentItems.indexWhere((student) => student.id == id);
    if(studIndex >= 0){
      _studentItems[studIndex] = newStudent;
      notifyListeners();
    }else{
      print('...');
    }
  }

  void deleteStudent(String id){
    _studentItems.removeWhere((student) => student.id == id);
    notifyListeners();
  }
}
