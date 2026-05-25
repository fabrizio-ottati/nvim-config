// TableGen sample
class Greeting<string name> {
  string Name = name;
  string Message = "Hello, " # name;
}

def WorldGreeting : Greeting<"world">;
