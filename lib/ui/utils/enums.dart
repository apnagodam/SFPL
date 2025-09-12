enum RegistrationType {
  defaultType('Select Product Type', 0),
  commodityFinance('Commodity Finance', 1),
  bnpl('BNPL', 2);

  const RegistrationType(this.label, this.type);

  final String label;
  final int type;
}

enum ConstitutionType {
  defaultType('Select Constitution Type', 0),
  individual('Individual', 1),
  proprietorship('Proprietorship ', 2),
  partnership('Partnership ', 3),
  company('Company ', 4);

  const ConstitutionType(this.label, this.type);

  final String label;
  final int type;
}

enum BnplLimitType {
  defaultType('Select application type', ""),
  addition('Addition', "addition"),
  deletion('Deletion ', "deletion");

  const BnplLimitType(this.label, this.type);

  final String label;
  final String type;
}

enum LoanType {
  freshLoan('Fresh Loan', "Fresh Loan"),
  renewable('Renewal ', "Renewal"),
  renewalCumEnahancement('Renewal Cum Enhancement ', "Renewal Cum Enhancement"),
  reductionInLimit('Reduction In Limit ', "Reduction In Limit"),
  closure('Closure ', "Closure");

  const LoanType(this.label, this.type);

  final String label;
  final String type;
}

enum PartPaymentType {
  part('Part Payment', "2"),
  full('Full payment ', "1");

  const PartPaymentType(this.label, this.type);

  final String label;
  final String type;
}

enum LTVType {
  aboveZero('Above Zero'),
  belowZero("Below Zero");

  const LTVType(this.label);

  final String label;
}

enum SchemeType {
  self('Self', 1),
  guarantor('Guarantor ', 2);

  const SchemeType(this.label, this.type);

  final String label;
  final int type;
}
