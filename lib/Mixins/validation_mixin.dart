mixin ValidationMixin{

  bool isFieldEmpty(String fieldValue) => fieldValue.isEmpty;

  bool isNumberValid(String num){

    if(num.isEmpty){
      return false;
    }else if (num.length< 10){
      return false;
    }
    return true;
  }

  bool isAmountValid(String amount){

    if(amount.isEmpty){
      return false;
    }else if (int.parse(amount)<= 0){
      return false;
    }
    return true;
  }

}