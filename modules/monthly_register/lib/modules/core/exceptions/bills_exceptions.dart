abstract class BillException implements Exception {}

class BillNotFoundException extends BillException {}

class BillsNotFoundException extends BillException {}

class BillIdNotFoundException extends BillException {}
