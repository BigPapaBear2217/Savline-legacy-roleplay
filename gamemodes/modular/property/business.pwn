#include <YSI_Coding\y_hooks>


stock GetBusinessSpeciality(speciality) {
    new name[32];
    switch(speciality) {
        case 0: name = "24/7";
        case 1: name = "Pharmacy";
        case 2: name = "Tool Store";
        case 3: name = "Resturant";
        case 4: name = "Clothing";
        case 5: name = "Office";
        case 6: name = "Ammunation";
        case 7: name = "Pay N' Spray";
        case 8: name = "Bar";
    }
    return name;
}

stock GetBusinessBlip(speciality) {
	new blip;
    switch(speciality) {
        case 0: blip = 38;
        case 1: blip = 21;
        case 2: blip = 27;
        case 3: blip = 10;
        case 4: blip = 45;
        case 5: blip = 0; // 0 = none
        case 6: blip = 6;
        case 7: blip = 63;
        case 8: blip = 49;
        default: blip = 0;
    }
    return blip;
}