class CharacterQuoteModel {
  final String author;
  final String quote;

  CharacterQuoteModel({required this.quote, required this.author});

  factory CharacterQuoteModel.fromJson(Map<String, dynamic> json) {
    return CharacterQuoteModel(quote: json['quote'], author: json['author']);
  }
}
