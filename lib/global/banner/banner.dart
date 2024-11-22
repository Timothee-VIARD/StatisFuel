import 'package:flutter/cupertino.dart';

class BannerSection extends StatelessWidget {
  final String imageUrl;

  const BannerSection({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imageUrl,
          width: MediaQuery.of(context).size.width,
          height: 112,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
