import 'package:chatter_box/features/shared/views/widgets/avatar_builder.dart';
import 'package:chatter_box/utils/app_routes.dart';
import 'package:flutter/material.dart';

class ChatsListItem extends StatelessWidget {
  const ChatsListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.chatConvoScreen,
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const AvatarBuilder(
                  imgUrl:
                      'https://s3.amazonaws.com/arc-authors/washpost/50eda441-600e-4fa5-9f0d-6cb1714ac367.png',
                ),
                const SizedBox(
                  width: 10.0,
                ),
                _bodyBuilder(),
              ],
            ),
            const SizedBox(
              width: 10.0,
            ),
            _counterBuilder(context),
          ],
        ),
      ),
    );
  }

  Widget _bodyBuilder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Lana Smith',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          'I am doing my homework. Something..',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
      ],
    );
  }

  Widget _counterBuilder(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: const Text(
        '12',
        style: TextStyle(
          fontSize: 10.0,
          color: Colors.white,
        ),
      ),
    );
  }
}
