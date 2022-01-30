// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Dice {
  function getRandomNumber(uint number) public view returns(uint) {
    uint brosok = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, number))) % 10;
    brosok = brosok + 2;
    return (brosok);
  }
  function Winner() public view returns(string memory, uint) {
    uint player1 = getRandomNumber(0);
    uint player2 = getRandomNumber(1);
    if (player1 > player2) 
      return("Player 1 wins", player1);
    else if (player1 < player2)
      return("Player 2 wins", player2);
    else return("Draw", player1);
  }
}