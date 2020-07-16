package org.assignment.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    public DateUtils(){

    }

    public boolean isABeforeB(String ATime,String BTime){
        Date A = null;
        Date B = null;
        try {
            A = sdf.parse(ATime);
            B = sdf.parse(BTime);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return A.before(B);
    }

    public boolean isNowBeforeB(String BTime){
        Date now = new Date();
        Date B = null;
        if (BTime.matches("\\d+-\\d+-\\d+"))
            BTime = BTime+" 23:59:59";
        try {
            B = sdf.parse(BTime);

        } catch (ParseException e) {
            e.printStackTrace();
        }
        return now.before(B);
    }

    public String getNowTime(){
        return sdf.format(new Date());
    }

}
