import 'package:get_storage/get_storage.dart';

final box = GetStorage();

void saveResult(questionNo, ans){
  box.writeIfNull(questionNo, false);
  box.write(questionNo, ans);  //key is questionNo  only Strning value
}

readResult (questionNo){
  bool ans =box.read(questionNo);
  return ans;
}



