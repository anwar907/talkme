class CompletionModels {
  String? id;
  String? object;
  int? created;
  String? model;
  Usage? usage;
  List<Choise>? choise;

  CompletionModels(
      {this.id,
      this.object,
      this.created,
      this.model,
      this.usage,
      this.choise});

  factory CompletionModels.fromJson(Map<String, dynamic> json) =>
      CompletionModels(
          id: json['id'],
          object: json['object'],
          created: json['created'],
          model: json['model'],
          usage: json['usage'] != null ? Usage.fromJson(json['usage']) : null,
          choise: json['choices'] != null
              ? List<Choise>.from(
                  json['choices'].map((e) => Choise.fromJson(e)))
              : null);

  Map<String, dynamic> toJson() => {
        'id': id,
        'object': object,
        'created': created,
        'model': model,
        'usage': usage?.toJson(),
        'choise': List<dynamic>.from(choise!.map((e) => e.toJson()))
      };
}

class Usage {
  int? promptTokens;
  int? completionTokens;
  int? totalTokens;

  Usage({this.promptTokens, this.completionTokens, this.totalTokens});

  factory Usage.fromJson(Map<String, dynamic> json) => Usage(
      promptTokens: json['prompt_tokens'],
      completionTokens: json['completion_tokens'],
      totalTokens: json['total_tokens']);

  Map<String, dynamic> toJson() => {
        'prompt_tokens': promptTokens,
        'completion_tokens': completionTokens,
        'total_tokens': totalTokens
      };
}

class Message {
  String? role;
  String? content;

  Message({this.role, this.content});

  factory Message.fromJson(Map<String, dynamic> json) =>
      Message(role: json['role'], content: json['content']);

  Map<String, dynamic> toJson() => {'role': role, 'content': content};
}

class Choise {
  Message? message;
  String? finishReason;
  int? index;

  Choise({this.message, this.finishReason, this.index});

  factory Choise.fromJson(Map<String, dynamic> json) => Choise(
      message:
          json['message'] != null ? Message.fromJson(json['message']) : null,
      finishReason: json['finish_reason'],
      index: json['index']);

  Map<String, dynamic> toJson() => {
        'message': message?.toJson(),
        'finish_reason': finishReason,
        'index': index
      };
}
