import 'dart:convert' as convert;

void deletePlan(request, x) async {
  var data = convert.jsonEncode(<String, int?> {"pk": x.pk});
  await request.postJson("http://trave-lo-gue.up.railway.app/planner/deleteflutter/", data);
}