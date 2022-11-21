// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.16;

contract BankContract
{
    struct Client
    {
        uint cust_id;
        uint balance;
    }
    Client[5] c;
    uint cnt = 1;
    constructor()
    {
        for(uint i=0;i<5;i++)
        {
            c[i].cust_id = cnt;
            cnt += 1;
            c[i].balance = 1000;
        }
    }

    function getBalance(uint id) public view returns(uint)
    {
        /* Calling a revert statement implies an exception is thrown, 
        the unused gas is returned and the state reverts to its original state. */
        if(id > cnt)
            revert("Invalid CUST ID");
        else
        {
            for(uint i=0;i<5;i++)
            {
                if(c[i].cust_id == id)
                    return (c[i].balance); 
            }   
        }      
    }
    function withdraw(uint id,uint amt) public
    {
        if(id > cnt)
            revert("Invalid CUST ID");
        for(uint i=0;i<5;i++)
        {
            if(id == c[i].cust_id)
            {
                if(amt < c[i].balance)
                    c[i].balance -= amt;
                else
                    revert("INSUFFICIENT BALANCE");
            }
        }
    }
    function deposit(uint id,uint amt) public
    {
        if(id > cnt)
            revert("Invalid CUST ID");
        for(uint i=0;i<5;i++)
        {
            if(c[i].cust_id == id)
                c[i].balance += amt;
        }
    }
}


