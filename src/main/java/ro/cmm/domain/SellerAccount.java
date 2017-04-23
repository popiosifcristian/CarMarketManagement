<<<<<<< HEAD
package ro.cmm.domain;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joseph Saturday, 15.04.2017 at 01:33.
 */
public class SellerAccount extends User {

    private List<Car> carList = new ArrayList<>();

    public SellerAccount() {
        this.setRole(Role.SELLER);
    }

    public List<Car> getCarList() {
        return carList;
    }
}
=======
package ro.cmm.domain;

import ro.cmm.domain.User;
import ro.cmm.domain.Car;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Joseph Saturday, 15.04.2017 at 01:33.
 */
public class SellerAccount extends User {

    private List<Car> carList = new ArrayList<>();

    public SellerAccount() {
        this.setRole(AccountType.SELLER);
    }

    public List<Car> getCarList() {
        return carList;
    }
}
>>>>>>> 4d3aa012831855513daaf5658b682978007f7ea6
