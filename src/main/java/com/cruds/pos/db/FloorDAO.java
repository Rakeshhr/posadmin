package com.cruds.pos.db;

import java.util.List;

import com.cruds.pos.entity.Floor;
import com.cruds.pos.entity.FloorTable;

public interface FloorDAO 
{
public boolean createfloor(String name, Long estId);
public List<Floor> getAllfloor(Long estId);
public boolean createTable(String tableName, Long floorId, int maxCap);
public List<FloorTable> getAllTable(Long floorId);

}
