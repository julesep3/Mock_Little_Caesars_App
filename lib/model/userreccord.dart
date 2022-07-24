enum PhysicalLimitation {
  Visually_Impaired,
  Reach_Restriction,
}

enum TermAgreements {
  Terms_Of_Service,
  Receive_Commercial_Offers,
}

class UserRecord {
  late String email;
  late String password;
  late String firstName;
  late String lastName;
  late String phone;
  late Map<PhysicalLimitation, bool> physicalLimitations;
  late Map<TermAgreements, bool> termAgreements;

  // constructor
  UserRecord({
    this.email = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.phone = '',
  }) {
    physicalLimitations = {};
    PhysicalLimitation.values.forEach((e) => physicalLimitations[e] = false);
    termAgreements = {};
    TermAgreements.values.forEach((e) => termAgreements[e] = false);
  }

  UserRecord clone() {
    var copy = UserRecord(
      email: this.email,
      password: this.password,
      firstName: this.firstName,
      lastName: this.lastName,
      phone: this.phone,
    );
    copy.physicalLimitations = {...this.physicalLimitations};
    copy.termAgreements = {...this.termAgreements};
    return copy;
  }

  void copyFrom(UserRecord obj) {
    this.email = obj.email;
    this.password = obj.password;
    this.firstName = obj.firstName;
    this.lastName = obj.lastName;
    this.phone = obj.phone;
    this.physicalLimitations = {...obj.physicalLimitations};
    this.termAgreements = {...obj.termAgreements};
  }

  void addToDB(UserRecord obj) {
    fakeDB.add(obj);
  }

  static List<UserRecord> fakeDB = [];

  @override
  String toString() {
    return 'UserRecord[email=$email password=$password firstName=$firstName lastName=$lastName phone=$phone physicalLimitations=$physicalLimitations termAgreements=$termAgreements]';
  }
}
