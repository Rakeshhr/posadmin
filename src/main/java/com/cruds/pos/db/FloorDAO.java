package com.cruds.pos.db;

import java.util.List;

import com.cruds.pos.entity.Floor;

public interface FloorDAO 
{
public boolean createfloor(String name, Long estId);
public List<Floor> getAllfloor();
}
