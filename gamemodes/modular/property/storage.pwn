forward LoadPropertyStorage(propertyid);
public LoadPropertyStorage(propertyid) {
    new query[128];
    mysql_format(handle, query, sizeof(query), "SELECT * FROM property_storage WHERE propertyid = %d;", propertyid);
    mysql_tquery(handle, query, "LoadPropertyStorageQuery", "d", propertyid);
    return 1;
}


forward LoadPropertyStorageQuery(propertyid);
public LoadPropertyStorageQuery(propertyid) {
    if(cache_num_rows())
    {
        for(new i = 0; i < MAX_ITEMS; i++){
            cache_get_value_name_int(0, itemNames[i], PropertyStorage[propertyid][e_propertyStorage:i]);
        }
    }
    else
    {
        printf("STORAGE | Propertyid %i now has a storage");
        new query[128];
        mysql_format(handle, query, sizeof(query), "INSERT INTO property_storage (propertyid) VALUES ('%i');", propertyid);
        mysql_tquery(handle, query);
    }
    return 1;
}