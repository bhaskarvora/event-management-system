package com.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Table;

@Entity
@Table(name="Cart")
public class AddEvent {
	
	@javax.persistence.Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int Id;
	private int UserId;
	private int EventId;
	private String EventName;
	private String EventImage;
	private String EventPrice;
	
	
	public AddEvent(int userId, int eventId, String eventName, String eventImage, String eventPrice) {
		super();
		UserId = userId;
		EventId = eventId;
		EventName = eventName;
		EventImage = eventImage;
		EventPrice = eventPrice;
	}
		
	public AddEvent() {
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
	public int getEventId() {
		return EventId;
	}
	public void setEventId(int eventId) {
		EventId = eventId;
	}
	public String getEventName() {
		return EventName;
	}
	public void setEventName(String eventName) {
		EventName = eventName;
	}
	public String getEventImage() {
		return EventImage;
	}
	public void setEventImage(String eventImage) {
		EventImage = eventImage;
	}
	public String getEventPrice() {
		return EventPrice;
	}
	public void setEventPrice(String eventPrice) {
		EventPrice = eventPrice;
	}
	

}
