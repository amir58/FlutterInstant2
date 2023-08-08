void main() {
  printMyName();

  print(getMyName());

  printWelcomeMessage("Ali");
  printWelcomeMessage("Ahmed");

  print(getWelcomeMessage("Mahmoud"));

  print(sum(10, 5));
  print(sum(10, 50));

  dpr("Zaki");
  dpo();
  dpo("Ali");

  // To show function parameters => ctrl + p
  enterYourName("Amir");
  enterYourName("Amir", "Mohammed");

  npr(name: "Ali");
  npo();
  npo(name: "Hossam");

  enterYourName("Amir");
  enterYourName("Amir", "Mohammed");

  enterYourName2(firstName: "Amir");
  enterYourName2(firstName: "Amir", lastName: "Mohammed");

  enterYourName3("Amir");
  enterYourName3("Amir", lastName: "Mohammed");
}

// DataType functionName ( parameters ){ functionBody }
// DataTypes => void OR String, int, double, bool, List, Map, etc...
// functionName => camelCase
// functionName => start with verb => print, get, save, add, is
// parameters => variables ( optional )
// functionBody => write you function code

void printMyName() {
  print('Amir');
}

void printMyName2() => print('Amir');

String getMyName() {
  return "Amir";
}

String getMyName2() => "Amir";

void printWelcomeMessage(String name) {
  print('Welcome Mr. $name');
}

String getWelcomeMessage(String name) {
  return 'Welcome Mr. $name';
}

double sum(double numberOne, double numberTwo) {
  return numberOne + numberTwo;
}

double sum2(double numberOne, double numberTwo) => numberOne + numberTwo;

double sum3(double numberOne, double numberTwo) {
  double result = numberOne + numberTwo;
  return result;
}

// Parameters
// Default Parameter  => required, optional
// Named   Parameter  => required, optional

// Default Parameter required

void dpr(String name) {
  print(name);
}

// Default Parameter optional [ ]

void dpo([String name = "No Name"]) {
  print(name);
}

// Default Parameter required + Default Parameter optional [ ]
void enterYourName(String firstName, [String lastName = ""]) {
  print("Welcome Mr. $firstName $lastName");
}

// Named Parameter required { }
void npr({required String name}) {
  print(name);
}

// Named Parameter optional { }
void npo({String name = "No Name"}) {
  print(name);
}

// Named Parameter required + Named Parameter optional { }
void enterYourName2({required String firstName, String lastName = ""}) {
  print("Welcome Mr. $firstName $lastName");
}

// Default Parameter required + Named Parameter optional { }
void enterYourName3(String firstName, {String lastName = ""}) {
  print("Welcome Mr. $firstName $lastName");
}
