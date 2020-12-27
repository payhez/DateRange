package com.intecon.daterange.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.intecon.daterange.data.DateRangeDao;
import com.intecon.daterange.model.QueriedObject;

public class DateRangeService {
	
	private DateRangeDao dao = new DateRangeDao();
	
	public List<QueriedObject> fetch(String startDate, String endDate) {
		
		List<Object> objectList = new ArrayList<>();
		
		objectList = dao.fetch(startDate, endDate);
		
		Iterator itr = objectList.iterator();
		
		List<QueriedObject> queriedObjectList = new ArrayList<>();
		
		while(itr.hasNext()){
		   Object[] obj = (Object[]) itr.next();
		   //now you have one array of Object for each row
		   String edef = String.valueOf(obj[0]);
		   String aspTaxId = String.valueOf(obj[1]);
		   Integer comp = Integer.parseInt(String.valueOf(obj[2]));
		   String kunv = String.valueOf(obj[3]);
		   Integer countAspTaxId = Integer.parseInt(String.valueOf(obj[4]));
		   String invstat = String.valueOf(obj[5]);
		   QueriedObject theObject = new QueriedObject(edef, aspTaxId, comp, kunv, countAspTaxId, invstat);
		   queriedObjectList.add(theObject);
		}
		
		return queriedObjectList;
	}
}
