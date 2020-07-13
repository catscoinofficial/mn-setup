# MasternodeSetup

### Required:

1. Catscoin for Collateral <br>
(You can buy CATS from exchange for collateral) <br>
***•https://graviex.net/markets/catsbtc <br>
•https://www.unnamed.exchange/Exchange/Basic?market=CATS_BTC <br>***

2. Download your Local Wallet: https://github.com/catscoinofficial/cats/releases

- You can see daily income and collateral info here: https://masternodes.online/currencies/CATS/


3. You will need also VPS with Ubuntu 16.04 or 18.04

### Usage

1. After you longin on your VPS , with this command you will download masternode-installer.   
`wget https://raw.githubusercontent.com/catscoinofficial/mn-setup/master/masternode-install-ubuntu-16.04.sh`  
- For Ubuntu 18.04 + use this one command   
`wget https://raw.githubusercontent.com/catscoinofficial/mn-setup/master/masternode-install-ubuntu-18.04.sh` 

2. With this command you will make masternode-install.sh executable.  
`sudo chmod +x masternode-install-ubuntu-16.04.sh` <br>

- For Ubuntu 18.04+ use this: <br>
`sudo chmod +x masternode-install-ubuntu-18.04.sh` <br>

3. Now install your masternode.  
`./masternode-install-ubuntu-16.04.sh`

- For Ubuntu 18.04+ use this to install masternode: <br>
`./masternode-install-ubuntu-18.04.sh`




Send the collateral
Open your wallet and wait until your wallet has downloaded the blockchain.

Go to “Tools”.
Click “Debug console”.
This is the console where you will execute all commands.

Create a new masternode private key.

```
createmasternodekey
```

Example output

7VatfYVk5fFMTymPDhgSURAESDACJhWpd89WHGoh35d9fbLQPj5

Show your collateral address.
```
getaccountaddress "MN1"
```

Example output

CDC99hZmSmYEcBu4WcxA2TCT6KBqHB6Hos
```
Transfer the required amount of coins to the “collateral address” that you created using the command “getaccountaddress "MN1"”.
```
Wait until the transaction has the required masternode confirmations.

Go to “Tools”.
Click “Debug console”.
Enter the following command.
```
getmasternodeoutputs
```
```
Example output


[
  {
    "txhash": "506a242ccbfd2555bcd9cff5f4041752c911f39cb2905acc83ccfe0cf8808df9",
    "outputidx": 1
  }
]
```

Modify the following line in your masternode.conf file and paste it into:
```
MN1 VPSIP:22878 7VatfYVk5fFMTymPDhgSURAESDACJhWpd89WHGoh35d9fbLQPj5 506a242ccbfd2555bcd9cff5f4041752c911f39cb2905acc83ccfe0cf8808df9 1
```
MN1 - Alias for your masternode.

VPSIP- External IP address of your VPS.

22878 - The port for Catscoin

7VatfYVk5fFMTymPDhgSURAESDACJhWpd89WHGoh35d9fbLQPj5 - Masternode private key from the command “createmasternodekey”.

506a242ccbfd2555bcd9cff5f4041752c911f39cb2905acc83ccfe0cf8808df9 - Value “txhash” from the command “getmasternodeoutputs”.

1 - Value “outputidx” from the command “getmasternodeoutputs”.


Save the file and close.

Close your wallet.

Restart your wallet! 
On Masternode tab in your wallet - Start the masternode! 

