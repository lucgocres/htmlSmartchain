// SPDX-License-Identifier: MIT
//Perfil Dueño Prototipo
pragma solidity ^0.8.11;

contract TokenWallet{
    address payable public duenio;
    mapping (address => uint)  public  Cursos  ;  //como un objeto en javascript pero las claves y los valores son del mismo tipo
                    //mapeado de ethereium addresses que nos contara el numero de donnuts(cursos?) que cada adress tiene


    constructor(){  //COnstructor solo se llama una vez durante todo el contrato, y es cuando el contrato es desplegado en el blockchain
         owner = payable(msg.sender);           //msg  variable global en todo nuestro programa
                                                //.sender nos da una direccion etherium (entidad o persona que esta desplegando este contrato
    }                                            // msg sera la direccion del gestor
                                                // a la hora de ejecutar tener en cuenta el perfil que se esta usando para saber si puede ver balance de tokens, retirarlos o aniadirlos
                                                //Tener en cuenta tambien la cantidad de gas que se tiene ya que en cada ejecuccion se gasta cierta cantidad al tratarse de un tipo de 
                                                //tarifa que se usa con cada transaccion en Etherium







    struct Alumno{                      //estructura de datos de los participantes de nuestra aplicacion aunque puede que no sean necesarias si tenemos acceso a diferentes BBDD
        string idUniversidad;
        string idAlumno;
        address walletAddress;
        string firstName;
        string lastName;
        uint amount;
       
    }      

    struct Profesor{
        string idProfesor;
        address walletAddress;
        string firstname;
        string lastName;
        uint amount;
      
    }

    struct Empresa{
        string idEmpresa;
        address walletAddress;
        string nombreEmpresa;
        uint aomunt;
    }

    Alumno[] public alumnos; 
    Profesor[] public profesor;   
    Empresa[] public empresa;                            

    receive() external payable{ }           // recibir fondos
                                            // es un tipo default que fue creado para recibir fondos
    
    function withdraw(uint _amount) external{
        require (msg.sender == duenio, "Solo el duenio puede acceder a este metodo");
        payable(msg.sender).transfer(_amount);  //Transfiere los fondos del smart contract al dueño (direccion del address)
                                                //cuidado msg.sender puede que no se refiera a al dueño
                                                // no hace falta hacer un check de si saca mas dinero del que tiene porque lo hace solo 
   
   
    }
    function getBalance() external view returns (uint){     //
    return address(this).balance;   // se refiere a la direccion del smart contract
                                    // .balance nos devuelve el balance, el numero de ethers(puede que sean Athens)
    }

    function restock(uint amount) public{
        require(msg.sender == duenio,"Solo el duenio puede reponer tokens en el sistema");   //la persona que despliega el contrato

    }
                    /*
    function precompra (uint amount) public payable{

    }
    
    function addAlumno (string idUniversidad, string memory idAlumno, address memory walletAddress, string firstName, string lastName,
        uint amount) public{ alumno.push(Alumno(
                                        walletAddress,
                                        firstName,
                                        lastName,
                                        amount
                               
                                                 ));

        }
        */
}