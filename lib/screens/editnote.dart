import 'package:flutter/material.dart';
import 'package:notes/model/notes.dart';
import 'package:notes/screens/home_screen.dart';

class Editnote extends StatefulWidget {
  const Editnote({
    super.key,
    this.note,
  });

  final Note? note;

  @override
  State<Editnote> createState() => _EditnoteState();
}

class _EditnoteState extends State<Editnote> {

  late Color selectedColor;
  bool isExpanded = false;
  late TextEditingController headingController = TextEditingController();
  late TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedColor = widget.note?.color ?? const Color(0xffE8F9FF);
    headingController = TextEditingController(
      text: widget.note?.heading ?? '',
    );
    contentController = TextEditingController(
      text: widget.note?.content ?? '',
    );
  }

  @override
  void dispose() {
    headingController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: selectedColor,
      appBar: AppBar(
        backgroundColor: selectedColor,
        leading: IconButton(
          onPressed: () {
            showDialog(context: context, barrierColor: Colors.transparent, builder: (BuildContext context) {
              return AlertDialog(
                backgroundColor: const Color(0xff1e1e1e),
                title: const Text("Do you want to save?"),
                content: SizedBox(
                  width: 300,
                  height: 50, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const HomeScreen()),
                            (route) => false, // Removes all previous routes
                          );
                        },
                        icon: const Icon(Icons.exit_to_app, color: Colors.red),
                        label: const Text("Exit", style: TextStyle(color: Colors.red)),
                      ),
                      const VerticalDivider(),
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.save, color: Colors.green),
                        label: const Text("Save", style: TextStyle(color: Colors.green)),
                      ),
                    ],
                  ),
                ),
              );
            });
          }, 
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xff1e1e1e),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: FloatingActionButton.small(
              heroTag: 'Save',
              onPressed: () {}, 
              backgroundColor: const Color(0xff1e1e1e),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Icon(Icons.check, size: 20,),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: headingController,
              style: const TextStyle(
                color: Color(0xff1e1e1e), 
                fontFamily: "Tangerine",
                fontWeight: FontWeight.w700,
                fontSize: 50,
              ),
              cursorHeight: 50,
              decoration: const InputDecoration(
                hintText: "Heading",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Tangerine",
                  fontWeight: FontWeight.w700,
                  fontSize: 50
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: contentController,
                maxLines: null,
                expands: true,
                style: const TextStyle(
                  color: Color(0xff1e1e1e),
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                ),
                decoration: const InputDecoration(
                  hintText: "Content",
                  hintStyle: TextStyle(
                  color: Colors.grey,
                  fontFamily: "Outfit",
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (isExpanded)
          AnimatedContainer(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.55),
              borderRadius: BorderRadius.circular(50)
            ),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _colorCircle(const Color(0xffE8F9FF)),
                  _colorCircle(const Color(0xffF6F8D5)),
                  _colorCircle(const Color(0xffF7DFDF)),
                ],
              ),
            ),
          ),
          FloatingActionButton.small(
            heroTag: 'Edit',
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            onPressed: () { 
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            backgroundColor: const Color(0xff1e1e1e),
            foregroundColor: Colors.white,
            child: Icon(
              isExpanded ? Icons.close : Icons.edit,
              size: 20,
            ),
          ),
        ], 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _colorCircle(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color; 
          isExpanded = false;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
        child: CircleAvatar(
          radius: 16,
          backgroundColor: color,
        ),
      )
    );
  }
}