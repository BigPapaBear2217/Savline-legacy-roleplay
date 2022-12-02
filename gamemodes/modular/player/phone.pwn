#include <YSI_Coding\y_hooks>

// ----- Database Setup -----

forward LoadPlayerPhoneData(playerid);
public LoadPlayerPhoneData(playerid){
    new query[128];
    mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_info WHERE Master_ID = %d;", PlayerInfo[playerid][pMasterID]);
    mysql_tquery(handle, query, "OnPlayerPhoneDataLoad", "d", playerid);
    return 1;
}

forward OnPlayerPhoneDataLoad(playerid);
public OnPlayerPhoneDataLoad(playerid){
    if(cache_num_rows()){
        cache_get_value_name_int(0, "Phone_Number", pPhone[playerid][Number]);
        cache_get_value_name_int(0, "Speaker", pPhone[playerid][Speaker]);
        cache_get_value_name_int(0, "Power", pPhone[playerid][Power]);
        pPhoneCall[playerid][OnRequest] = 0;
        pPhoneCall[playerid][OnCall] = 0;
    }
    else{
        new ph_number = GetPlayerNewPhoneNumber(playerid);
        new query[128];
        mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_info WHERE Phone_Number = %d;", ph_number);
        mysql_tquery(handle, query, "OnPlayerPhoneNumberCheck", "dd", playerid, ph_number);
    }
    return 1;
}

forward OnPlayerPhoneNumberCheck(playerid, number);
public OnPlayerPhoneNumberCheck(playerid, number){
    if(cache_num_rows()){
        new ph_number = GetPlayerNewPhoneNumber(playerid);
        new query[128];
        mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_info WHERE Phone_Number = %d;", ph_number);
        mysql_tquery(handle, query, "OnPlayerPhoneNumberCheck", "dd", playerid, ph_number);
    }
    else{
        new query[128];
        pPhone[playerid][Number] = number;
        pPhone[playerid][Speaker] = 0;
        pPhone[playerid][Power] = 1;
        mysql_format(handle, query, sizeof(query), "INSERT INTO phone_info (Master_ID, Phone_Number, Speaker, Power) VALUES ('%d', '%d', '0', '1');", PlayerInfo[playerid][pMasterID], number);
        mysql_tquery(handle, query);
    }
    return 1;
}

forward SavePlayerPhoneData(playerid);
public SavePlayerPhoneData(playerid){
    new query[128];
    mysql_format(handle, query, sizeof(query), "UPDATE phone_info SET Phone_Number = %d, Speaker = %d, Power = %d WHERE Master_ID = %d;", pPhone[playerid][Number], pPhone[playerid][Speaker], pPhone[playerid][Power], PlayerInfo[playerid][pMasterID]);
    mysql_tquery(handle, query, "ResetPlayerPhoneData", "d", playerid);
    return 1;
}

forward ResetPlayerPhoneData(playerid);
public ResetPlayerPhoneData(playerid){
    pPhone[playerid][Number] = 0;
    pPhone[playerid][Speaker] = 0;
    pPhone[playerid][Power] = 0;
    pPhoneCall[playerid][OnRequest] = 0;
    pPhoneCall[playerid][OnCall] = 0;
    return 1;
}


// ----- COMMANDS -----

