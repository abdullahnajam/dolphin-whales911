class ReportModel{
  String id,url,comment,contact,date,location,type,user;
  double lat,lang;

  ReportModel(this.id, this.lat, this.lang, this.url, this.comment,
      this.contact, this.date, this.location, this.type,this.user);
}