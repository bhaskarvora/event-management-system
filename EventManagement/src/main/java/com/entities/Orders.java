package com.entities;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;

@Entity
@Table(name="Orders")
public class Orders {
	
	@javax.persistence.Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int Id;
	
	private int UserId;
	private int AmountPaid;
	private String Name;
	private String Email;
	private String Phone;
	private String Address;
	private String Events;
	private String PaymentMethod;
	
	private Date FromDate;
	private Date ToDate;
	
	
	public Orders(int userId, int amountPaid, String name, String email, String phone, String address,
			String events, String paymentMethod, Date fromDate, Date toDate) {
		super();
		UserId = userId;
		AmountPaid = amountPaid;
		Name = name;
		Email = email;
		Phone = phone;
		Address = address;
		Events = events;
		PaymentMethod = paymentMethod;
		FromDate = fromDate;
		ToDate = toDate;
	}
//	public Orders(int userId, int amountPaid, String name, String email, String phone, String address,
//			String equipments, String paymentMethod) {
//		super();
//		UserId = userId;
//		AmountPaid = amountPaid;
//		Name = name;
//		Email = email;
//		Phone = phone;
//		Address = address;
//		Equipments = equipments;
//		PaymentMethod = paymentMethod;
//	}
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getUserId() {
		return UserId;
	}
	public void setUserId(int userId) {
		UserId = userId;
	}
	public int getAmountPaid() {
		return AmountPaid;
	}
	public void setAmountPaid(int amountPaid) {
		AmountPaid = amountPaid;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhone() {
		return Phone;
	}
	public void setPhone(String phone) {
		Phone = phone;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getEvents() {
		return Events;
	}
	public void setEvents(String events) {
		Events = events;
	}
	public String getPaymentMethod() {
		return PaymentMethod;
	}
	public void setPaymentMethod(String paymentMethod) {
		PaymentMethod = paymentMethod;
	}
	public Date getFromDate() {
		return FromDate;
	}
	public void setFromDate(Date fromDate) {
		FromDate = fromDate;
	}
	public Date getToDate() {
		return ToDate;
	}
	public void setToDate(Date toDate) {
		ToDate = toDate;
	}
	
	
	
}
