#include <YSI_Coding\y_hooks>

forward LoadPlayerBankData(playerid);
public LoadPlayerBankData(playerid){
    new query[128];
    mysql_format(handle, query, sizeof(query), "SELECT * FROM bank WHERE Master_ID = %d;", PlayerInfo[playerid][pMasterID]);
    mysql_tquery(handle, query, "OnPlayerBankDataLoad", "d", playerid);
    return 1;
}

forward OnPlayerBankDataLoad(playerid);
public OnPlayerBankDataLoad(playerid){
    new rows;
    if(cache_num_rows()){
        cache_get_row_count(rows);
        for(new i=0; i < rows; i++){
            cache_get_value_name_int(i, "Bank_ID", pBankInfo[playerid][i][pBankID]);
            cache_get_value_name_int(i, "Amount", pBankInfo[playerid][i][pBankAmount]);
        }
    }
    return 1;
}

forward SavePlayerBankData(playerid);
public SavePlayerBankData(playerid){
    for(new i=0; i < MAX_PLAYER_BANK_ACC; i++){
        new query[128];
        mysql_format(handle, query, sizeof(query), "UPDATE bank SET Amount = %d WHERE Master_ID = %d AND Bank_ID = %d;", pBankInfo[playerid][i][pBankAmount], PlayerInfo[playerid][pMasterID], pBankInfo[playerid][i][pBankID]);
        mysql_tquery(handle, query);

    }
    return 1;
}

forward OnPlayerBankAccountCreated(playerid);
public OnPlayerBankAccountCreated(playerid){
    SendClientMessage(playerid, COLOR_GREEN, "Congratulations! You have opened a new bank account, enjoy and thank you for your business!");
    LoadPlayerBankData(playerid);
    return 1;
}

