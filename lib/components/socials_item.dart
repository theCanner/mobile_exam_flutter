import 'package:flutter/widgets.dart';
import 'package:mobile_exam/components/custom_button.dart';

class SocialItem extends StatefulWidget {
  const SocialItem({super.key, required this.social});
  final dynamic social;
  @override
  State<SocialItem> createState() => _SocialItemState();
}

class _SocialItemState extends State<SocialItem> {
  @override
  Widget build(BuildContext context) {
    final item = widget.social;
    return Column(
      children: [
        Image.network(item['imgUrl'], width: double.infinity),
        Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Text(
            item['history'],
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 16),
          ),
        ),
        CustomButton(socialName: item['name']),
      ],
    );
  }
}
