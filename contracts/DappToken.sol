  pragma solidity 0.5.16;


  contract DappToken  {
    //Constructor
    //Set the total number of tokens
    // read the total # of tokens
    //Name
    string public name = 'DApp Token';
    string public symbol = 'DApp';
    string public standard = 'DApp Token v1.0';
    uint256 public totalSupply;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
      );

    mapping(address => uint256) public balanceOf;

    constructor (uint256 _initialSupply) public {
      //msg.sender is the address call this function
        balanceOf[msg.sender]= _initialSupply;
        totalSupply = _initialSupply;
        //allocate the initial totalSupply

    }

    //transfer
    //exception if account does not have enough
    //return a boolean
    //transfer event
    //function funcname(type parameters ) public access modifier return (type return value)
    function transfer(address _to, uint256 _value) public returns(bool success ){

      require(balanceOf[msg.sender]>= _value);
      balanceOf[msg.sender ]-= _value;
      balanceOf[_to]+= _value;
      emit Transfer(msg.sender, _to,_value);
      return true;
    }
}
