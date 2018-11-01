package com.cruds.pos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cruds.pos.db.FloorDAO;
import com.cruds.pos.entity.Floor;
import com.cruds.pos.entity.FloorTable;
import com.cruds.pos.formbean.FloorFormBean;
import com.cruds.pos.formbean.TableFormBean;
@Service
public class FloorService
{
	@Autowired
	FloorDAO fdao;
	
	public boolean createFloor(FloorFormBean floorFormBean, Long estId)
	{
		return fdao.createfloor(floorFormBean.getName(), estId);
	}
	public List<Floor> getAllfloor(Long estId)
	{
		return fdao.getAllfloor(estId);
	}
	
	public boolean createFloorTable(TableFormBean tableFormBean, Long floorId)
	{
		
			return fdao.createTable(tableFormBean.getTableName(), floorId, tableFormBean.getMaxNo());
	
	}
	
	public List<FloorTable>  getAllTable(Long floorId)
	{
		return fdao.getAllTable(floorId);
	}
	
	
}
