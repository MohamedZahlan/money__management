abstract class MoneyStates {}

class MoneyInitialState extends MoneyStates {}

class MoneyCreateDataBaseSuccessState extends MoneyStates {}

class MoneyCreateTableErrorState extends MoneyStates {}

class MoneyInsertSuccessToDataBaseState extends MoneyStates {}

class MoneyInsertErrorToDataBaseState extends MoneyStates {}

class MoneyUpdateDataBaseSuccessState extends MoneyStates {}

class MoneyUpdateDataBaseErrorState extends MoneyStates {}

class MoneyGetTransactionSuccessState extends MoneyStates {}

class MoneyDeleteSuccessFromDataBaseState extends MoneyStates {}
