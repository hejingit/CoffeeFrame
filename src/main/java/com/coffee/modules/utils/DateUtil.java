package com.coffee.modules.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
    
    public static Date subDate(Date originDate,int subDays){
        Calendar cal = Calendar.getInstance();
        cal.setTime(originDate);
        cal.add(Calendar.DAY_OF_MONTH, subDays);
        return cal.getTime();
    }
    
    public static Date setHMSzero(Date originDate){
        Calendar cal = Calendar.getInstance();
        cal.setTime(originDate);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        
        return cal.getTime();
    }
    
    public static Date subDateHMSzero(Date originDate,int subDays){
        return subDate(setHMSzero(originDate), subDays);
    }
    
    public static String formatDate(Date date,String format){
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(date);
    }
    
    public static boolean isServicingTime(){
        int start1 = 16;
        int end1 = 17;
        int start2 = 21;
        int end2 = 23;
        int minute = 59;
        Calendar cal = Calendar.getInstance();
        //获取当前时间
        long curTime = cal.getTimeInMillis();
        cal.set(Calendar.HOUR_OF_DAY, start1);
        cal.set(Calendar.MINUTE, minute);
        long startTime1 = cal.getTimeInMillis();
        cal.set(Calendar.HOUR_OF_DAY, end1);
        cal.set(Calendar.MINUTE, minute);
        long endTime1 = cal.getTimeInMillis();
        cal.set(Calendar.HOUR_OF_DAY, start2);
        cal.set(Calendar.MINUTE, minute);
        long startTime2 = cal.getTimeInMillis();
        cal.set(Calendar.HOUR_OF_DAY, end2);
        cal.set(Calendar.MINUTE, minute);
        long endTime2 = cal.getTimeInMillis();
        if((curTime < endTime1 && curTime > startTime1)||(curTime < endTime2 && curTime > startTime2)){
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        System.out.println(isServicingTime());
    }

}
