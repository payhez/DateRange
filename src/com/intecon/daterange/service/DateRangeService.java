package com.intecon.daterange.service;

import java.util.List;

import com.intecon.daterange.data.DateRangeDao;
import com.intecon.daterange.model.QueriedObject;

public class DateRangeService {
	
	private DateRangeDao dao = new DateRangeDao();
	
	public List<Object> fetch(String startDate, String endDate) {
		
		List<Object> objectList = dao.fetch(startDate, endDate);
		/*for (QueriedObject theObject : objectList) {
			if(theObject.getEdef()==null) {
				theObject.setEdef("null");
			}
        }*/
		
		return objectList;
	}
}
