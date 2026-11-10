**Midterm Laboratory Examination
Dart Programming Fundamentals (Object-Oriented Programming)**

Gonzales, Arwin H.
3.8 BSIT

**Application Title**
Community Learning Center Management System

**About**
The Community Learning Center Management System is a Dart
console-based application designed to manage learning
resources and participants.

The application allows users to add learning resources,
register participants, borrow and return resources, search
for resources, and view all registered records.

**Implemented Features**
1. Add Learning Resources
   - Register learning resources with a title and category.
   - Automatically generate resource IDs.

2. Register Participants
   - Register participants with their name and email.
   - Automatically generate participant IDs.
   - Validate email addresses.

3. Borrow Learning Resources
   - Allow registered participants to borrow available resources.
   - Prevent borrowing of unavailable resources.
   - Record participant transactions.

4. Return Learning Resources
   - Allow borrowed resources to be returned.
   - Update resource availability status.

5. View All Records
   - Display all registered resources and participants.
   - Show resource and participant information.

6. Search Resources
   - Search for learning resources using their IDs.

7. Input Validation and Error Handling
   - Handle empty or missing inputs.
   - Handle invalid menu selections.
   - Display appropriate error messages.


Object-Oriented Programming Concepts

The application implements the following concepts:

- Classes and Objects
- Constructors
- Encapsulation
- Inheritance
- Polymorphism
- Abstract Classes
- Method Overriding
- Mixins


Data Structures

- Lists: Store learning resources and participants.
- Maps: Retrieve resources and participants using their IDs.
----------------------------------------------------------------------------------------------
**Instructions for using this program**
1. Open or create a Dart program
2. Copy the source code from main.dart
3. Paste the code into the editor
4. Click the Run button

----------------------------------------------------------------------------------------------
**Example Scenario**
**Adding resources material and Register a participant**

Welcome to the Community Learning Center!

====================================
 COMMUNITY LEARNING CENTER SYSTEM
====================================
1. Add Learning Resource
2. Register Participant
3. Borrow Resource
4. Return Resource
5. View All Records
6. Search Resource
7. Exit
====================================
Enter your choice (1-7): 1

--- ADD LEARNING RESOURCE ---
Enter resource title: Programming Dart
Enter resource category: Programming Language

Resource added successfully!
Generated ID: R1

====================================
 COMMUNITY LEARNING CENTER SYSTEM
====================================
1. Add Learning Resource
2. Register Participant
3. Borrow Resource
4. Return Resource
5. View All Records
6. Search Resource
7. Exit
====================================
Enter your choice (1-7): 2

--- REGISTER PARTICIPANT ---
Enter participant name: Arwin Gonzales
Enter email address: arwingonzales@gmail.com

Participant registered successfully!
Generated ID: P1

**Example 2: Borrowing a resource**
====================================
 COMMUNITY LEARNING CENTER SYSTEM
====================================
1. Add Learning Resource
2. Register Participant
3. Borrow Resource
4. Return Resource
5. View All Records
6. Search Resource
7. Exit
====================================
Enter your choice (1-7): 3

--- BORROW RESOURCE ---
Enter participant ID: P1
Enter resource ID: R1
Resource borrowed successfully!

====================================
 COMMUNITY LEARNING CENTER SYSTEM
====================================
1. Add Learning Resource
2. Register Participant
3. Borrow Resource
4. Return Resource
5. View All Records
6. Search Resource
7. Exit
====================================
Enter your choice (1-7): 3

--- BORROW RESOURCE ---
Enter participant ID: P2
Enter resource ID: R1
Error: Resource is already borrowed.

**Example 3: Invalid Inputs**
====================================
 COMMUNITY LEARNING CENTER SYSTEM
====================================
1. Add Learning Resource
2. Register Participant
3. Borrow Resource
4. Return Resource
5. View All Records
6. Search Resource
7. Exit
====================================
Enter your choice (1-7): 10
Invalid choice. Please select from 1 to 7.

====================================
 COMMUNITY LEARNING CENTER SYSTEM
====================================
1. Add Learning Resource
2. Register Participant
3. Borrow Resource
4. Return Resource
5. View All Records
6. Search Resource
7. Exit
====================================
Enter your choice (1-7): 3

--- BORROW RESOURCE ---
Enter participant ID: P2
Enter resource ID: R1
Error: Resource is already borrowed.
