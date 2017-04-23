<<<<<<< HEAD
package ro.cmm.domain;

/**
 * Created by Joseph Saturday, 15.04.2017 at 01:34.
 */
public class BuyerAccount extends User {
    public BuyerAccount() {
        this.setRole(Role.BUYER);
    }
}
=======
package ro.cmm.domain;

import ro.cmm.domain.User;

/**
 * Created by Joseph Saturday, 15.04.2017 at 01:34.
 */
public class BuyerAccount extends User {
    public BuyerAccount() {
        this.setRole(AccountType.BUYER);
    }
}
>>>>>>> 4d3aa012831855513daaf5658b682978007f7ea6
