void main(){
  String name="shahiz";
  String? optionalDescription;
  optionalDescription="lunch with friends";
optionalDescription=null;
print("length ${optionalDescription?.length}");
 String description = optionalDescription ?? "No description";
  print("Final description: $description");

}