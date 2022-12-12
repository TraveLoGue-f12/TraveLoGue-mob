import 'dart:convert' as convert;


void deleteQuestion(request, x) async {
  var data = convert.jsonEncode(<String, int?> {"pk": x.pk});
  await request.postJson("https://trave-lo-gue.up.railway.app/forum/delete_question_flutter/", data);
}

void deleteAnswer(request, x) async {
  var data = convert.jsonEncode(<String, int?> {"pk": x.pk});
  await request.postJson("https://trave-lo-gue.up.railway.app/forum/delete_answer_flutter/", data);
}