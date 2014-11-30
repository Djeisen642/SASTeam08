package chat;

import bean.ChatMessageBean;

import org.json.*;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;
 
public class ChatMessageEncoder implements Encoder.Text<ChatMessageBean> {
	@Override
	public void init(final EndpointConfig config) {
	}
 
	@Override
	public void destroy() {
	}
 
	@Override
	public String encode(final ChatMessageBean chatMessage) throws EncodeException {
		JSONObject obj = new JSONObject();
		obj.put("message", chatMessage.getMessage());
		obj.put("sender", chatMessage.getSender());
		obj.put("received", chatMessage.getReceived().toString());
		obj.put("avatar", chatMessage.getSenderAvatar());
		return obj.toString();
	}
}
