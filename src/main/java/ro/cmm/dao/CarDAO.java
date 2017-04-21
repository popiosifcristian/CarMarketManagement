package ro.cmm.dao;

import ro.cmm.domain.Car;

import java.util.Collection;

/**
 * @author Emanuel Pruker
 */
public interface CarDAO extends BaseDAO<Car>{

    Collection<Car> searchByName(String query);
}
