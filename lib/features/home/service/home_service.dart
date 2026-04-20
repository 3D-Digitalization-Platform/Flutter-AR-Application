import '../../../core/auth/auth_service.dart';
import '../model/post_model.dart';

class HomeService {
  final AuthService _authService = AuthService();
  String? token;

  HomeService() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    token = await _authService.getToken();
  }

  Future<List<PostModel>> getPosts() async {
    // TODO: Implement getPosts logic using _authService.dio
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
