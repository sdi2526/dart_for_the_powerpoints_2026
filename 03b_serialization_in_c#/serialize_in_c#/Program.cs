using System.Text.Json;
using MyApp.Models;

namespace MyApp
{
    internal class Program
    {
        private static void Main(string[] args)
        {
            test_dynamic_in_csharp();

            var employee = new Employee("123")
            {
                name = "GS1",
                languages = new List<string>() { "xx", "yy" }
            };

            var json = JsonSerializer.Serialize(employee);
            Console.WriteLine($"serialized json is {json}");

            var deserializedPerson = JsonSerializer.Deserialize<Employee>(json);
            Console.WriteLine($"read name was {deserializedPerson!.name}");

            var options = new JsonSerializerOptions
            {
                WriteIndented = true,
                PropertyNameCaseInsensitive = true
            };

            var fileName = "test.json";
            var jsonPretty = JsonSerializer.Serialize(employee, options);
            Console.WriteLine($"jsonPretty is {jsonPretty}");
            File.WriteAllText(fileName, jsonPretty);

            string jsonAgain = File.ReadAllText(fileName);
            var personAgain = JsonSerializer.Deserialize<Employee>(jsonAgain, options);
            Console.WriteLine($"read name from pretty {personAgain!.name}");
            Console.WriteLine($"read first language from pretty {personAgain!.languages[0]}");

            fillAndSearchMap(100000, 10000);
            fillAndSearchList(100000, 10000);
        }


        static void test_dynamic_in_csharp()
        {
            dynamic d = "abc";
            d = 1;
            d = d + 1;  // in C# this works even when last line is commented !
            Console.WriteLine($"d is {d}");

            // {} is the collection initializer in C#
            d = new List<int> { 4, 5, 6 };
            // d = (List<int>) [4,5, 6 ];  // "collection expression" new in C# 12

            Console.WriteLine(d.GetType());
            // next line does not work with List<dynamic>
            if (d.GetType() == typeof(List<int>))
            {
                Console.WriteLine($"d[1] is {d[1]}");
            }
            else
            {
                Console.WriteLine("d is no list");
            }

            //d = new int[] { 1, 2, 3 };
            d = (int[])[1, 2, 3];
            if (d.GetType() == typeof(int[]))
            {
                Console.WriteLine($"d[1] is {d[1]}");
            }

        }

        static void fillAndSearchMap(int employeeCount, int loopCount)
        {
            // Using the modern C# 12 syntax
            //Dictionary<string, Employee> employees = [];
            var employees = new Dictionary<string, Employee>();

            Console.WriteLine("start inserting in map ...");
            for (int i = 0; i < employeeCount; i++)
            {
                var id = i.ToString();
                employees[id] = new Employee(id);
            }

            Console.WriteLine("start searching in map ...");
            var random = new Random();
            for (int i = 0; i < loopCount; i++)
            {
                if (i % 1000 == 0)
                {
                    Console.WriteLine("i is $i");
                }
                var id = random.Next(employeeCount - 1).ToString();
                //id = "xyz123";
                var employee = employees[id];
                if (employee == null)
                {
                    Console.WriteLine("did not find employee with id=$id");
                }
                else if (employee.id != id)
                {
                    Console.WriteLine("not matching id ");
                }
            }
        }

        static void fillAndSearchList(int employeeCount, int loopCount)
        {
            // Using the modern C# 12 syntax
            //List<Employee> employees = [];
            var employees = new List<Employee>();

            Console.WriteLine("start inserting in list ...");
            for (int i = 0; i < employeeCount; i++)
            {
                var id = i.ToString();
                employees.Add(new Employee(id));
            }

            Console.WriteLine("start searching in list ...");
            var random = new Random();
            for (int i = 0; i < loopCount; i++)
            {
                if (i % 1000 == 0)
                {
                    Console.WriteLine("i is $i");
                }
                var id = random.Next(employeeCount - 1).ToString();
                var found = false;
                foreach (var employee in employees)
                {
                    if (employee.id == id)
                    {
                        found = true;
                        break;
                    }
                }
                if (!found)
                {
                    Console.WriteLine("did not find employee with id=$id");
                }
            }
        }

    }
}