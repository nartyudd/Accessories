/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tcd.service.impl;

import com.tcd.pojo.Cart;
import com.tcd.repository.ReceiptRepository;
import com.tcd.service.ReceiptService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class ReceiptServiceImpl implements ReceiptService {
    @Autowired
    private ReceiptRepository receiptRepo;
    
    @Override
    public boolean addReceipt(Map<String, Cart> carts) {
        return this.receiptRepo.addReceipt(carts);
    }
}
