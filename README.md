

The VPS needs 1gb memory 
5gb hard disk 
### For Ubuntu-18.04

<table>
<tr><td>Required:</td></tr>
<tr><td>1. enough Catscoin for the masternode </td></tr>
<tr><td>2. Local Wallet: https://github.com/catscoinofficial/cats/releases/tag/v1.0.0</td></tr>
<tr><td>3. VPS with Ubuntu 18.04</td></tr>
</table>


VPS Commands:

```
wget https://raw.githubusercontent.com/catscoinofficial/mn-setup/master/catscoin-mninstall-1804.sh
```

```
sudo chmod +x catscoin-mninstall-1804.sh
```

```
./catscoin-mninstall-1804.sh
```



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

