import 'package:flutter/material.dart';

import '../models/student_model.dart';

class DashboardScreen extends StatelessWidget {
  final List<StudentModel> loadedStudents = [
    StudentModel(
      id: 's1',
      imageUrl: 'https://drive.google.com/file/d/1swDv9IUgjiaF-v_tXsn2pT_kc4TYKarG/view?usp=sharing',
      firstName: 'Arjanit',
      lastName: 'Kotorri',
      profession: 'Mobile Developers',
      grade: 10.0,
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349810507',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry''s '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: '@niityyy',
      facebook: '@niityyy',
      linkedIn: '@niityyy',
      twitter: '@niityyy',
      isPromoted: false,
    ),
    StudentModel(
      id: 's2',
      imageUrl: 'https://drive.google.com/file/d/1QAqC5hIqM5LJyYCz4gmqgUF9mNxVpuzZ/view?usp=sharing',
      firstName: 'Arber',
      lastName: 'Mirena',
      profession: 'Front End Developers',
      grade: 10.0,
      email: 'mirenaarber@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry''s '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: '@arbermirena',
      facebook: '@arbermirena',
      linkedIn: '@arbermirena',
      twitter: '@arbermirena',
      isPromoted: false,
    ),
    StudentModel(
      id: 's3',
      imageUrl: 'https://drive.google.com/file/d/1YpVWtJudwjjwJEDreaDu7BU6qZPlfSE1/view?usp=sharing',
      firstName: 'Diellza',
      lastName: 'Lushi',
      profession: 'Front End Developers',
      grade: 10.0,
      email: 'lushidiellza@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry''s '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: '@diellzalushi',
      facebook: '@diellzalushi',
      linkedIn: '@diellzalushi',
      twitter: '@diellzalushi',
      isPromoted: false,
    ),
    StudentModel(
      id: 's4',
      imageUrl: 'https://drive.google.com/file/d/1jDnHq_TdZtBV0cqKcJDCXkB2xDSYjgOc/view?usp=sharing',
      firstName: 'Ideal',
      lastName: 'Haziraj',
      profession: 'Mobile Developers',
      grade: 10.0,
      email: 'kotorriarjanit@gmail.com',
      phoneNumber: '+38349123123',
      biography: 'Lorem Ipsum is simply dummy text of the printing and '
          'typesetting industry. Lorem Ipsum has been the industry''s '
          'standard dummy text ever since the 1500s, when an unknown printer '
          'took a galley of type and scrambled it to make a type specimen book.',
      instagram: '@idealhaziraj',
      facebook: '@idealhaziraj',
      linkedIn: '@idealhaziraj',
      twitter: '@idealhaziraj',
      isPromoted: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
