class DiyanetResponse {
  List<dynamic>? pointerList;
  int? cuzNo;
  int? pageNo;
  String? arCuzNo;
  String? arPageNo;
  List<QuranAyats>? quranAyats;
  List<QuranAyats>? mealAyats;
  dynamic tefsirList;
  String? mealSureLabel;
  String? quranSureLabel;
  dynamic endPageSure;

  DiyanetResponse(
      {this.pointerList,
      this.cuzNo,
      this.pageNo,
      this.arCuzNo,
      this.arPageNo,
      this.quranAyats,
      this.mealAyats,
      this.tefsirList,
      this.mealSureLabel,
      this.quranSureLabel,
      this.endPageSure});

  DiyanetResponse.fromJson(Map<String, dynamic> json) {
    pointerList = json['PointerList'];
    cuzNo = json['CuzNo'];
    pageNo = json['PageNo'];
    arCuzNo = json['ArCuzNo'];
    arPageNo = json['ArPageNo'];
    if (json['QuranAyats'] != null) {
      quranAyats = <QuranAyats>[];
      json['QuranAyats'].forEach((v) {
        quranAyats!.add(new QuranAyats.fromJson(v));
      });
    }
    if (json['MealAyats'] != null) {
      mealAyats = <QuranAyats>[];
      json['MealAyats'].forEach((v) {
        mealAyats!.add(new QuranAyats.fromJson(v));
      });
    }
    tefsirList = json['TefsirList'];
    mealSureLabel = json['MealSureLabel'];
    quranSureLabel = json['QuranSureLabel'];
    endPageSure = json['EndPageSure'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PointerList'] = this.pointerList;
    data['CuzNo'] = this.cuzNo;
    data['PageNo'] = this.pageNo;
    data['ArCuzNo'] = this.arCuzNo;
    data['ArPageNo'] = this.arPageNo;
    if (this.quranAyats != null) {
      data['QuranAyats'] = this.quranAyats!.map((v) => v.toJson()).toList();
    }
    if (this.mealAyats != null) {
      data['MealAyats'] = this.mealAyats!.map((v) => v.toJson()).toList();
    }
    data['TefsirList'] = this.tefsirList;
    data['MealSureLabel'] = this.mealSureLabel;
    data['QuranSureLabel'] = this.quranSureLabel;
    data['EndPageSure'] = this.endPageSure;
    return data;
  }
}

class QuranAyats {
  int? id;
  int? sureId;
  int? ayetId;
  int? languageId;
  String? ayetNumber;
  bool? ayetVisible;
  int? page;
  String? ayetText;
  String? recitation;
  Null? ayetMeta;
  Null? regionList;
  Sure? sure;

  QuranAyats(
      {this.id,
      this.sureId,
      this.ayetId,
      this.languageId,
      this.ayetNumber,
      this.ayetVisible,
      this.page,
      this.ayetText,
      this.recitation,
      this.ayetMeta,
      this.regionList,
      this.sure});

  QuranAyats.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    sureId = json['SureId'];
    ayetId = json['AyetId'];
    languageId = json['LanguageId'];
    ayetNumber = json['AyetNumber'];
    ayetVisible = json['AyetVisible'];
    page = json['Page'];
    ayetText = json['AyetText'];
    recitation = json['Recitation'];
    ayetMeta = json['AyetMeta'];
    regionList = json['RegionList'];
    sure = json['Sure'] != null ? new Sure.fromJson(json['Sure']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['SureId'] = this.sureId;
    data['AyetId'] = this.ayetId;
    data['LanguageId'] = this.languageId;
    data['AyetNumber'] = this.ayetNumber;
    data['AyetVisible'] = this.ayetVisible;
    data['Page'] = this.page;
    data['AyetText'] = this.ayetText;
    data['Recitation'] = this.recitation;
    data['AyetMeta'] = this.ayetMeta;
    data['RegionList'] = this.regionList;
    if (this.sure != null) {
      data['Sure'] = this.sure!.toJson();
    }
    return data;
  }
}

class Sure {
  int? sureId;
  String? mealInfo;
  String? sureNameTurkish;
  String? sureNameArabic;
  bool? besmeleVisible;
  bool? headerOnBackPage;
  int? inisOrder;
  int? ayetCount;
  int? cuz;
  int? firstPage;

  Sure(
      {this.sureId,
      this.mealInfo,
      this.sureNameTurkish,
      this.sureNameArabic,
      this.besmeleVisible,
      this.headerOnBackPage,
      this.inisOrder,
      this.ayetCount,
      this.cuz,
      this.firstPage});

  Sure.fromJson(Map<String, dynamic> json) {
    sureId = json['SureId'];
    mealInfo = json['MealInfo'];
    sureNameTurkish = json['SureNameTurkish'];
    sureNameArabic = json['SureNameArabic'];
    besmeleVisible = json['BesmeleVisible'];
    headerOnBackPage = json['HeaderOnBackPage'];
    inisOrder = json['InisOrder'];
    ayetCount = json['AyetCount'];
    cuz = json['Cuz'];
    firstPage = json['FirstPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['SureId'] = this.sureId;
    data['MealInfo'] = this.mealInfo;
    data['SureNameTurkish'] = this.sureNameTurkish;
    data['SureNameArabic'] = this.sureNameArabic;
    data['BesmeleVisible'] = this.besmeleVisible;
    data['HeaderOnBackPage'] = this.headerOnBackPage;
    data['InisOrder'] = this.inisOrder;
    data['AyetCount'] = this.ayetCount;
    data['Cuz'] = this.cuz;
    data['FirstPage'] = this.firstPage;
    return data;
  }
}
