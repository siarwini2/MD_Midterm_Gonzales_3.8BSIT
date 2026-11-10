
import 'dart:io';


// Reusable timestamp behavior


mixin TimestampMixin {
  DateTime createdAt = DateTime.now();

  String get formattedDate {
    return '${createdAt.month}/${createdAt.day}/${createdAt.year}';
  }
}

// ABSTRACT PARENT CLASS
abstract class CenterRecord with TimestampMixin {
  String _id;
  String _name;

  CenterRecord(this._id, this._name);

  String get id => _id;
  String get name => _name;

  set name(String newName) {
    if (newName.trim().isNotEmpty) {
      _name = newName.trim();
    }
  }

  String displayDetails();
}

// LEARNING RESOURCE
class LearningResource extends CenterRecord {
  String category;
  bool _isAvailable;

  LearningResource(
    String id,
    String title,
    this.category,
  )   : _isAvailable = true,
        super(id, title);

  bool get isAvailable => _isAvailable;

  void borrowResource() {
    if (_isAvailable) {
      _isAvailable = false;
      print('Resource borrowed successfully!');
    } else {
      print('Resource is already borrowed.');
    }
  }

  void returnResource() {
    if (!_isAvailable) {
      _isAvailable = true;
      print('Resource returned successfully!');
    } else {
      print('Resource is already available.');
    }
  }

  @override
  String displayDetails() {
    return 'Resource ID: $id\n'
        'Title: $name\n'
        'Category: $category\n'
        'Status: ${isAvailable ? "Available" : "Borrowed"}\n'
        'Date Added: $formattedDate';
  }
}


// PARTICIPANT
class Participant extends CenterRecord {
  String email;
  int transactions;

  Participant(
    String id,
    String name,
    this.email,
  )   : transactions = 0,
        super(id, name);

  void recordTransaction() {
    transactions++;
  }

  @override
  String displayDetails() {
    return 'Participant ID: $id\n'
        'Name: $name\n'
        'Email: $email\n'
        'Total Transactions: $transactions\n'
        'Date Registered: $formattedDate';
  }
}


// MAIN MANAGEMENT SYSTEM

class LearningCenter {
  final List<LearningResource> resources = [];
  final List<Participant> participants = [];

  // Maps for quick record retrieval
  final Map<String, LearningResource> resourceMap = {};
  final Map<String, Participant> participantMap = {};

  // Generate unique IDs
  int resourceCounter = 1;
  int participantCounter = 1;

 // ADD RESOURCE
  void addResource() {
    print('\n--- ADD LEARNING RESOURCE ---');

    String title = getValidInput('Enter resource title: ');
    String category = getValidInput('Enter resource category: ');

    String id = 'R${resourceCounter++}';

    LearningResource resource =
        LearningResource(id, title, category);

    resources.add(resource);
    resourceMap[id] = resource;

    print('\nResource added successfully!');
    print('Generated ID: $id');
  }

 // REGISTER PARTICIPANT
  void registerParticipant() {
    print('\n--- REGISTER PARTICIPANT ---');

    String name = getValidInput('Enter participant name: ');
    String email = getValidInput('Enter email address: ');

    if (!email.contains('@') || !email.contains('.')) {
      print('Invalid email address. Registration cancelled.');
      return;
    }

    String id = 'P${participantCounter++}';

    Participant participant = Participant(id, name, email);

    participants.add(participant);
    participantMap[id] = participant;

    print('\nParticipant registered successfully!');
    print('Generated ID: $id');
  }


  // BORROW RESOURCE
  void borrowResource() {
    print('\n--- BORROW RESOURCE ---');

    String participantId = getValidInput('Enter participant ID: ');
    String resourceId = getValidInput('Enter resource ID: ');

    Participant? participant = participantMap[participantId];
    LearningResource? resource = resourceMap[resourceId];

    if (participant == null) {
      print('Error: Participant not found.');
      return;
    }

    if (resource == null) {
      print('Error: Resource not found.');
      return;
    }

    if (!resource.isAvailable) {
      print('Error: Resource is already borrowed.');
      return;
    }

    resource.borrowResource();
    participant.recordTransaction();
  }


  // RETURN RESOURCE
  void returnResource() {
    print('\n--- RETURN RESOURCE ---');

    String resourceId = getValidInput('Enter resource ID: ');

    LearningResource? resource = resourceMap[resourceId];

    if (resource == null) {
      print('Error: Resource not found.');
      return;
    }

    resource.returnResource();
  }


 // DISPLAY ALL RECORDS
  void viewRecords() {
    print('\n========== CENTER RECORDS ==========');

    // Both subclasses use CenterRecord
    List<CenterRecord> allRecords = [
      ...resources,
      ...participants,
    ];

    if (allRecords.isEmpty) {
      print('No records available.');
      return;
    }

    for (CenterRecord record in allRecords) {
      print('\n--------------------------------');
      print(record.displayDetails());
    }

    print('\nTotal Resources: ${resources.length}');
    print('Total Participants: ${participants.length}');
  }


 // SEARCH RESOURCE USING MAP
  void searchResource() {
    print('\n--- SEARCH RESOURCE ---');

    String id = getValidInput('Enter resource ID: ');

    LearningResource? resource = resourceMap[id];

    if (resource == null) {
      print('Resource not found.');
    } else {
      print('\n${resource.displayDetails()}');
    }
  }

  
 // INPUT VALIDATION
  String getValidInput(String prompt) {
    while (true) {
      stdout.write(prompt);

      String? input = stdin.readLineSync();

      if (input == null || input.trim().isEmpty) {
        print('Input cannot be empty. Please try again.');
      } else {
        return input.trim();
      }
    }
  }


// MENU
  void start() {
    bool running = true;

    while (running) {
      print('\n====================================');
      print(' COMMUNITY LEARNING CENTER SYSTEM');
      print('====================================');
      print('1. Add Learning Resource');
      print('2. Register Participant');
      print('3. Borrow Resource');
      print('4. Return Resource');
      print('5. View All Records');
      print('6. Search Resource');
      print('7. Exit');
      print('====================================');

      stdout.write('Enter your choice (1-7): ');

      String? choice = stdin.readLineSync();

      if (choice == null || choice.trim().isEmpty) {
        print('Invalid input. Please enter a menu number.');
        continue;
      }

      try {
        int selectedChoice = int.parse(choice.trim());

        switch (selectedChoice) {
          case 1:
            addResource();
            break;

          case 2:
            registerParticipant();
            break;

          case 3:
            borrowResource();
            break;

          case 4:
            returnResource();
            break;

          case 5:
            viewRecords();
            break;

          case 6:
            searchResource();
            break;

          case 7:
            running = false;
            print('\nThank you for using the system!');
            print('Goodbye!');
            break;

          default:
            print('Invalid choice. Please select from 1 to 7.');
        }
      } catch (e) {
        print('Invalid input. Please enter a valid number.');
      }
    }
  }
}


// MAIN
void main() {
  LearningCenter center = LearningCenter();

  print('Welcome to the Community Learning Center!');

  center.start();
}
