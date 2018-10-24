package com.cruds.pos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cruds.pos.db.FloorDAO;
import com.cruds.pos.entity.Floor;
@Service
public class FloorService
{
	@Autowired
	FloorDAO fdao;
	
	public boolean createFloor(String name, Long estId)
	{
		return fdao.createfloor(name, estId);
	}
	public List<Floor> getAllfloor()
	{
		return fdao.getAllfloor();
	}
}
