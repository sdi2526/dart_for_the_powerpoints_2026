import json
from employee import Employee

# code was taken from https://chatgpt.com/share/698226a9-d65c-8003-8528-ca6948e073cc

# A simple Python object (must contain JSON-serializable types)
# data = {
#     "name": "Alice",
#     "age": 30,
#     "skills": ["python", "sql"]
# }

# --- Serialize (save to file) ---
# with "data = Employee(123)" next line brought "Object of type Employee is not JSON serializable"
# with open("test.json", "w", encoding="utf-8") as f:
#     json.dump(data, f)

# # --- Deserialize (load from file) ---
# with open("test.json", "r", encoding="utf-8") as f:
#     loaded_data = json.load(f)
# print(loaded_data)

emp = Employee(123)

# Serialize
with open("test.json", "w") as f:
    json.dump(emp.to_dict(), f, indent=2)

# Deserialize
with open("test.json", "r") as f:
    data = json.load(f)

emp2 = Employee.from_dict(data)
print(emp2)