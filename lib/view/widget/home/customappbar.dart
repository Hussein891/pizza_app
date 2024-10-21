import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final void Function() onPressedSearch;
  final String hintText;
  final void Function() onPressedIcon;
  final void Function(String)? onChanged;
  final TextEditingController? myController;
  const CustomAppBar({super.key,
    required this.onPressedSearch,
    required this.hintText,
    required this.onPressedIcon,
      this.onChanged, required this.myController});

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: const EdgeInsets.only(top: 10),
            padding:const EdgeInsets.symmetric(horizontal: 15),
            child: Row(children: [
              Expanded(child: TextFormField(
                controller: myController,
                onChanged:onChanged ,
                decoration: InputDecoration(
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 3),
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,color: Colors.grey,),
                      onPressed: onPressedSearch),
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 20),
                  border:  OutlineInputBorder(
                    borderSide:BorderSide.none ,borderRadius: BorderRadius.circular(15)),
                    filled: true,
                    fillColor: Colors.grey[200]
                ) ,
              )),
        
              const SizedBox(width: 10,),
        
              Container(
                width: 55,
                
                decoration: BoxDecoration(
                 color:  Colors.grey[200],
                 borderRadius: BorderRadius.circular(8)
                ),
                child: IconButton(
                  onPressed: onPressedIcon,
                  icon:const Icon(
                    Icons.notifications_active_outlined,color:Colors.grey ,)
                    ,),),
                    const SizedBox(width: 10,),
        
            
            ]
            ),
          );
  }
}