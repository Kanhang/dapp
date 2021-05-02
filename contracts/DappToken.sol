  pragma solidity 0.5.16;


  contract DappToken  {
    //Constructor
    //Set the total number of tokens
    // read the total # of tokens
    uint256 public totalSupply;

    constructor ( ) public {
        totalSupply = 1000000;
    }
}
