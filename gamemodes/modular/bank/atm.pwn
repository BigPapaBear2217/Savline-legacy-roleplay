#include <YSI_Coding\y_hooks>

hook OnGameModeInit(){
    LoadATMObjects(); // Galax

    for(new i=0; i<MAX_ATM; i++){
        atmInfo[i][State] = 0;
    }
    return 1;
}

forward IsPlayerAtATM(playerid);
public IsPlayerAtATM(playerid){
    new Float:atmx, Float:atmy, Float:atmz;
    for(new i=0; i<MAX_ATM; i++){
        GetDynamicObjectPos(atmInfo[i][Object], atmx, atmy, atmz);
        if(IsPlayerInRangeOfPoint(playerid, 2.0, atmx, atmy, atmz)){
            return i;
        }
    }
    return -1;
}

CMD:atm(playerid){
    if(IsPlayerAtATM(playerid) != -1){
        if(atmInfo[IsPlayerAtATM(playerid)][State] == 0){
            new string[128];
            // new create_acc_case = 0; // FOR /bank
            new select_pbankslot = -1;
            new transfer_bankid = -1;
            format(string, sizeof(string), "Account ID\t Money\n");
            for(new i=0;i<MAX_PLAYER_BANK_ACC; i++){
                if(pBankInfo[playerid][i][pBankID] > 0){
                    new string2[32];
                    format(string2, sizeof(string2), "#%d\t$%d\n", pBankInfo[playerid][i][pBankID], pBankInfo[playerid][i][pBankAmount]);
                    strcat(string, string2);
                    // create_acc_case++;
                }
            }
            // if(GetPlayerMaxBankAcc(playerid) < 3){ // FOR /bank
            //     new string3[30];
            //     format(string3, sizeof(string3), "{2aeb2d}Create New Account");
            //     strcat(string, string3);
            // }

            inline const BankTransferDialog(pid, dialogid, response, listitem, string:inputtext[]){
                #pragma unused pid, dialogid, listitem
                if(response){
                    if(sscanf(inputtext, "d", transfer_bankid)) return SendClientMessage(playerid, COLOR_ERROR, "The input you have entered is invalid. Please try again.");
                    else if(transfer_bankid <= 0) return SendClientMessage(playerid, COLOR_ERROR, "The account ID you've entered is invalid. Please try again.");

                    new query[128];
                    mysql_format(handle, query, sizeof(query), "SELECT * FROM bank WHERE Bank_ID = %d;", transfer_bankid);
                    mysql_tquery(handle, query, "TransferMoneyToBankID", "ddd", playerid, select_pbankslot, transfer_bankid);
                }
            }

            inline const BankDepositDialog(pid, dialogid, response, listitem, string:inputtext[]){
                #pragma unused pid, dialogid, listitem
                if(response){
                    new deposit_amount;
                    if(sscanf(inputtext, "d", deposit_amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you have entered is invalid. Please try again.");
                    else if(deposit_amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount to deposit.");
                    else if(deposit_amount > GetPlayerMoney(playerid)) return SendClientMessage(playerid, COLOR_ERROR, "You don't have that much money on hand.");
                    pBankInfo[playerid][select_pbankslot][pBankAmount] += deposit_amount;
                    GivePlayerMoney(playerid, -deposit_amount);
                    SendClientMessageEx(playerid, COLOR_BLUE, "You have deposited $%d to account #%d.", deposit_amount, pBankInfo[playerid][select_pbankslot][pBankID]);
                }
            }

            inline const BankWithdrawDialog(pid, dialogid, response, listitem, string:inputtext[]){
                #pragma unused pid, dialogid, listitem
                if(response){
                    new withdraw_amount;
                    if(sscanf(inputtext, "d", withdraw_amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you have entered is invalid. Please try again.");
                    else if(withdraw_amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount to withdrawl.");
                    else if(withdraw_amount > pBankInfo[playerid][select_pbankslot][pBankAmount]) return SendClientMessage(playerid, COLOR_ERROR, "You don't have that much money on hand.");
                    pBankInfo[playerid][select_pbankslot][pBankAmount] -= withdraw_amount;
                    GivePlayerMoney(playerid, withdraw_amount);
                    SendClientMessageEx(playerid, COLOR_BLUE, "You have withdrawled $%d from account #%d.", withdraw_amount, pBankInfo[playerid][select_pbankslot][pBankID]);
                }
            }

            inline const BankInfoDialog(pid, dialogid, response, listitem, string:inputtext[]){
                #pragma unused pid, dialogid, inputtext
                if(response){
                    if(listitem == 0){ // Check Bank Account
                        new check_acc_string[32];
                        format(check_acc_string, sizeof(check_acc_string), "Account ID: %d\nMoney: %d", pBankInfo[playerid][select_pbankslot][pBankID], pBankInfo[playerid][select_pbankslot][pBankAmount]);
                        Dialog_Show(playerid, DIALOG_STYLE_MSGBOX, "Account Status", check_acc_string, "Okay", "");
                    }
                    else if(listitem == 1){ // Withdraw Money
                        Dialog_ShowCallback(playerid, using inline BankWithdrawDialog, DIALOG_STYLE_INPUT, "Withdraw", "{ffffff}Enter the amount you'd like to withdraw", "Okay", "Close");
                    }
                    else if(listitem == 2){ // Deposit Money
                        Dialog_ShowCallback(playerid, using inline BankDepositDialog, DIALOG_STYLE_INPUT, "Deposit", "{ffffff}Enter the amount you'd like to deposit", "Okay", "Close");
                    }
                    else if(listitem == 3){ // Transfer Money
                        Dialog_ShowCallback(playerid, using inline BankTransferDialog, DIALOG_STYLE_INPUT, "Transfer", "{ffffff}Enter the account ID you'd like to transfer money to.", "Okay", "Close");
                    }
                }
            }

            inline const BankDialog(pid, dialogid, response, listitem, string:inputtext[]){
                #pragma unused pid, dialogid, inputtext
                if(response){
                    // if(listitem == create_acc_case){ // For /bank
                    //     new query[128];
                    //     mysql_format(handle, query, sizeof(query), "INSERT INTO bank (Master_ID) VALUES ('%d');", PlayerInfo[playerid][pMasterID]);
                    //     mysql_tquery(handle, query, "OnPlayerBankAccountCreated", "d", playerid);
                    // }
                    if(listitem == 0){
                        select_pbankslot = 0;
                        new bankid_string[12];
                        format(bankid_string, sizeof(bankid_string), "Account #%d", pBankInfo[playerid][0][pBankID]);
                        Dialog_ShowCallback(playerid, using inline BankInfoDialog, DIALOG_STYLE_LIST, bankid_string, "Check Balance\nWithdraw Money\nDeposit Money\nTransfer Money", "Okay", "Close");
                    }
                    else if(listitem == 1){
                        select_pbankslot = 1;
                        new bankid_string[12];
                        format(bankid_string, sizeof(bankid_string), "Account #%d", pBankInfo[playerid][1][pBankID]);
                        Dialog_ShowCallback(playerid, using inline BankInfoDialog, DIALOG_STYLE_LIST, bankid_string, "Check Balance\nWithdraw Money\nDeposit Money\nTransfer Money", "Okay", "Close");
                    }
                    else if(listitem == 2){
                        select_pbankslot = 2;
                        new bankid_string[12];
                        format(bankid_string, sizeof(bankid_string), "Account #%d", pBankInfo[playerid][2][pBankID]);
                        Dialog_ShowCallback(playerid, using inline BankInfoDialog, DIALOG_STYLE_LIST, bankid_string, "Check Balance\nWithdraw Money\nDeposit Money\nTransfer Money", "Okay", "Close");
                    }
                }
            }
            Dialog_ShowCallback(playerid, using inline BankDialog, DIALOG_STYLE_TABLIST_HEADERS, "ATM", string, "Okay", "Close");
        }
        else{
            return SendClientMessage(playerid, COLOR_ERROR, "You cannot use this ATM currently.");
        }
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You are not near an ATM.");
    }
    return 1;
}
