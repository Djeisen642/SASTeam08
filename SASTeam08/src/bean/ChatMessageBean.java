package bean;

import java.util.Date;

public class ChatMessageBean {
	
	private String message;
	private String sender;
	private String senderAvatar;
	private Date received;
	
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public Date getReceived() {
		return received;
	}
	public void setReceived(Date received) {
		this.received = received;
	}
	public String getSenderAvatar() {
		return senderAvatar;
	}
	public void setSenderAvatar(String senderAvatar) {
		this.senderAvatar = senderAvatar;
	}
}
