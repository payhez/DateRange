package com.intecon.daterange.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.intecon.daterange.data.DateRangeData;
import com.intecon.daterange.model.QueriedObject;

public class DateRangeService {
	
	private DateRangeData dataProcess = new DateRangeData();
	
	public List<QueriedObject> fetch(String startDate, String endDate) {
		
		List<Object> objectList = new ArrayList<>();
		
		objectList = dataProcess.fetch(startDate, endDate);
		
		Iterator<Object> itr = objectList.iterator();
		
		List<QueriedObject> queriedObjectList = new ArrayList<>();
		
		while(itr.hasNext()){
		   Object[] obj = (Object[]) itr.next();
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
