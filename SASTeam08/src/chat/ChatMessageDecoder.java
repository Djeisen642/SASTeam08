package chat;

import bean.ChatMessageBean;

import java.io.StringReader;
import java.util.Date;
 
import org.json.*;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;
 
public class ChatMessageDecoder implements Decoder.Text<ChatMessageBean> {
	@Override
	public void init(final EndpointConfig config) {
	}
 
	@Override
	public void destroy() {
	}
 
	@Override
	public ChatMessageBean decode(final String textMessage) throws DecodeException {
		ChatMessageBean chatMessage = new ChatMessageBean();
		JSONObject obj = new JSONObject(textMessage);
		chatMessage.setMessage(obj.getString("message"));
		chatMessage.setSender(obj.getString("sender"));
		chatMessage.setSenderAvatar(obj.getString("avatar"));
		chatMessage.setReceived(new Date());
		return chatMessage;
	}
 
	@Override
	public boolean willDecode(final String s) {
		return true;
	}
}