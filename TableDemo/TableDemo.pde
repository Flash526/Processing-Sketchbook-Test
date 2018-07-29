void setup()
{
  Table table = new Table();
  table.addColumn("id");
  table.addColumn("day");
  
  TableRow newRow = table.addRow();
  newRow.setInt("id", table.lastRowIndex());
  newRow.setString("day", "Monday");
  newRow = table.addRow();
  newRow.setInt("id", table.lastRowIndex());
  newRow.setString("day", "Tuesday");
  newRow = table.addRow();
  newRow.setInt("id", table.lastRowIndex());
  newRow.setString("day", "Wednesday");
  
  saveTable(table, "data/new.csv");
}