CMD:phone(playerid){
    new new_contact_name[26], new_contact_number;


    // Power
    inline const PhonePower(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, inputtext
        if(response){
            if(listitem == 0){
                if(pPhone[playerid][Power] == 0){
                    pPhone[playerid][Power] = 1;
                    return SendClientMessage(playerid, COLOR_BLUE, "Phone ON");
                }
                else if(pPhone[playerid][Power] == 1){
                    pPhone[playerid][Power] = 0;
                    return SendClientMessage(playerid, COLOR_BLUE, "Phone OFF");
                }
            }
        }
    }


    // New Contact (Number)
    inline const DialogNewContactNumber(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, listitem
        if(response){
            if(sscanf(inputtext, "d", new_contact_number)) return SendClientMessage(playerid, COLOR_ERROR, "Invaild input, Please enter a number.");
            new query[64];
            mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_info WHERE Phone_Number = %d;", new_contact_number);
            mysql_tquery(handle, query, "OnPlayerNewContactCheck", "dds", playerid, new_contact_number, new_contact_name);
        }
    }


    // New Contact (Name)
    inline const DialogNewContact(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, listitem
        if(response){
            // printf("%d", length);
            if(strlen(inputtext) > 26) return SendClientMessage(playerid, COLOR_ERROR, "Please enter a name with maximum 26 character.");
            format(new_contact_name, sizeof(new_contact_name), "%s", inputtext);
            Dialog_ShowCallback(playerid, using inline DialogNewContactNumber, DIALOG_STYLE_INPUT, "Contact Number", "{ffffff}Enter the contact number.", "Okay", "Close");
        }
    }


    // New Contact ()
    inline const PhoneContacts(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, inputtext
        if(response){
            if(listitem == 0){ // View/Edit Contacts
                ShowPlayerPhoneContacts(playerid);
            }
            else if(listitem == 1){ // New Contacts
                Dialog_ShowCallback(playerid, using inline DialogNewContact, DIALOG_STYLE_INPUT, "Contact Name", "{ffffff}Enter the contact name.", "Okay", "Close");
            }
        }
    }


    inline const PhoneDialog(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, inputtext
        if(response){
            switch(listitem){
                case 0: // Details
                {
                    new string[44];
                    if(pPhone[playerid][Speaker] == 0) format(string, sizeof(string), "Phone Number: %d\nSpeaker: OFF", pPhone[playerid][Number]);
                    else if(pPhone[playerid][Speaker] == 1) format(string, sizeof(string), "Phone Number: %d\nSpeaker: ON", pPhone[playerid][Number]);
                    Dialog_Show(playerid, DIALOG_STYLE_MSGBOX, "Phone Details", string, "Okay", "Close");
                }
                case 1: // SMS
                {
                    ShowPlayerPhoneSMS(playerid);
                }
                case 2: // Contacts
                {
                    Dialog_ShowCallback(playerid, using inline PhoneContacts, DIALOG_STYLE_LIST, "Contacts", "View/Edit Contacts\nNew Contact", "Okay", "Close");
                }
                case 3: // Call Log
                {
                    new query[98];
                    mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_calllog WHERE Caller_ID = %d OR Receiver_ID = %d;", PlayerInfo[playerid][pMasterID], PlayerInfo[playerid][pMasterID]);
                    mysql_tquery(handle, query, "OnPlayerRequestCalllog", "d", playerid);
                }
                case 4: // Speaker
                {
                    if(pPhone[playerid][Speaker] == 0){
                        pPhone[playerid][Speaker] = 1;
                        return SendClientMessage(playerid, COLOR_BLUE, "Phone Speaker ON");
                    }
                    else if(pPhone[playerid][Speaker] == 1){
                        pPhone[playerid][Speaker] = 0;
                        return SendClientMessage(playerid, COLOR_BLUE, "Phone Speaker OFF");
                    }
                }
                case 5: // Camera
                {

                }
                case 6: // Bank Accounts
                {
                    ShowPlayerPhoneBankAccount(playerid);
                }
                case 7: // Power Switch
                {
                    if(pPhone[playerid][Power] == 0){
                        pPhone[playerid][Power] = 1;
                        return SendClientMessage(playerid, COLOR_BLUE, "Phone ON");
                    }
                    else if(pPhone[playerid][Power] == 1){
                        pPhone[playerid][Power] = 0;
                        return SendClientMessage(playerid, COLOR_BLUE, "Phone OFF");
                    }
                }
            }
        }
    }

    if(pPhone[playerid][Power] == 1){ // IF POWER ON
        Dialog_ShowCallback(playerid, using inline PhoneDialog, DIALOG_STYLE_LIST, "Phone", "Details\nSMS\nContacts\nCall Log\nSpeaker\nCamera\nBank Accounts\nPower Switch", "Okay", "Close");
    }
    else if(pPhone[playerid][Power] == 0){ // IF POWER OFF
        Dialog_ShowCallback(playerid, using inline PhonePower, DIALOG_STYLE_LIST, "Phone", "Power", "Okay", "Close");
    }
    return 1;
}


// ----- SMS -----
CMD:sms(playerid, params[]){
    new target_number, sms_string[144];
    if(sscanf(params, "ds[144]", target_number, sms_string)) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /sms [phone_number] [message]");
    else if(target_number == pPhone[playerid][Number]) return SendClientMessage(playerid, COLOR_ERROR, "You cannot send message to your phone number.");


    new query[128];
    mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_info WHERE Phone_Number = %d;", target_number);
    mysql_tquery(handle, query, "OnPlayerRequestSendSMS", "dds", playerid, target_number, sms_string);
    return 1;
}


