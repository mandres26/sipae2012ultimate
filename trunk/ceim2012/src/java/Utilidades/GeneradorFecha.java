/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

import java.util.Calendar;

/**
 *
 * @author Ana
 */
public class GeneradorFecha {
    
    public static long getDateFechaFormate(String fecha){
        String f[]=fecha.split("-");
        Calendar c=Calendar.getInstance();
        c.set(Integer.parseInt(f[2]), getMesInNumber(f[1]), Integer.parseInt(f[0]));
                return c.getTimeInMillis();
    }
    
    private static int getMesInNumber(String mes){
        if(mes.equalsIgnoreCase("ene"))
            return 0;
        else if(mes.equalsIgnoreCase("feb"))
            return 1;
        else if(mes.equalsIgnoreCase("mar"))
            return 2;
        else if(mes.equalsIgnoreCase("abr"))
            return 3;
        else if(mes.equalsIgnoreCase("may"))
            return 4;
        else if(mes.equalsIgnoreCase("jun"))
            return 5;
        else if(mes.equalsIgnoreCase("jul"))
            return 6;
        else if(mes.equalsIgnoreCase("ago"))
            return 7;
        else if(mes.equalsIgnoreCase("sep"))
            return 8;
        else if(mes.equalsIgnoreCase("oct"))
            return 9;
        else if(mes.equalsIgnoreCase("nov"))
            return 10;
        else 
            return 11;
       
    }
    
}
