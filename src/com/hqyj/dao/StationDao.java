package com.hqyj.dao;

import java.util.List;

import com.hqyj.pojo.Station;

public interface StationDao {
	public List<Station> query(String name);
	public int add(Station station);
	public int delete(Integer sid);
}
