void main(){
  List<String> categories=["Food", "Transport", "Books"];
  categories.add("Movies");
  print(categories[0]);
  Set uniqueCategories ={"food","Movies","food"};
print(uniqueCategories);
Map<String,double> monthlyBudget={"food":3000,"transport":5000,"movies":500,};
print(monthlyBudget['food']);
monthlyBudget['food']=5000;
print(monthlyBudget['food']);
}