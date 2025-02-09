import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import 'package:rolla_task/features/log/presentation/widgets/log_card.dart';
import 'package:rolla_task/resources.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(userId: json['userId'], id: json['id'], title: json['title'], body: json['body']);
  }
}

// Future<dynamic> fetchData() async {

// BaseOptions(
//   baseUrl: 'https://api.example.com',
//   connectTimeout: const Duration(seconds: 10),
//   receiveTimeout: const Duration(seconds: 10),
//   headers: {
//     'Accept': 'application/json',
//     'Authorization': 'Bearer +b9EYQNMRyh40lcF0sbAhg==TW7u5isSKHteTURs',
//   },
// ),
//  var url = Uri.parse('https://api.api-ninjas.com/v1/inflation');
//   var response = await dio.get(url.toString());

//   if (response.statusCode == 200) {
//     print('Data successfuly retrieved ${response.data}');
//   } else {
//     print('Error catching');
//   }
// }

final maxCardCountProvider = Provider<int>((_) => 30);

@RoutePage()
class LogPage extends HookConsumerWidget {
  LogPage({
    super.key,
    this.createdAt,
    this.actorUsername,
    this.payloadDescription,
    this.eventType,
  });

  final String? eventType;
  final String? actorUsername;
  final String? payloadDescription;
  final int? createdAt;

  final logCards = [0, 1, 2, 3, 4, 5];

  final dio = Dio();

  makeRequest() async {
    try {
      final response = await dio.get(
        'https://api.api-ninjas.com/v1/inflation',
        queryParameters: {
          'sortBy': 'createdAt',
          'limit': 10,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer +b9EYQNMRyh40lcF0sbAhg==TW7u5isSKHteTURs',
          },
        ),
      );
      print(response.data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = useState<List<dynamic>>([]);
    final isLoading = useState<bool>(true);

    useEffect(() {
      makeRequest().then((data) {
        data.value = data;
        isLoading.value = false;
        print('Data fetched: $data');
      }).onError((error, stackTrace) {
        print('Error occurred: $error');
      });
      return null;
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Logs',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColor.neutral1,
      ),
      backgroundColor: AppColor.neutral1,
      body: const Text('ads'),
      //isLoading.value
      // vjerovatno se isLoading nikad ne promjeni zbog useStatea
      // ? Center(child: CircularProgressIndicator())
      //:
      // RangeError (length): Invalid value: Valid value range is empty: 0
      //     ListView.builder(
      //   itemBuilder: (context, index) {
      //     return ListTile(
      //       title: Text(data.value[index].toString()),
      //       subtitle: Text(data.value[index]['decription'] ?? ''),
      //     );
      //   },
      // ),
    );
  }
}