// ----- Call -----
CMD:call(playerid, params[]){
    new target_number;
    if(sscanf(params, "d", target_number)) return SendClientMessage(playerid, COLOR_ERROR, "Correct Usage: /call [number]");
    else if(target_number == pPhone[playerid][Number]) return SendClientMessage(playerid, COLOR_ERROR, "You cannot call to your own phone number.");

    new query[128];
    mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_contact WHERE Master_ID = %d AND Phone_Number = %d AND Contact_Number = %d;", PlayerInfo[playerid][pMasterID], pPhone[playerid][Number], target_number);
    mysql_tquery(handle, query, "OnPlayerRequestCallContactCheck", "dd", playerid, target_number);
    return 1;
}

CMD:pickup(playerid){
    if(pPhoneCall[playerid][OnRequest]){
        foreach(new i : Player){
            if(pPhone[i][Number] == pPhoneCall[playerid][OnRequest] && pPhoneCall[i][OnRequest] == pPhone[playerid][Number]){
                SendClientMessage(i, COLOR_BLUE, "They have pickup the call.");
                pPhoneCall[i][OnRequest] = 0;
                pPhoneCall[playerid][OnRequest] = 0;
                pPhoneCall[i][OnCall] = pPhone[playerid][Number];
                pPhoneCall[playerid][OnCall] = pPhone[i][Number];

                new query[192];
                mysql_format(handle, query, sizeof(query), "INSERT INTO phone_calllog (Caller_ID, Receiver_ID, Caller_Number, Receiver_Number, Timestamp) VALUES ('%d', '%d', '%d', '%d', '%d');", PlayerInfo[i][pMasterID], PlayerInfo[playerid][pMasterID], pPhone[i][Number], pPhone[playerid][Number], Float:Now());
                mysql_tquery(handle, query);
            }
        }
        SendClientMessage(playerid, COLOR_BLUE, "You have pickup the call.");
        SetPlayerSpecialActionEx(playerid, SPECIAL_ACTION_USECELLPHONE);
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You cannot pickup the call if noone is calling you.");
    }
    return 1;
}

