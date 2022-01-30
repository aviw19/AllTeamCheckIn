class CheckInForm {
  late final bool isLive;
  late final List<String> questionList;

  CheckInForm({required this.isLive, required this.questionList});

  CheckInForm.fromJson(Map<String, dynamic> json) {
    isLive = json['isLive'];
    questionList = json['questionList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isLive'] = this.isLive;
    data['questionList'] = this.questionList;
    return data;
  }
}