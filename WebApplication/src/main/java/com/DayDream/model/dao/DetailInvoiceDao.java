/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DayDream.model.dao;

import com.DayDream.model.entity.DetailInvoice;

/**
 *
 * @author ADMIN
 */
public class DetailInvoiceDao extends HibernateDao<DetailInvoice> implements IHibernateDao<DetailInvoice> {
     @Override
    public DetailInvoice insert(DetailInvoice detailInvoice) {
        return super.insert(detailInvoice);
    }
    
    @Override
    public DetailInvoice update(DetailInvoice detailInvoice) {
        return super.update(detailInvoice);
    }
    
    @Override
    public DetailInvoice delete(DetailInvoice detailInvoice) {
        return super.delete(detailInvoice);
    }
    
    @Override
    public DetailInvoice get(DetailInvoice detailInvoice) {
        return null;
    }
}
