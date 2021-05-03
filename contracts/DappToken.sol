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

    //indexed tells the following input to be logged
    event Approve(
      address indexed _owner,
      address indexed _spender,
      uint256 _value
      );

    event Allowance(
      address indexed _owner,
      address indexed _spender
      );
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256 )) public allowance;


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
    function approve(address _spender, uint256 _value) public returns (bool success){
        //allowance
        //approve event
      allowance[msg.sender][_spender]=_value;　//from account approves spender with an allowance amount
      emit Approve(msg.sender, _spender, _value);
      return true;
    }
    //this function is always called by spender , spender acts like a third party because it needs controls allowance
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success){
      require(_value <= balanceOf[_from]);
      //require _from has enough token
      require(_value<=allowance[_from][msg.sender]);
      //require allowance is enough
      balanceOf[_from] -= _value;
      balanceOf[_to] += _value;
      allowance[_from][msg.sender] -= _value; // spender calls this function to minus the allowance amount
      emit Transfer(_from, _to, _value);
      return true;
      //change the balance
      //update allowance
      //transfer evnet
      //return a boolean
    }

}
