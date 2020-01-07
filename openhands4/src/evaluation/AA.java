package evaluation;

import java.awt.List;
import java.sql.Date;
import java.util.Calendar;

public class AA {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		package test;

		import java.text.SimpleDateFormat;
		import java.util.ArrayList;
		import java.util.Calendar;
		import java.util.List;

		public class WorkingDays {

		public static void main(String[] args) {
		System.out.println("start");

		String startMM="201905";
		String endMM="201907";

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		try{
		String startDate=startMM+"01";
		Calendar start=Calendar.getInstance();

		int syyyy=Integer.partInt(startMM.substring(0,4));
		int smm=Integer.partInt(endMM.substring(4,6));

		start.set(Calendar.YEAR, syyyy);
		start.set(Calendar.MONTH, smm);

		int eyyyy=Integer.partInt(endMM.substring(0,4));

		int emm=Integer.partInt(endMM.substring(4,6));

		end.set(Calendar.YEAR, eyyyy);
		end.set(Calendar.MONTH, emm);

		int endDay=start.getActualMaximum(start.DAY_OF_MONTH);
		String endDate=endMM+endDay;

		start.setTime(sdf.parse(startDate));

		Calendar end = Calendar.getInstance();
		end.setTime(sdf.parse(endDate));

		int workingDays = 0;

		List alHoliday=new ArrayList();
		alHoliday.add("20190501");
		alHoliday.add("20190606");

		while( !start.after(end) ){
		int day=start.get(Calendar.DAY_OF_WEEK);
		if( (day != Calendar.SATURDAY) && (day != Calendar.SUNDAY) && !alHoliday.contains(startDate) ){
		workingDays++;
		}
		start.add(Calendar.DATE, 1);
		startDate = sdf.format(start.getTime());
		}
		System.out.println("workingDays="+workingDays);

		}catch(Exception e){
		e.printStackTrace();
		}

		System.out.println("end");
		}

		}

		
}
