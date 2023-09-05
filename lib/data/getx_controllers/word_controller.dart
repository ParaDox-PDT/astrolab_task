import 'package:flutter/cupertino.dart';
import 'package:flutter_defualt_project/data/models/definition/info_model.dart';
import 'package:flutter_defualt_project/data/models/universal_response.dart';
import 'package:flutter_defualt_project/data/network/api_service.dart';
import 'package:flutter_defualt_project/utils/ui_utils/error_message_dialog.dart';
import 'package:flutter_defualt_project/utils/ui_utils/loading_dialog.dart';
import 'package:get/get.dart';

class WordController extends GetxController{
  WordController({required this.apiService });

  final ApiService apiService;
  var word = "".obs;
  var isSearchTapped=false.obs;
  late Rx<InfoModel> wordInfo;

  RxList<InfoModel> wordsInfo = <InfoModel>[].obs;
  getWordDefinitionList({required BuildContext context})async{
    showLoading(context: context);
    UniversalData universalData = await apiService.getDefinition(word: word.value);
    if(context.mounted){
      hideLoading(dialogContext: context);
    }
    if(universalData.error.isEmpty){
      wordsInfo.value=universalData.data as List<InfoModel>;
      wordInfo = wordsInfo[0].obs;
    }else{
      if(context.mounted){
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }
}