CMD:hangup(playerid){
    if(pPhoneCall[playerid][OnRequest] || pPhoneCall[playerid][OnCall]){
        foreach(new i : Player){
            if(pPhone[i][Number] == pPhoneCall[playerid][OnRequest] && pPhone[playerid][Number] == pPhoneCall[i][OnRequest] || pPhone[i][Number] == pPhoneCall[playerid][OnCall] && pPhone[playerid][Number] == pPhoneCall[i][OnCall]){
                SendClientMessage(i, COLOR_BLUE, "They hangup.");
                pPhoneCall[i][OnRequest] = 0;
                pPhoneCall[i][OnCall] = 0;
                SetPlayerSpecialActionEx(i, SPECIAL_ACTION_STOPUSECELLPHONE);
            }
        }
        SendClientMessage(playerid, COLOR_BLUE, "You hangup.");
        pPhoneCall[playerid][OnRequest] = 0;
        pPhoneCall[playerid][OnCall] = 0;
        SetPlayerSpecialActionEx(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You are not calling / at call or noone is calling you");
    }
    return 1;
}

// ---------- FUNCTIONS & CALLBACKS ----------


// ----- Calllog -----
forward OnPlayerRequestCalllog(playerid);
public OnPlayerRequestCalllog(playerid){
    if(cache_num_rows()){
        new string[4096], rows;
        format(string, sizeof(string), "Caller\tReceiver\tDate\n");
        cache_get_row_count(rows);
        for(new i=0; i<rows;i++){
            new string2[42], caller_number, receiver_number, timestamp, call_date[12], call_time[12];
            cache_get_value_name_int(i, "Caller_Number", caller_number);
            cache_get_value_name_int(i, "Receiver_Number", receiver_number);
            cache_get_value_name_int(i, "Timestamp", timestamp);

            TimeFormat(Timestamp:timestamp, HUMAN_DATE, call_date, sizeof(call_date));
            TimeFormat(Timestamp:timestamp, ISO6801_TIME, call_time, sizeof(call_time));

            format(string2, sizeof(string2), "%d\t%d\t%s %s", caller_number, receiver_number, call_date, call_time);

            strcat(string, string2);
        }
        Dialog_Show(playerid, DIALOG_STYLE_TABLIST_HEADERS, "Call Log", string, "Okay", "Close");
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You don't have any calllogs logs.");
    }
    return 1;
}



// ----- Call -----
timer ResetPlayerCall[20000](playerid, targetid) 
{
    if(pPhoneCall[playerid][OnRequest] || pPhoneCall[targetid][OnRequest]){
        pPhoneCall[playerid][OnRequest] = 0;
        pPhoneCall[targetid][OnRequest] = 0;
        SendClientMessage(playerid, COLOR_BLUE, "No response.");
        SendClientMessage(targetid, COLOR_BLUE, "You have missed the call.");
        SetPlayerSpecialActionEx(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
    }
}


forward OnPlayerRequestCall(playerid, phone_number);
public OnPlayerRequestCall(playerid, phone_number){
    if(cache_num_rows()){
        foreach(new i : Player){
            if(pPhone[i][Number] == phone_number){
                pPhoneCall[playerid][OnRequest] = pPhone[i][Number];
                pPhoneCall[i][OnRequest] = pPhone[playerid][Number];
                // new Float:tx,Float:px, Float:ty,Float:py, Float:tz,Float:pz;
                // GetPlayerPos(playerid, px, py, pz);
                new Float:tx, Float:ty, Float:tz;
                GetPlayerPos(i, tx, ty, tz);

                PlayerPlaySound(i, 20600, tx, ty, tz);
                // PlayerPlaySound(playerid, 20600, px, py, pz);
                // ApplyAnimation(playerid, "ped", "phone_in", 4.1, 0, 1, 1, 0, 3, 1);
                SetPlayerSpecialActionEx(playerid, SPECIAL_ACTION_USECELLPHONE);
                SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" has takes out his phone and dial a number.", GetRoleplayName(playerid, true));
                SendProximityMessage(i, 20.0, COLOR_OOC, "* %s"COL_OOC" phone is ringing.", GetRoleplayName(i, true));
                SendClientMessageEx(playerid, COLOR_BLUE, "You have dial %d number. Calling..", phone_number);
                SendClientMessageEx(i, COLOR_BLUE, "Call incoming from %d.", pPhone[playerid][Number]);
                defer ResetPlayerCall(playerid, i);
                return 1;
            }
        }
        SendClientMessage(playerid, COLOR_ERROR, "You have entered a phone number that ain't available.");
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You have entered a phone number that doesn't exist.");
    }
    return 1;
}


forward OnPlayerRequestCallContactCheck(playerid, phone_number);
public OnPlayerRequestCallContactCheck(playerid, phone_number){
    if(cache_num_rows()){
        new contact_name[26], contact_number;
        cache_get_value_name(0, "Contact_Name", contact_name, sizeof(contact_name));
        cache_get_value_name_int(0, "Contact_Number", contact_number);
        foreach(new i : Player){
            if(pPhone[i][Number] == phone_number){
                pPhoneCall[playerid][OnRequest] = pPhone[i][Number];
                pPhoneCall[i][OnRequest] = pPhone[playerid][Number];
                // new Float:tx,Float:px, Float:ty,Float:py, Float:tz,Float:pz;
                new Float:tx, Float:ty, Float:tz;
                // GetPlayerPos(playerid, px, py, pz);
                GetPlayerPos(i, tx, ty, tz);

                PlayerPlaySound(i, 20600, tx, ty, tz);
                // PlayerPlaySound(playerid, 20600, px, py, pz); Ho
                // ApplyAnimation(playerid, "ped", "phone_in", 4.1, 0, 1, 1, 0, 3, 1);
                SetPlayerSpecialActionEx(playerid, SPECIAL_ACTION_USECELLPHONE);
                SendProximityMessage(playerid, 20.0, COLOR_OOC, "* %s"COL_OOC" has takes out his phone and dial a number.", GetRoleplayName(playerid, true));
                SendProximityMessage(i, 20.0, COLOR_OOC, "* %s"COL_OOC" phone is ringing.", GetRoleplayName(i, true));
                SendClientMessageEx(playerid, COLOR_BLUE, "You have calling to %s", contact_name);
                new query2[128];
                mysql_format(handle, query2, sizeof(query2), "SELECT * FROM phone_contact WHERE Master_ID = %d AND Phone_Number = %d AND Contact_Number = %d;", PlayerInfo[i][pMasterID], pPhone[i][Number], pPhone[playerid][Number]);
                mysql_tquery(handle, query2, "OnTargetCallContactCheck", "dd", i , playerid);
                defer ResetPlayerCall(playerid, i);
                return 1;
            }
        }
        SendClientMessage(playerid, COLOR_ERROR, "You have entered a phone number that ain't available.");
    }
    else{
        new query[128];
        mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_info WHERE Phone_Number = %d;", phone_number);
        mysql_tquery(handle, query, "OnPlayerRequestCall", "dd", playerid, phone_number);
    }
    return 1;
}


forward OnTargetCallContactCheck(targetid, playerid);
public OnTargetCallContactCheck(targetid, playerid){
    if(cache_num_rows()){
        new contact_name[26];
        cache_get_value_name(0, "Contact_Name", contact_name, sizeof(contact_name));
        SendClientMessageEx(targetid, COLOR_BLUE, "Call incoming from %s.", contact_name);
    }
    else{
        SendClientMessageEx(targetid, COLOR_BLUE, "Call incoming from %d.", pPhone[playerid][Number]);
    }
    return 1;
}



// ----- Contacts -----
forward OnPlayerNewContactCheck(playerid, contact_number, contact_name[]);
public OnPlayerNewContactCheck(playerid, contact_number, contact_name[]){
    if(cache_num_rows()){
        new query[205];
        mysql_format(handle, query, sizeof(query), "INSERT INTO phone_contact (Master_ID, Phone_Number, Contact_Name, Contact_Number) VALUES ('%d', '%d', '%e', '%d');", PlayerInfo[playerid][pMasterID], pPhone[playerid][Number], contact_name, contact_number);
        mysql_tquery(handle, query);

        SendClientMessage(playerid, COLOR_BLUE, "New contact added");
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You have entered invaild phone number, Please check your number.");
    }
    return 1;
}


forward ShowPlayerPhoneContacts(playerid);
public ShowPlayerPhoneContacts(playerid){
    new query[128];
    mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_contact WHERE Master_ID = %d AND Phone_Number = %d;", PlayerInfo[playerid][pMasterID], pPhone[playerid][Number]);
    mysql_tquery(handle, query, "OnPlayerPhoneRequestContact", "d", playerid);
    return 1;
}


forward OnPlayerPhoneRequestContact(playerid);
public OnPlayerPhoneRequestContact(playerid){
    if(cache_num_rows()){
        new rows;
        cache_get_row_count(rows);
        new contact_string[4096];
        format(contact_string, sizeof(contact_string), "Name\tNumber\n");
        for(new i=0;i<rows;i++){
            new string[38], contact_name[26], contact_number;
            cache_get_value_name(i, "Contact_Name", contact_name, sizeof(contact_name));
            cache_get_value_name_int(i, "Contact_Number", contact_number);
            format(string, sizeof(string), "%s\t%d\n", contact_name, contact_number);
            strcat(contact_string, string);

        }



        inline const DialogPhoneContacts(pid, dialogid, response, listitem, string:inputtext[]){
            #pragma unused pid, dialogid, inputtext
            if(response){
                new query[128];
                mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_contact WHERE Master_ID = %d AND Phone_Number = %d;", PlayerInfo[playerid][pMasterID], pPhone[playerid][Number]);
                mysql_tquery(handle, query, "OnPlayerPhoneContactSelect", "dd", playerid, listitem);
            }
        }


        Dialog_ShowCallback(playerid, using inline DialogPhoneContacts, DIALOG_STYLE_TABLIST_HEADERS, "Contact List", contact_string, "Okay", "Close");
    }
    else{
        return SendClientMessage(playerid, COLOR_BLUE, "No contacts found.");
    }
    return 1;
}


forward OnPlayerPhoneContactSelect(playerid, row);
public OnPlayerPhoneContactSelect(playerid, row){
    if(cache_num_rows()){
        new contact_name[26], contact_number, contact_block;
        cache_get_value_name(row, "Contact_Name", contact_name, sizeof(contact_name));
        cache_get_value_name_int(row, "Contact_Number", contact_number);
        cache_get_value_name_int(row, "Block", contact_block);


        inline const DialogPhoneContactSMS(pid, dialogid, response, listitem, string:inputtext[]){
            #pragma unused pid, dialogid, listitem
            if(response){
                new query[128];
                mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_info WHERE Phone_Number = %d;", contact_number);
                mysql_tquery(handle, query, "OnPlayerRequestSendSMS", "dds", playerid, contact_number, inputtext);
            }
        }


        inline const PhoneContactChangename(pid, dialogid, response, listitem, string:inputtext[]){
            #pragma unused pid, dialogid, listitem
            if(response){
                if(strlen(inputtext) > 26) return SendClientMessage(playerid, COLOR_ERROR, "Please enter a name with a maximum of 26 characters.");
                new query[188];
                mysql_format(handle, query, sizeof(query), "UPDATE phone_contact SET Contact_Name = '%e' WHERE Master_ID = %d AND Contact_Name = '%e' AND Contact_Number = %d;", inputtext, PlayerInfo[playerid][pMasterID], contact_name, contact_number);
                mysql_tquery(handle, query);

                SendClientMessage(playerid, COLOR_BLUE, "Contact name updated successfully.");
            }
        }


        inline const PhoneContactChangenumber(pid, dialogid, response, listitem, string:inputtext[]){
            #pragma unused pid, dialogid, listitem
            if(response){
                new new_number;
                if(sscanf(inputtext, "d", new_number)) return SendClientMessage(playerid, COLOR_ERROR, "You have entered something invalid.");
                new query[174];
                mysql_format(handle, query, sizeof(query), "UPDATE phont_contact SET Contact_Number = %d WHERE Master_ID = %d AND Contact_Name = '%e' AND Contact_Number = %d;", inputtext, PlayerInfo[playerid][pMasterID], contact_name, new_number);
                mysql_tquery(handle, query);

                SendClientMessage(playerid, COLOR_BLUE, "Contact number updated successfully.");
            }
        }


        inline const DialogPhoneContactDelete(pid, dialogid, response, listitem, string:inputtext[]){
            #pragma unused pid, dialogid, listitem, inputtext
            if(response){
                new query[176];
                mysql_format(handle, query, sizeof(query), "DELETE FROM phone_contact WHERE Master_ID = %d AND Phone_Number = %d AND Contact_Name = '%e' AND Contact_Number = %d;", PlayerInfo[playerid][pMasterID], pPhone[playerid][Number], contact_name, contact_number);
                mysql_tquery(handle, query);

                SendClientMessage(playerid, COLOR_BLUE, "Contact have deleted successfully.");
            }
        }


        inline const DialogPhoneContactBlock(pid, dialogid, response, listitem, string:inputtext[]){
            #pragma unused pid, dialogid, listitem, inputtext
            if(response){
                new query[128];
                mysql_format(handle, query, sizeof(query), "UPDATE phont_contact SET Block = 1 WHERE Master_ID = %d AND Contact_Name = '%e' AND Contact_Number = %d;", PlayerInfo[playerid][pMasterID], pPhone[playerid][Number], contact_name, contact_number);
                mysql_tquery(handle, query);

                SendClientMessage(playerid, COLOR_BLUE, "Contact have blocked successfully.");
            }
        }


        inline const DialogPhoneContactSelect(pid, dialogid, response, listitem, string:inputtext[]){
            #pragma unused pid, dialogid, inputtext
            if(response){
                if(listitem == 0){ // Call
                    new query[128];
                    mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_contact WHERE Master_ID = %d AND Phone_Number = %d AND Contact_Number = %d;", PlayerInfo[playerid][pMasterID], pPhone[playerid][Number], contact_number);
                    mysql_tquery(handle, query, "OnPlayerRequestCallContactCheck", "dd", playerid, contact_number);
                }
                else if(listitem == 1){ // SMS
                    Dialog_ShowCallback(playerid, using inline DialogPhoneContactSMS, DIALOG_STYLE_INPUT, "Message", "Enter the message to send.", "Okay", "Close");
                }
                else if(listitem == 2){ // Change Name
                    Dialog_ShowCallback(playerid, using inline PhoneContactChangename, DIALOG_STYLE_INPUT, "Change Name", "Enter the new contact name.", "Okay", "Close");
                }
                else if(listitem == 3){ // Change Number
                    Dialog_ShowCallback(playerid, using inline PhoneContactChangenumber, DIALOG_STYLE_INPUT, "Change Number", "Enter the new contact number", "Okay", "Close");
                }
                else if(listitem == 4){ // Delete Contact
                    Dialog_ShowCallback(playerid, using inline DialogPhoneContactDelete, DIALOG_STYLE_MSGBOX, "Delete Contact", "Are you sure to delete this contact?", "Okay", "Close");
                }
                else if(listitem == 5){ // Block Contact
                    Dialog_ShowCallback(playerid, using inline DialogPhoneContactBlock, DIALOG_STYLE_MSGBOX, "Block Contact", "Are you sure to block this contact?", "Okay", "Close");
                }
            }
        }

        Dialog_ShowCallback(playerid, using inline DialogPhoneContactSelect, DIALOG_STYLE_LIST, "Edit Contact", "Call\nSMS\nChange Name\nChange Number\nDelete Contact\nBlock Contact", "Okay", "Close");
    }
    else{
        SendClientMessage(playerid, COLOR_ERROR, "Something went wrong.");
    }
    return 1;
}



// ----- SMS -----
forward OnPlayerRequestSendSMS(playerid, target_number, sms_string[]);
public OnPlayerRequestSendSMS(playerid, target_number, sms_string[]){
    if(cache_num_rows()){
        new target_master_id;
        cache_get_value_name_int(0, "Master_ID", target_master_id);

        new query[512];
        new Float:ts = Float:Now();
        mysql_format(handle, query, sizeof(query), "INSERT INTO phone_sms (Sender_ID, Receiver_ID, Sender_Number, Receiver_Number, Timestamp, Seen, Content) VALUES ('%d', '%d', '%d', '%d', '%d', '0', '%e');", PlayerInfo[playerid][pMasterID], target_master_id, pPhone[playerid][Number], target_number, ts, sms_string);
        mysql_tquery(handle, query);

        SendClientMessage(playerid, COLOR_BLUE, "Message Sent.");
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "You have entered invaild phone number.");
    }
    return 1;
}


