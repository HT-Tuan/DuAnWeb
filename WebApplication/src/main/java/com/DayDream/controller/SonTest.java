package com.DayDream.controller;

import com.DayDream.model.dao.CartDao;
import com.DayDream.model.dao.CustomerDao;
import com.DayDream.model.entity.Cart;
import com.DayDream.model.entity.Customer;
import com.DayDream.model.entity.Product;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;

public class SonTest {
    public static void main(String[] args) throws SQLException{
    
        // BigDecimal total = new BigDecimal(0.00);
        
        // BigDecimal price = new BigDecimal(2.00);
        // BigDecimal temp = price.multiply(BigDecimal.valueOf(5));
        // total = total.add(temp);
     
        String productPrice = "25.000";
        Float litersOfPetrol = Float.parseFloat(productPrice);
        DecimalFormat df = new DecimalFormat("0.000");       
        System.out.println(df.format(litersOfPetrol));
    }
}
