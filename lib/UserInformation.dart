import 'package:cloud_firestore/cloud_firestore.dart';

class UserInformation {
  final String? id;
  final String name;
  final String age;
  final String height;
  final String weight;
  final String BMI;

  const UserInformation({this.id,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.BMI,
  });

  toMap() {
    return {
      "Name": name,
      "Age": age,
      "Height": height,
      "Weight": weight,
    };
  }

  factory UserInformation.fromSnapshot(DocumentSnapshot<Map< String , dynamic>> document){
    final data = document.data()!;
    return UserInformation(
        id: document.id,
        name: data["Name"],
        age: data["Age"],
        height: data["Height"],
        weight: data["Weight"],
        BMI: data["BMI"]
    );
  }
}