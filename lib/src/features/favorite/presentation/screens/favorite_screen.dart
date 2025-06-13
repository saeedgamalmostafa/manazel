part of '../../favorite_imports.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "Favorite ",
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
