package com.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Lob;
import javax.persistence.Table;

import com.mysql.jdbc.Blob;

@Entity
@Table(name="Event")
public class Event {
	
	@javax.persistence.Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int Id;
	private int UserId;
	private String EventName;
	private String EventPrice;
	private String EventDescription;
	
	@Lob
	@Column(columnDefinition="MEDIUMBLOB")
	private byte[] Eventimage;
	



	public Event() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Event(int userId, String eventName, String eventPrice, String eventDescription,
			byte[] eventimage) {
		super();
		UserId = userId;
		EventName = eventName;
		EventPrice = eventPrice;
		EventDescription = eventDescription;
		Eventimage = eventimage;
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
	public String getEventName() {
		return EventName;
	}
	public void setEventName(String eventName) {
		EventName = eventName;
	}
	public String getEventPrice() {
		return EventPrice;
	}
	public void setRentPrice(String eventPrice) {
	     EventPrice = eventPrice;
	}
	public String getEventDescription() {
		return EventDescription;
	}
	public void setEquipmentDescription(String eventDescription) {
		EventDescription = eventDescription;
	}
	public byte[] getEventimage() {
		return Eventimage;
	}


	public void setEventimage(byte[] eventimage) {
		Eventimage = eventimage;
	}
	
	/*
	 * public Blob getEquipmentimage() { return Equipmentimage; }
	 * 
	 * public void setEquipmentimage(Blob equipmentimage) { Equipmentimage =
	 * equipmentimage; }
	 */
	
	
	


}
