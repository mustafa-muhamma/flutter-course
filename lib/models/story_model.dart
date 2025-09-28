class StoryModel {
  final String name;
  final String imageUrl;
  final String? status;
  final bool isOwn;

  StoryModel({
    required this.name,
    required this.imageUrl,
    this.status,
    this.isOwn = false,
  });
}
