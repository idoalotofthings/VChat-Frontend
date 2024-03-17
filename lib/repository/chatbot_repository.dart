import 'package:http/http.dart';
import 'dart:convert';

import 'package:vchat_frontend/model/query.dart';

class ChatbotRepository {

  final String baseUrl;

  final _cache = <String, Query>{};
  

  ChatbotRepository(this.baseUrl);

  Future<List<Query>> getChildQueriesAtNodeId(String nodeId) async {
    print("BEFORE REQ");
    Response request;
    try {
      print("Requesting at $baseUrl/chatbot/api?node_id=$nodeId");
      request = await get(Uri.parse("$baseUrl/chatbot/api?node_id=$nodeId"));
    } catch(e) {
      print(e);
      return List.empty();
    }
    print(request.body);
    final responseBody = jsonDecode(request.body);

    final queryList = <Query>[];

    for(var pair in responseBody["queries"]) {
      final query = Query(pair["question"]!, pair["answer"]!, pair["nodeId"]!);
      queryList.add(query);
      _cache[query.nodeId] = query;
    }

    return queryList;
  }

  String getAnswerFromNodeId(String nodeId) {
    return _cache[nodeId]?.answer ?? "";
  }

}