forward ShowPlayerPhoneSMS(playerid);
public ShowPlayerPhoneSMS(playerid){
    new query[128];
    mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_sms WHERE Receiver_Number = %d AND Receiver_ID = %d;", pPhone[playerid][Number], PlayerInfo[playerid][pMasterID]);
    mysql_tquery(handle, query, "OnPlayerRequestSMS", "d", playerid);
    return 1;
}


forward OnPlayerRequestSMS(playerid);
public OnPlayerRequestSMS(playerid){
    if(cache_num_rows()){
        new rows;
        cache_get_row_count(rows);
        new string[4096];
        format(string, sizeof(string), "Sender Number\tDate Time\tSeen\n");
        print(string);
        for(new i=0; i<rows;i++){
            new string2[64], sender_number, ts, msg_seen, msg_date[12], msg_time[12];
            cache_get_value_name_int(i, "Sender_Number", sender_number);
            cache_get_value_name_int(i, "Timestamp", ts);
            cache_get_value_name_int(i, "Seen", msg_seen);
            printf("%d", ts);
            TimeFormat(Timestamp:ts, HUMAN_DATE, msg_date, sizeof(msg_date));
            TimeFormat(Timestamp:ts, ISO6801_TIME, msg_time, sizeof(msg_time));

            if(msg_seen == 0) format(string2, sizeof(string2), "%d\t%s %s\t{e82323}Unseen\n", sender_number, msg_date, msg_time, msg_seen);
            else if(msg_seen == 1) format(string2, sizeof(string2), "%d\t%s %s\tSeen\n", sender_number, msg_date, msg_time, msg_seen);
            print(string2);
            strcat(string, string2);
        }

        inline const DialogSMS(pid, dialogid, response, listitem, string:inputtext[]){
            #pragma unused pid, dialogid, inputtext
            if(response){
                new msg_row;
                for(new i =0; i<rows; i++){
                    if(listitem == i){
                        msg_row = i;
                        new query[128];
                        mysql_format(handle, query, sizeof(query), "SELECT * FROM phone_sms WHERE Receiver_Number = %d AND Receiver_ID = %d;", pPhone[playerid][Number], PlayerInfo[playerid][pMasterID]);
                        mysql_tquery(handle, query, "OnPlayerRequestSMSDetails", "dd", playerid, msg_row);
                    }
                }
            }
        }
        print(string);
        Dialog_ShowCallback(playerid, using inline DialogSMS, DIALOG_STYLE_TABLIST_HEADERS, "SMS", string, "Okay", "Close");
    }
    else{
        return SendClientMessage(playerid, COLOR_BLUE, "No message found!");
    }
    return 1;
}


