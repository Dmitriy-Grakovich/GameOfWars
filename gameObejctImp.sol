
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "gameObejct.sol";

// This is class that describes you smart contract.
abstract contract gameObejctImp is gameObejct {
      
    //здоровье
    uint public health = 10;
    // сила щита
    uint public protection = 2;
    // адрес нападоющего
    address public addressenemy;

    constructor() public {
  
        tvm.accept();
    }

    modifier checkOwnerAndAccept {
		tvm.accept();
		_;
	}

    // принять атаку определить жив ли и подсчет здлровья
   function addAtaca(uint value) public override checkOwnerAndAccept{
        addressenemy = msg.sender;
        uint atacer = value - protection;
        if(health > atacer){
        health = health - atacer;
        } else {
            health = 0;
        }
        if(health == 0){
            processingdeath();
        }
    }
    
    // получить силу защиты
    function addProtection(uint pow) public virtual;

    // проверка на смерть
    function death(uint volue) private checkOwnerAndAccept {
        if(health > volue){
        health = health - volue;
        } else {
            health = 0;
        }
    }

    //обработка гибели
    function processingdeath() public virtual checkOwnerAndAccept {
        sendValue(addressenemy);
    }

    //отправка всех денег атакующему и уничтожение.
    function sendValue(address dest) public view checkOwnerAndAccept{
        dest.transfer(0, true, 160);
    }
}
