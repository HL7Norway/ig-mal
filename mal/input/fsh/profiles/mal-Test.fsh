// Define a profile
Profile: MyPatientProfile
Parent: Patient
Description: "A custom profile for Patient resource."
* name 1..1
* name.family MS
* gender from http://hl7.org/fhir/ValueSet/administrative-gender (required)
* birthDate 1..1
* address 0..* MS
* address.city MS
* telecom where(system = 'phone') 1..1

// Define an extension
Extension: MyExtension
Description: "An example extension."
* value[x] only string
* valueString MS

// Define a value set
ValueSet: MyValueSet
Description: "A custom value set."
* #code1 "Code 1"
* #code2 "Code 2"
* #code3 "Code 3"

// Define a code system
CodeSystem: MyCodeSystem
Description: "A custom code system."
* #code1 "Code 1"
* #code2 "Code 2"
* #code3 "Code 3"

// Define an instance of a Patient
Instance: ExamplePatient
InstanceOf: Patient
Description: "An example Patient instance."
* id = "example-patient"
* name[0].family = "Doe"
* name[0].given[0] = "John"
* gender = #male
* birthDate = "1980-01-01"
* address[0].city = "Example City"

// Define an instance of an Observation
Instance: ExampleObservation
InstanceOf: Observation
Description: "An example Observation instance."
* id = "example-observation"
* status = #final
* code = #exampleCode "Example Code" from MyCodeSystem
* subject = Reference(ExamplePatient)
* valueString = "This is a test observation."

// Define a logical model
Logical: MyLogicalModel
Description: "An example logical model."
* element[0].path = "MyLogicalModel.exampleElement"
* element[0].min = 1
* element[0].max = "1"
* element[0].type[0].code = "string"
