import random
from employee import Employee

def fillAndSearchList(employeeCount, loopCount):
    employees = []
    print("start inserting in list...")
    for i in range(employeeCount):
        employees.append(Employee(str(i)))

    print("start searching in list ...")
    for i in range(loopCount):
        if (i % 1000 == 0):
            print(f"i is {i}")

        id = random.randint(0, employeeCount - 1)
        found = False
        for employee in employees:
            if (employee.id == str(id)):
                found = True
                break

        if (not found):
            print("did not find employee with id=$id");

def fillAndSearchDictionary(employeeCount, loopCount):
    employees = {}
    print("start inserting in dictionary...")
    for i in range(employeeCount):
        id = str(i)
        employees[id] = Employee(id)

    print("start searching in dictionary ...")
    for i in range(loopCount):
        if (i % 1000 == 0):
            print(f"i is {i}")

        id = str(random.randint(0, employeeCount - 1))
        employee = employees[id]
        if (employee.id != id):
            print(f"not matching id {id}")


fillAndSearchDictionary(100000, 10000)
#input("press any key to continue")
fillAndSearchList(100000, 10000)

#gs = Employee()  #runtime error: missing 1 required positional argument: 'id'
gs = Employee(123)
print(gs.name)
print(gs.hoursPerWeek)
print(gs.salary)
employees = {gs.id: gs, 234: Employee(234)}
print(len(employees))

