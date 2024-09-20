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
