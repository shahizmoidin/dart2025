void main(){
  List<double> expenses=[100,200,250,500];
  print("all expenses");
  for (int i=0;i<expenses.length;i++)
  {
    print(expenses[i]);
  }

  for(double expense in expenses){
    print(expense);
  }
  double total = 0;
  int index = 0;
  while (index < expenses.length) {
    total += expenses[index];
    index++;
  }
  print("Total expenses: $total");

}