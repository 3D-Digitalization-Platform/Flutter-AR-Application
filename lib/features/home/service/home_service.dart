import '../model/post_model.dart';

// TODO: Implement HomeService
class HomeService {
  // TODO: Enable when JWT is implemented
  final bool useAuth = false;

  Future<List<PostModel>> getPosts() async {
    // TODO: Implement getPosts logic
    // TODO: Attach JWT token to headers when useAuth = true
    return [
      PostModel(
        id: "1",
        title: "Cuong Duyen Ceramics",
        image: "assets/vase.png",
        likes: "453",
        comments: "20",
      ),
      PostModel(
        id: "2",
        title: "IKEA",
        image: "assets/sofa.png",
        likes: "320",
        comments: "15",
      ),
    ];
  }
}
