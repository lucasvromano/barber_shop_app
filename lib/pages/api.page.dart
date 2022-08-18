import 'package:barber_shop/components/organisms/item_list_api_organism.dart';
import 'package:barber_shop/repositories/api.repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../models/api.model.dart';
import '../store/api/api.dart';

final api = Api();

class ApiPage extends StatelessWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ElevatedButton(
            child: const Text('Busca na API'),
            onPressed: () => api.getAllItems(),
          ),
          Observer(
            name: 'Obserter Teste',
            builder: (_) {
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: api.apis.length,
                    itemBuilder: (_, int index) {
                      return ItemListApiOrganism(
                        id: api.apis[index].id,
                        title: api.apis[index].title,
                        body: api.apis[index].body,
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}


// import 'package:barber_shop/repositories/post.repository.dart';
// import 'package:flutter/material.dart';

// import '../models/api.model.dart';

// class ApiPage extends StatefulWidget {
//   const ApiPage({Key? key}) : super(key: key);

//   @override
//   State<ApiPage> createState() => _ApiPageState();
// }

// class _ApiPageState extends State<ApiPage> {
//   var requesting = false;
//   late ApiRepository apiRepository;
//   late Future<Api> api;
//   late Future<List<Api>> apis;

//   @override
//   void initState() {
//     super.initState();
//     apiRepository = ApiRepository();
//   }

//   @override
//   Widget build(BuildContext context) {
//     void getApis() {
//       // api = apiRepository.fetchApi(2);
//       apis = apiRepository.fetchAllApis();
//       setState(() {
//         requesting = true;
//       });
//     }

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             ElevatedButton(
//               child: const Text('Busca na API'),
//               onPressed: () => getApis(),
//             ),
//             if (requesting)
//               FutureBuilder<List<Api>>(
//                 future: apis,
//                 builder: (_, snapshot) {
//                   if (snapshot.hasData) {
//                     return Expanded(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height,
//                         padding: const EdgeInsets.all(16),
//                         child: ListView.builder(
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (_, int index) {
//                             return Column(
//                               children: [
//                                 Text('ID --> ${snapshot.data![index].id}'),
//                                 Text(
//                                     'Title --> ${snapshot.data![index].title}'),
//                                 Text('Body --> ${snapshot.data![index].body}'),
//                                 Text(
//                                     'UserId --> ${snapshot.data![index].userId}'),
//                                 const Divider(color: Color(0xF7F7F7FF)),
//                               ],
//                             );
//                           },
//                         ),
//                         // child: Column(
//                         //   children: [
//                         //     Text('ID -> ${snapshot.data![0].id}'),
//                         //     Text('Title -> ${snapshot.data![0].title}'),
//                         //     Text('Body -> ${snapshot.data![0].body}'),
//                         //     const Divider(color: Color(0xF7F7F7FF)),
//                         //     Text('ID -> ${snapshot.data![1].id}'),
//                         //     Text('Title -> ${snapshot.data![1].title}'),
//                         //     Text('Body -> ${snapshot.data![1].body}'),
//                         //   ],
//                         // ),
//                       ),
//                     );
//                   } else if (snapshot.hasError) {
//                     return Text('${snapshot.error}');
//                   }
//                   return const CircularProgressIndicator();
//                 },
//               ),

//             // FutureBuilder<Api>(
//             //   future: api,
//             //   builder: (_, snapshot) {
//             //     if (snapshot.hasData) {
//             //       return Padding(
//             //         padding: const EdgeInsets.all(16),
//             //         child: Column(
//             //           children: [
//             //             Text('ID -> ${snapshot.data!.id}'),
//             //             Text('Title -> ${snapshot.data!.title}'),
//             //             Text('Body -> ${snapshot.data!.body}'),
//             //           ],
//             //         ),
//             //       );
//             //     } else if (snapshot.hasError) {
//             //       return Text('${snapshot.error}');
//             //     }
//             //     return const CircularProgressIndicator();
//             //   },
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
