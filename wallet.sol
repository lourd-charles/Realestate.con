//SPDX-License-Identifier: MIT

pragma solidity 0.8.1;

contract wallet{
    
    address public owner;
    mapping(address => uint) public balance;

constructor() {
    owner = msg.sender;
}



function deposit() public payable{
    require(msg.value > 0, "input a figure greater than zero");
    balance[msg.sender] += msg.value;
    
    }

function withdral(uint _amouth) public {
    require(msg.sender == owner, "You aren't the owner");
    require(balance[msg.sender] >= _amouth, "insufficient fund");
    payable(msg.sender).transfer(_amouth);
    balance[msg.sender] -= _amouth;

}



}