forward OnPlayerRequestSMSDetails(playerid, msg_row);
public OnPlayerRequestSMSDetails(playerid, msg_row){
    if(cache_num_rows()){
        new string[256], row_id;
        new sender_number, ts, msg_date[12], msg_time[12], sms_string[145];
        cache_get_value_name_int(msg_row, "ID", row_id);
        cache_get_value_name_int(msg_row, "Sender_Number", sender_number);
        cache_get_value_name_int(msg_row, "Timestamp", ts);
        cache_get_value_name(msg_row, "Content", sms_string, sizeof(sms_string));
        TimeFormat(Timestamp:ts, HUMAN_DATE, msg_date, sizeof(msg_date));
        TimeFormat(Timestamp:ts, ISO6801_TIME, msg_time, sizeof(msg_time));

        format(string, sizeof(string), "{ffffff}Sender: %d\nDate: %s %s\n\n Message: %s", sender_number, msg_date, msg_time, sms_string);

        new query[60];
        mysql_format(handle, query, sizeof(query), "UPDATE phone_sms SET Seen = 1 WHERE ID = %d;", row_id);
        mysql_tquery(handle, query);

        Dialog_Show(playerid, DIALOG_STYLE_MSGBOX, "SMS Details", string, "Okay", "Close");
    }
    else{
        return SendClientMessage(playerid, COLOR_ERROR, "Something went wrong.");
    }
    return 1;
}


