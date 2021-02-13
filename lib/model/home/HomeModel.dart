class HomeModel {
  HomeModel({
    this.data,
    this.errorCode,
    this.errorMsg,
  });

  HomePageData data;
  int errorCode;
  String errorMsg;
}

class HomePageData {
  HomePageData({
    this.curPage,
    this.datas,
    this.offset,
    this.over,
    this.pageCount,
    this.size,
    this.total,
  });

  int curPage;
  List<HomeDataElement> datas;
  int offset;
  bool over;
  int pageCount;
  int size;
  int total;
}

class HomeDataElement {
  HomeDataElement({
    this.apkLink,
    this.audit,
    this.author,
    this.canEdit,
    this.chapterId,
    this.chapterName,
    this.collect,
    this.courseId,
    this.desc,
    this.descMd,
    this.envelopePic,
    this.fresh,
    this.host,
    this.id,
    this.link,
    this.niceDate,
    this.niceShareDate,
    this.origin,
    this.prefix,
    this.projectLink,
    this.publishTime,
    this.realSuperChapterId,
    this.selfVisible,
    this.shareDate,
    this.shareUser,
    this.superChapterId,
    this.superChapterName,
    this.tags,
    this.title,
    this.type,
    this.userId,
    this.visible,
    this.zan,
  });

  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  String host;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int realSuperChapterId;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<Tag> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;
}

class Tag {
  Tag({
    this.name,
    this.url,
  });

  String name;
  String url;
}
