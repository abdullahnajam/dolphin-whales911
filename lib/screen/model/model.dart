class Model {
  String company;
  String icon;
  String type;
  String id;
  String pdf;
  String cat;

  Model(this.company, this.icon, this.type, this.id, this.pdf, this.cat,
      this.des);

  String des;

  //Model(this.id,this.company,this.icon,this.type);
}
class ErrorCode{
  String code,errorId,description;
  ErrorCode(this.errorId,this.code,this.description);

}
class User {

  final String uid;

  User({ this.uid });

}
class RequestModel{
  String name,type,description,category;

  RequestModel(this.name, this.type, this.description, this.category);
}
class CompanyList{
  List<Model> companyList;

  CompanyList({this.companyList} );
}