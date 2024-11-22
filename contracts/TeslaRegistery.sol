// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract TeslaRegistery {
    struct Tesla {
        string model;
        uint year;
        string color;
        uint mileage;
        string vin;
    }
    Tesla[] public teslas;

    function addTesla(string memory model, uint year,string memory color,uint mileage,string memory vin) public {
        Tesla memory newTesla = Tesla({
            model:model,
            year:year,
            color:color,
            mileage: mileage,
            vin: vin
        });
        teslas.push(newTesla);
    }
}