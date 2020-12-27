package com.intecon.daterange.data;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.intecon.daterange.model.*;

public class DateRangeDao {
	
	SessionFactory factory = new Configuration()
								.configure()
								.addAnnotatedClass(Tfeft000.class)
								.addAnnotatedClass(Tfedf000.class)
								.buildSessionFactory();
	
	Session session = factory.getCurrentSession();
	
	
	public List<Object> fetch(String startDate, String endDate) {

		
		List<Object> objectList = new ArrayList<>();
		
		try {
			session.beginTransaction();
			objectList = (List<Object>) session.createQuery("select DF.edef as edef, TF.aspTaxId as aspTaxId, DF.comp as comp, DF.kunv as kunv, count(TF.aspTaxId) as countASPTaxId, TF.invstat as invstat from Tfeft000 as TF inner join Tfedf000 as DF on DF.comp = TF.comp  where  TF.invstat in('07','16','08','05') and TF.invtype='E' and TF.crt_tst between '"+startDate+"' and '"+endDate+"' group by TF.aspTaxId").getResultList();
			session.getTransaction().commit();
		}catch (Exception e) {
			System.out.println(e);
			return null;
		}finally {
			factory.close();
		}
		
		return objectList;
	}
}