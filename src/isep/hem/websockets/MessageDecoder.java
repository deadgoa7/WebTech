package isep.hem.websockets;

import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import isep.hem.beans.ChatMessage;
import isep.hem.beans.Message;

public class MessageDecoder implements Decoder.Text<Message> {
	public void destroy() {}
	public void init(EndpointConfig arg0) {}
	public Message decode(String jsonMessage) throws DecodeException {
		ChatMessage chatMessage = new ChatMessage();
		JsonObject jsonObject = Json.createReader(new StringReader(jsonMessage)).readObject();
		chatMessage.setMessage(jsonObject.getString("message"));
		chatMessage.setDate(jsonObject.getString("date"));
		chatMessage.setDestinataire(jsonObject.getString("destinataire"));
		return chatMessage;
	}
	public boolean willDecode(String jsonMessage) {
		boolean flag = true;
		try { Json.createReader(new StringReader(jsonMessage)).readObject();} 
		catch (Exception e) {
			flag = false;
		}
		return flag;
	}
}
