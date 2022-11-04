

  // var db = FirebaseFirestore.instance.collection("books");
// SizedBox(
//             height: 300,
//             child: StreamBuilder<QuerySnapshot>(
//                 stream: db.snapshots(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Text("Error");
//                   }

//                   if (snapshot.hasData) {
//                     return ListView.builder(
//                         itemCount: snapshot.data?.docs.length,
//                         itemBuilder: (context, i) {
//                           return Text("${snapshot.data?.docs[i]["title"]}");
//                         });
//                   }
//                   ;
//                   return Container();
//                 }),
//           )