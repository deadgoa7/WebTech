package isep.hem.websockets;

import java.util.Iterator;
import java.util.Set;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import isep.hem.beans.ChatMessage;
import isep.hem.beans.Message;
import isep.hem.beans.UserMessage; 

public class MessageEncoder implements Encoder.Text<Message> {
	public void destroy() {}
	public void init(EndpointConfig arg0) {}
	public String encode(Message message) throws EncodeException {
		String returnString = null;
		if (message instanceof ChatMessage) {
			ChatMessage chatMessage = (ChatMessage) message;
			returnString = Json.createObjectBuilder().add("messageType", chatMessage.getClass().getSimpleName())
                                                     .add("name", chatMessage.getName())
                                                     .add("message", chatMessage.getMessage())
                                                     .add("date", chatMessage.getDate())
                                                     .build().toString();
		} else if (message instanceof UserMessage) {
			UserMessage usersMessage = (UserMessage) message;
			returnString = buildJsonUsersData(usersMessage.getUsers(), usersMessage.getClass().getSimpleName());
		}
		return returnString;
	}
	private  String buildJsonUsersData(Set<String> set, String messageType) { 
        Iterator<String> iterator = set.iterator();
        JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();
        while (iterator.hasNext()) jsonArrayBuilder.add(iterator.next());
        return Json.createObjectBuilder().add("messageType", messageType)
        		                         .add("users", jsonArrayBuilder)
        		                         .build().toString();
    } 
}
