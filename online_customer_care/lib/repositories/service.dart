
class Service{
  int id;
  String Name;
  String Description;
  String Image;
  
  Service({this.id,this.Name,this.Description,this.Image});
  factory Service.fromJson(Map<String, dynamic> item) => _$UserFromJson(item);
  serviceToJson(Service service) => _$ServiceToJson(service);

}
Service _$UserFromJson(Map<String, dynamic> json) {
  return Service(
      id: json['id'] as int,
      Name: json['Name'] as String,
      Description: json['Description'] as String,
      Image: json['Image'] as String,
    

  );

}
Map<String, dynamic> _$ServiceToJson(Service instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Name': instance.Name,
      'Description': instance.Description,
      'Image': instance.Image,

    };