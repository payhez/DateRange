package com.intecon.daterange.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.intecon.daterange.service.DateRangeService;
import com.intecon.daterange.model.DateObject;
import com.intecon.daterange.model.QueriedObject;

/**
 * Servlet implementation class DateRangeServlet
 */
@WebServlet("/DateRangeServlet")
public class DateRangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DateRangeService service;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DateRangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Gson gson= new Gson();
		String json="";
		String json_req ="";
		
		service = new DateRangeService();	
		
		final BufferedReader br = new BufferedReader(new InputStreamReader((InputStream) request.getInputStream(), Charset.forName("UTF-8")));
		if (br != null) {
			json_req = br.readLine();
		}
		
		DateObject date = gson.fromJson(json_req, DateObject.class);
		
		try {
				
			List<Object> objectList = new ArrayList<>();
			
			objectList =service.fetch(date.getStartDate(), date.getEndDate());
			
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
			   //same way for all obj[2], obj[3], obj[4]
			}
			json=gson.toJson(queriedObjectList);
			
			System.out.println(json);
			
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
		    response.getWriter().write(json);
		    
		} catch (Exception ex) {
			
			throw new ServletException(ex);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}