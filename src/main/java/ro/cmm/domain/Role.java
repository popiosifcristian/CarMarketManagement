<<<<<<< HEAD:src/main/java/ro/cmm/domain/Role.java
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
=======
package ro.cmm.domain;

/**
 * Created by Joseph Saturday, 15.04.2017 at 01:24.
 */
public enum AccountType {
    ADMIN("Admin"),
    SELLER("Seller"),
    BUYER("Buyer");

    String type = "";

    private AccountType(String type){
        this.type = type;
    }

    public String getType(){
        return type;
    }
}
>>>>>>> 4d3aa012831855513daaf5658b682978007f7ea6:src/main/java/ro/cmm/domain/AccountType.java
