namespace MyApp.Models
{

    public class Employee
    {
        public String id { get; set; }
        public String name { get; set; } = "unknown";
        double hoursPerWeek { get; set; } = 40;
        double salary = 1234;
        public List<string> languages { get; set; } = [];

        // next line will leed to exception on deserialize
        //public Employee(string s) { this.id = s; }
        public Employee(string id) { this.id = id; }

    }

    public class Person
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public DateTime BirthDate { get; set; }
    }

}