package com.mitrais.rms.dao;

import java.util.List;

public interface Dao<T, ID> {
	
	T find(ID id);
	
	List<T> findAll();
	
	boolean save(String userName, String password);
	
	boolean update(T o);
	
	boolean delete(ID id);

}
