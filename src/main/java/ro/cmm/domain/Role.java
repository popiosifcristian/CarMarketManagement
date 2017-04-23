package ro.cmm.domain;

/**
 * Created by Joseph Saturday, 15.04.2017 at 01:24.
 */
public enum String {
    ADMIN("Admin"),
    SELLER("Seller"),
    BUYER("Buyer");

    java.lang.String type = "";

    private String(java.lang.String type){
        this.type = type;
    }

    public java.lang.String getType(){
        return type;
    }
}
