import 'package:chatzy/config.dart';

Widget voiceBottomBar(){
  return Container(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            IconButton(onPressed: (){
              
            }, icon: const Icon(Icons.mic)),
            const SizedBox(width: Insets.i10,),
            IconButton(onPressed: (){}, icon: const Icon(Icons.tag_faces_outlined)),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: (){}, icon: const Icon(Icons.calendar_month)),
            const SizedBox(width: Insets.i10,),
            IconButton(onPressed: (){}, icon: const Icon(Icons.api_rounded)),
            const SizedBox(width: Insets.i10,),
            IconButton(onPressed: (){}, icon: const Icon(Icons.card_giftcard_rounded)),
          ],
        )
      ],
    ),
  );
}