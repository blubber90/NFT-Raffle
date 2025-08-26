pragma solidity ^0.8.28;

contract Raffle{

address owner;
uint prizePool;
uint ticketPrice = 1 ether;
uint fee = 5;   // percent of eth not added to prizePool

    constructor() {
        owner = msg.sender;
    }

    function buyTickets() external payable {
        // Take ETH in multiples of ticketPrice
        // Add eth - fee to prizePool
        // Send NFTs
        require(msg.value > 0, "No ETH was received");
        require(msg.value % ticketPrice == 0, "Must be a multiple of ticketPrice");

        uint ticketsToVend = msg.value / ticketPrice;
        uint feeAmount = (msg.value * fee) / 100;
        uint toAddToPool = msg.value - feeAmount;
        prizePool += toAddToPool;

        // Send fee to owner
        payable(owner).transfer(feeAmount);

        for (uint i = 0; i < ticketsToVend; i++) {
            ticketNFT.mint(msg.sender);
        }
    } 


}