// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SavingGoals {
  final String uid;
  final String startDate;
  final String targetDate;
  final String nameOfGoal;
  final double targetAmount;
  final double amountSaved;
  final String savingCycle;
  final bool isAutomatic;
  final bool isCompleted;
  SavingGoals({
    required this.uid,
    required this.startDate,
    required this.targetDate,
    required this.nameOfGoal,
    required this.targetAmount,
    required this.amountSaved,
    required this.savingCycle,
     this.isAutomatic = true,
    required this.isCompleted,
  });

  SavingGoals copyWith({
    String? uid,
    String? startDate,
    String? targetDate,
    String? nameOfGoal,
    double? targetAmount,
    double? amountSaved,
    String? savingCycle,
    bool? isAutomatic,
    bool? isCompleted,
  }) {
    return SavingGoals(
      uid: uid ?? this.uid,
      startDate: startDate ?? this.startDate,
      targetDate: targetDate ?? this.targetDate,
      nameOfGoal: nameOfGoal ?? this.nameOfGoal,
      targetAmount: targetAmount ?? this.targetAmount,
      amountSaved: amountSaved ?? this.amountSaved,
      savingCycle: savingCycle ?? this.savingCycle,
      isAutomatic: isAutomatic ?? this.isAutomatic,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'startDate': startDate,
      'targetDate': targetDate,
      'nameOfGoal': nameOfGoal,
      'targetAmount': targetAmount,
      'amountSaved': amountSaved,
      'savingCycle': savingCycle,
      'isAutomatic': isAutomatic,
      'isCompleted': isCompleted,
    };
  }

  factory SavingGoals.fromMap(Map<String, dynamic> map) {
    return SavingGoals(
      uid: map['uid'] as String,
      startDate: map['startDate'] as String,
      targetDate: map['targetDate'] as String,
      nameOfGoal: map['nameOfGoal'] as String,
      targetAmount: map['targetAmount'] as double,
      amountSaved: map['amountSaved'] as double,
      savingCycle: map['savingCycle'] as String,
      isAutomatic: map['isAutomatic'] as bool,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SavingGoals.fromJson(String source) => SavingGoals.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SavingGoals(uid: $uid, startDate: $startDate, targetDate: $targetDate, nameOfGoal: $nameOfGoal, targetAmount: $targetAmount, amountSaved: $amountSaved, savingCycle: $savingCycle, isAutomatic: $isAutomatic, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(covariant SavingGoals other) {
    if (identical(this, other)) return true;
  
    return 
      other.uid == uid &&
      other.startDate == startDate &&
      other.targetDate == targetDate &&
      other.nameOfGoal == nameOfGoal &&
      other.targetAmount == targetAmount &&
      other.amountSaved == amountSaved &&
      other.savingCycle == savingCycle &&
      other.isAutomatic == isAutomatic &&
      other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
      startDate.hashCode ^
      targetDate.hashCode ^
      nameOfGoal.hashCode ^
      targetAmount.hashCode ^
      amountSaved.hashCode ^
      savingCycle.hashCode ^
      isAutomatic.hashCode ^
      isCompleted.hashCode;
  }
}
