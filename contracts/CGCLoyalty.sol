// solium-disable linebreak-style
pragma solidity ^0.5.16;
contract CGCLoyalty { 
    address public owner;
    struct buyerspec {
        uint lpoints;
        address buyerAdd;
        uint bal; 
    }
    mapping ( address=> buyerspec) points;
    
    function buy(address buy1, uint amt, uint no) public  {
        if (amt > points[buy1].bal && amt == 2 * no) revert();
        points[buy1].buyerAdd = buy1;
        points[buy1].bal -= amt;
        points[buy1].lpoints += no*2;
       
    }
    function showLppints(address buy1) public view  returns (uint) {
        return points[buy1].lpoints;
    }
    function addBalance(address buy1, uint amt) public  {
        if(amt>0){
            points[buy1].bal += amt;
        }
        else{
            revert();
        }
    }

    function lpointstoAmt(address buy1) public {
        uint rem = (points[buy1].lpoints) % 5;
        points[buy1].bal += (points[buy1].lpoints)/5;
        points[buy1].lpoints = rem;
    }
    constructor () public{
        owner = msg.sender;
        
    }
    function getBalance(address buy1)  public view   returns (uint){
        return (points[buy1].bal);
    }
}