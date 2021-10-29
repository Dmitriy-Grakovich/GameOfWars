/**
 * This file was generated by TONDev.
 * TONDev is a part of TON OS (see http://ton.dev).
 */
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import 'gameObejctImp.sol';
import 'basestation.sol';

//Контракт "Военный юнит" (Родитель "Игровой объект")
contract warunit is gameObejctImp {

    uint addressbasess;
    basestation basa;
    uint atac;

  // конструктор принимает "Базовая станция" и вызывает метод "Базовой Станции" 
  //"Добавить военный юнит" а у себя сохраняет адрес "Базовой станции"
    constructor (basestation base) public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        base.addunit(msg.pubkey());
        basa = base;
        //addressbasess = base.getAddres();
    }


    //- атаковать (принимает ИИО [его адрес])
    function ataca(uint addres) public checkOwnerAndAccept{
        
    }
//- получить силу атаки
    function ataclevel(uint value) public virtual checkOwnerAndAccept{
        atac = atac + value;
    }

///- получить силу защиты
    function addProtection(uint pow) public virtual override checkOwnerAndAccept{
        health = health + pow;
    }
//- обработка гибели [вызов метода самоуничтожения + убрать военный юнит из базовой станции]

    function processingdeath() public override checkOwnerAndAccept{
        
        sendValue(address(addressenemy), 0, true);
        basa.deleteunit(msg.pubkey());
        
    }
//- смерть из-за базы (проверяет, что вызов от родной базовой станции только будет работать) [вызов метода самоуничтожения]
    function deathisbase() public checkOwnerAndAccept{
        
    }
}