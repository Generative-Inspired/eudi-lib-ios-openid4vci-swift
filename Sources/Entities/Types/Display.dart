
class Display {
  final String name;
  final String locale;
  final String? logo;
  final String? description;
  final String? backgroundColor;
  final String? textColor;

  Display({
    required this.name,
    required this.locale,
    this.logo,
    this.description,
    this.backgroundColor,
    this.textColor,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'locale': locale,
    if (logo != null) 'logo': logo,
    if (description != null) 'description': description,
    if (backgroundColor != null) 'background_color': backgroundColor,
    if (textColor != null) 'text_color': textColor,
  };

  factory Display.fromJson(Map<String, dynamic> json) {
    return Display(
      name: json['name'] as String,
      locale: json['locale'] as String,
      logo: json['logo'] as String?,
      description: json['description'] as String?,
      backgroundColor: json['background_color'] as String?,
      textColor: json['text_color'] as String?,
    );
  }
}
