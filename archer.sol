
/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import 'warunit.sol';

// This is class that describes you smart contract.
contract archer is warunit {

    constructor(basestation addr) warunit (addr) public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        
    }

     //получить атаку
    function ataclevel(uint value) public override checkOwnerAndAccept{
        atac = atac + value;
    }

    //- получить силу защиты
    function addProtection(uint pow) public  override checkOwnerAndAccept{
        protection = protection + pow;
    }
    
}
