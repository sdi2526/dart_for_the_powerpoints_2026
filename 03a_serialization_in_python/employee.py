class Employee:
    # The __init__ method is the constructor
    def __init__(self, id):
        self.id = id    # Instance attribute
        self.name = "unknown"  
        self.hoursPerWeek = 40
        self.salary = 1234

# --- the rest was copied from https://chatgpt.com/share/698226a9-d65c-8003-8528-ca6948e073cc

    def to_dict(self):
        return {
            "id": self.id,
            "name": self.name,
            "hoursPerWeek": self.hoursPerWeek,
            "salary": self.salary,
        }

    @classmethod
    def from_dict(cls, data):
        emp = cls(data["id"])
        emp.name = data["name"]
        emp.hoursPerWeek = data["hoursPerWeek"]
        emp.salary = data["salary"]
        return emp


#--- with dataclass (tip from https://chatgpt.com/share/698226a9-d65c-8003-8528-ca6948e073cc)

# from dataclasses import dataclass, asdict

# @dataclass
# class Employee:
#     id: int
#     name: str = "unknown"
#     hoursPerWeek: int = 40
#     salary: int = 1234

# then in main:
# json.dump(asdict(emp), f, indent=2)
# emp = Employee(**json.load(f))