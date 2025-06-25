import '../../../business_logic/cubit/character_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  CustomAppBar({super.key, required this.onSearchChanged});
  final Function(String) onSearchChanged;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 50);
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController searchController = TextEditingController();

  String searchHint = '';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Characters', style: TextStyle(color: Colors.black)),
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: const Color.fromARGB(255, 13, 76, 124),
                ),
                suffixIcon:
                    searchHint.isNotEmpty
                        ? IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: const Color.fromARGB(255, 13, 76, 124),
                          ),
                          onPressed: () {
                            setState(() {
                              searchController.clear();
                              searchHint = '';
                              widget.onSearchChanged('');
                            });
                          },
                        )
                        : null,
                hintText: 'Search Character Name',
                hintStyle: TextStyle(color: Colors.grey[600]),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
              onChanged:
                  (value) => {
                    setState(() {
                      searchHint = value;
                    }),
                    widget.onSearchChanged(value),
                  },
            ),
          ),
        ),
      ),
    );
  }
}