// ----- Bank Accounts -----
forward ShowPlayerPhoneBankAccount(playerid);
public ShowPlayerPhoneBankAccount(playerid){
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


    inline const BankTransferDialog(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, listitem, inputtext
        if(response){
            if(sscanf(inputtext, "d", transfer_bankid)) return SendClientMessage(playerid, COLOR_ERROR, "The input you have entered is invalid, please try again.");
            else if(transfer_bankid <= 0) return SendClientMessage(playerid, COLOR_ERROR, "The Account ID you've entered is invalid, please try again.");

            new query[128];
            mysql_format(handle, query, sizeof(query), "SELECT * FROM bank WHERE Bank_ID = %d;", transfer_bankid);
            mysql_tquery(handle, query, "TransferMoneyToBankID", "ddd", playerid, select_pbankslot, transfer_bankid);
        }
    }


    inline const BankInfoDialog(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, inputtext
        if(response){
            switch(listitem){
                case 0: // Check Bank Account
                {
                    new check_acc_string[32];
                    format(check_acc_string, sizeof(check_acc_string), "Account ID: %d\nMoney: %d", pBankInfo[playerid][select_pbankslot][pBankID], pBankInfo[playerid][select_pbankslot][pBankAmount]);
                    Dialog_Show(playerid, DIALOG_STYLE_MSGBOX, "Account Status", check_acc_string, "Okay", "Close");
                }
                case 1: // Transfer Money
                {
                    Dialog_ShowCallback(playerid, using inline BankTransferDialog, DIALOG_STYLE_INPUT, "Transfer", "{ffffff}Enter the account ID you'd like to transfer the money to.", "Okay", "Close");
                }
            }
        }
    }


    inline const BankDialog(pid, dialogid, response, listitem, string:inputtext[]){
        #pragma unused pid, dialogid, inputtext
        if(response){
            switch(listitem){
                case 0:
                {
                    select_pbankslot = 0;
                    new bankid_string[12];
                    format(bankid_string, sizeof(bankid_string), "Account #%d", pBankInfo[playerid][0][pBankID]);
                    Dialog_ShowCallback(playerid, using inline BankInfoDialog, DIALOG_STYLE_LIST, bankid_string, "Check Account\nTransfer Money", "Okay", "Close");
                }
                case 1:
                {
                    select_pbankslot = 1;
                    new bankid_string[12];
                    format(bankid_string, sizeof(bankid_string), "Account #%d", pBankInfo[playerid][1][pBankID]);
                    Dialog_ShowCallback(playerid, using inline BankInfoDialog, DIALOG_STYLE_LIST, bankid_string, "Check Account\nTransfer Money", "Okay", "Close");
                }
                case 2:
                {
                    select_pbankslot = 2;
                    new bankid_string[12];
                    format(bankid_string, sizeof(bankid_string), "Account #%d", pBankInfo[playerid][2][pBankID]);
                    Dialog_ShowCallback(playerid, using inline BankInfoDialog, DIALOG_STYLE_LIST, bankid_string, "Check Account\nWithdraw Money\nDeposit Money\nTransfer Money", "Okay", "Close");
                }
            }
        }
    }


    Dialog_ShowCallback(playerid, using inline BankDialog, DIALOG_STYLE_TABLIST_HEADERS, "Phone Bank", string, "Okay", "Close");
    return 1;
}



// ----- Phone Number Generate -----
stock GetPlayerNewPhoneNumber(playerid){
    new phone = Random((PlayerInfo[playerid][pMasterID])+10000, PlayerInfo[playerid][pMasterID]+10100) + 100;
    return phone;
}