forward TransferMoneyToBankID(playerid, pbankslot, transfer_bankid);
public TransferMoneyToBankID(playerid, pbankslot, transfer_bankid){
    if(cache_num_rows()){
        new target_masterid, target_amount;
        cache_get_value_name_int(0, "Master_ID", target_masterid);
        cache_get_value_name_int(0, "Amount", target_amount);

        inline const BankTransferMoneyDialog(pid, dialogid, response, listitem, string:inputtext[]){
            #pragma unused pid, dialogid, listitem
            if(response){
                new transfer_amount;
                if(sscanf(inputtext, "d", transfer_amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you have entered is invalid, please try again.");
                else if(transfer_amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid transfer amount.");
                else if(transfer_amount > pBankInfo[playerid][pbankslot][pBankAmount]) return SendClientMessage(playerid, COLOR_ERROR, "You don't have that much money in your bank account.");
                pBankInfo[playerid][pbankslot][pBankAmount] -= transfer_amount;
                target_amount += transfer_amount;
                
                new query[128];
                mysql_format(handle, query, sizeof(query), "UPDATE bank SET Amount = %d WHERE Master_ID = %d AND Bank_ID = %d;", target_amount, target_masterid, transfer_bankid);
                mysql_tquery(handle, query);

                foreach(new i : Player){
                    if(PlayerInfo[i][pMasterID] == target_masterid){
                        for(new j=0;j<MAX_PLAYER_BANK_ACC;j++){
                            if(pBankInfo[i][j][pBankID] == transfer_bankid){
                                pBankInfo[i][j][pBankID] += transfer_amount;
                            }
                        }
                        SendClientMessageEx(i, COLOR_BLUE, "You have received $%d in your bank account (ID #%d) from account ID #%d", transfer_amount, transfer_bankid, pBankInfo[playerid][pbankslot][pBankID]);
                    }
                }

                SendClientMessageEx(playerid, COLOR_BLUE, "You have transferred $%d from account ID #%d", transfer_amount, pBankInfo[playerid][pbankslot][pBankID]);
            }
        }
        Dialog_ShowCallback(playerid, using inline BankTransferMoneyDialog, DIALOG_STYLE_INPUT, "Money", "{ffffff}Enter the amount of money to transfer.", "Okay", "Close");
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You have entered an account ID that does not exist.");
    }
    return 1;
}

stock IsPlayerAtBank(playerid)
{
    if(IsPlayerInRangeOfPoint(playerid, 10, -1753.1350, 783.3606, 145.1328) && (GetPlayerVirtualWorld(playerid) == 1) && (GetPlayerInterior(playerid) == 1))
        return 1;
    else return 0;
}


CMD:bank(playerid) {

    if(!IsPlayerAtBank(playerid))
    {
        return SendClientMessage(playerid, COLOR_ERROR, "You are not inside the bank.");
    }

    new string[128];
    new create_acc_case = 0;
    new select_pbankslot = -1;
    new transfer_bankid = -1;
    format(string, sizeof(string), "Account ID\t Money\n");
    for(new i=0;i<MAX_PLAYER_BANK_ACC; i++){
        if(pBankInfo[playerid][i][pBankID] > 0){
            new string2[32];
            format(string2, sizeof(string2), "#%d\t$%d\n", pBankInfo[playerid][i][pBankID], pBankInfo[playerid][i][pBankAmount]);
            strcat(string, string2);
            create_acc_case++;
        }
    }
    if(GetPlayerMaxBankAcc(playerid) < 3){
        new string3[30];
        format(string3, sizeof(string3), "{2aeb2d}Open New Account");
        strcat(string, string3);
    }

    inline const BankTransferDialog(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, listitem
        if(response){
            if(sscanf(inputtext, "d", transfer_bankid)) return SendClientMessage(playerid, COLOR_ERROR, "The input you have entered is invalid, please try again.");
            else if(transfer_bankid <= 0) return SendClientMessage(playerid, COLOR_ERROR, "The Account ID you've entered is invalid, please try again.");

            new query[128];
            mysql_format(handle, query, sizeof(query), "SELECT * FROM bank WHERE Bank_ID = %d;", transfer_bankid);
            mysql_tquery(handle, query, "TransferMoneyToBankID", "ddd", playerid, select_pbankslot, transfer_bankid);
        }
    }

    inline const BankDepositDialog(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, listitem
        if(response){
            new deposit_amount;
            if(sscanf(inputtext, "d", deposit_amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you have entered is invalid, please try again.");
            else if(deposit_amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount to deposit.");
            else if(deposit_amount > GetPlayerMoney(playerid)) return SendClientMessage(playerid, COLOR_ERROR, "You don't have that much money on hand.");
            pBankInfo[playerid][select_pbankslot][pBankAmount] += deposit_amount;
            GivePlayerMoney(playerid, -deposit_amount);
            SendClientMessageEx(playerid, COLOR_BLUE, "You have deposited $%d to #%d", deposit_amount, pBankInfo[playerid][select_pbankslot][pBankID]);
        }
    }

    inline const BankWithdrawDialog(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, listitem
        if(response){
            new withdraw_amount;
            if(sscanf(inputtext, "d", withdraw_amount)) return SendClientMessage(playerid, COLOR_ERROR, "The input you have entered is invalid, please try again.");
            else if(withdraw_amount <= 0) return SendClientMessage(playerid, COLOR_ERROR, "You have entered an invalid amount to withdraw.");
            else if(withdraw_amount > pBankInfo[playerid][select_pbankslot][pBankAmount]) return SendClientMessage(playerid, COLOR_ERROR, "You don't have that much money in your bank account.");
            pBankInfo[playerid][select_pbankslot][pBankAmount] -= withdraw_amount;
            GivePlayerMoney(playerid, withdraw_amount);
            SendClientMessageEx(playerid, COLOR_BLUE, "You have withdrawled $%d from #%d", withdraw_amount, pBankInfo[playerid][select_pbankslot][pBankID]);
        }
    }

    inline const BankInfoDialog(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, inputtext
        if(response){
            if(listitem == 0){ // Check Bank Account
                new check_acc_string[32];
                format(check_acc_string, sizeof(check_acc_string), "Account ID: %d\nMoney: %d", pBankInfo[playerid][select_pbankslot][pBankID], pBankInfo[playerid][select_pbankslot][pBankAmount]);
                Dialog_Show(playerid, DIALOG_STYLE_MSGBOX, "Account Status", check_acc_string, "Okay", "Close");
            }
            else if(listitem == 1){ // Withdraw Money
                Dialog_ShowCallback(playerid, using inline BankWithdrawDialog, DIALOG_STYLE_INPUT, "Withdraw", "{ffffff}Enter the amount to withdraw.", "Okay", "Close");
            }
            else if(listitem == 2){ // Deposit Money
                Dialog_ShowCallback(playerid, using inline BankDepositDialog, DIALOG_STYLE_INPUT, "Deposit", "{ffffff}Enter the amount to deposit.", "Okay", "Close");
            }
            else if(listitem == 3){ // Transfer Money
                Dialog_ShowCallback(playerid, using inline BankTransferDialog, DIALOG_STYLE_INPUT, "Transfer", "{ffffff}Enter the account ID you'd like to transfer the money to.", "Okay", "Close");
            }
        }
    }


    inline const BankDialog(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, inputtext
        if(response){
            if(listitem == create_acc_case){
                new query[128];
                mysql_format(handle, query, sizeof(query), "INSERT INTO bank (Master_ID) VALUES ('%d');", PlayerInfo[playerid][pMasterID]);
                mysql_tquery(handle, query, "OnPlayerBankAccountCreated", "d", playerid);
            }
            else if(listitem == 0){
                select_pbankslot = 0;
                new bankid_string[12];
                format(bankid_string, sizeof(bankid_string), "Account #%d", pBankInfo[playerid][0][pBankID]);
                Dialog_ShowCallback(playerid, using inline BankInfoDialog, DIALOG_STYLE_LIST, bankid_string, "Check Account\nWithdraw Money\nDeposit Money\nTransfer Money", "Okay", "Close");
            }
            else if(listitem == 1){
                select_pbankslot = 1;
                new bankid_string[12];
                format(bankid_string, sizeof(bankid_string), "Account #%d", pBankInfo[playerid][1][pBankID]);
                Dialog_ShowCallback(playerid, using inline BankInfoDialog, DIALOG_STYLE_LIST, bankid_string, "Check Account\nWithdraw Money\nDeposit Money\nTransfer Money", "Okay", "Close");
            }
            else if(listitem == 2){
                select_pbankslot = 2;
                new bankid_string[12];
                format(bankid_string, sizeof(bankid_string), "Account #%d", pBankInfo[playerid][2][pBankID]);
                Dialog_ShowCallback(playerid, using inline BankInfoDialog, DIALOG_STYLE_LIST, bankid_string, "Check Account\nWithdraw Money\nDeposit Money\nTransfer Money", "Okay", "Close");
            }
        }
    }

    Dialog_ShowCallback(playerid, using inline BankDialog, DIALOG_STYLE_TABLIST_HEADERS, "Bank", string, "Okay", "Close");
    return 1;
}

forward GetPlayerMaxBankAcc(playerid);
public GetPlayerMaxBankAcc(playerid){
    new total_player_acc = 0;
    for(new i=0;i<MAX_PLAYER_BANK_ACC; i++){
        if(pBankInfo[playerid][i][pBankID] > 0){
            total_player_acc++;
        }
    }
    return total_player_acc;
}