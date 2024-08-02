import 'package:chatzy/config.dart';

Widget totalParticipensIndicator(){
  return Container(
    padding: const EdgeInsets.all(2),
    decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(10)),
    child: const Center(child: Row(
      children: [
        Icon(Icons.person,color: Colors.white,),
        Text('10',style: TextStyle(color: Colors.white),),
      ],
    )),
  );
}