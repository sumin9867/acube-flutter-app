// ignore_for_file: file_names

class GetCommands extends Object {
  String? type;

  GetCommands({type});

  GetCommands.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }
}
