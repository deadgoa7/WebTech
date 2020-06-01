package isep.hem.websockets;

import javax.websocket.server.ServerEndpoint;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpSession;
import javax.websocket.EncodeException;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;

import isep.hem.websockets.MessageDecoder;
import isep.hem.websockets.MessageEncoder;
import isep.hem.websockets.ChatServerEndpointConfig;

import isep.hem.beans.ChatMessage;
import isep.hem.beans.Message;

@ServerEndpoint(value = "/ChatServerEndpoint", encoders = { MessageEncoder.class }, decoders = { MessageDecoder.class },
											   configurator = ChatServerEndpointConfig.class )
public class ChatServerEndpoint  {
	
	private HttpSession httpSession;
	private String email;
	
	static Set<Session> userWSession = Collections.synchronizedSet(new HashSet<Session>());
	static Set<HttpSession> userSessions = Collections.synchronizedSet(new HashSet<HttpSession>());
	
	@OnOpen
	public void handleOpen(Session userSession, EndpointConfig config) throws IOException, EncodeException {
		this.httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		
		email = (String) httpSession.getAttribute("email");
		
		userWSession.add(userSession);
		userSessions.add(this.httpSession);
		
		ChatMessage outgoingChatMessage = new ChatMessage();
		userSession.getUserProperties().put("username", email);
		outgoingChatMessage.setName("Home Exchange Manager");
		outgoingChatMessage.setDate("");
		outgoingChatMessage.setDestinataire("");
		outgoingChatMessage.setMessage("Bienvenue sur votre messagerie " + email + " !");
		userSession.getBasicRemote().sendObject(outgoingChatMessage);
	}
	
	@OnMessage
	public void handleMessage(Message incomingMessage, Session userSession) throws IOException, EncodeException {
		
		if (incomingMessage instanceof ChatMessage) {
			
			ChatMessage incomingChatMessage = (ChatMessage)incomingMessage;
			ChatMessage outgoingChatMessage = new ChatMessage();
			
			String username = (String) userSession.getUserProperties().get("username");	
			
	    		outgoingChatMessage.setName(username);
	    		outgoingChatMessage.setDate(incomingChatMessage.getDate());
	    		outgoingChatMessage.setDestinataire(incomingChatMessage.getDestinataire());
	    		outgoingChatMessage.setMessage(incomingChatMessage.getMessage());
	    		
	    		sendNotification(outgoingChatMessage.getDestinataire());
	    		
	    		Iterator<Session> iterator = userWSession.iterator();
	    		while (iterator.hasNext()) {
	    			Session element = iterator.next();
	    			if (   element.getUserProperties().get("username").toString().equals(outgoingChatMessage.getDestinataire()) 
	    				|| element.getUserProperties().get("username").toString().equals(outgoingChatMessage.getName()) ) {
	    				element.getBasicRemote().sendObject(outgoingChatMessage);
	    			}
	    		}
	    		
		}
		
	}
	
	@OnClose
	public void handleClose(Session userSession) throws IOException, EncodeException {
	}
	
	public void sendNotification(String destinataire) {
		for (HttpSession httpsession : userSessions ) {
			if (httpsession.getAttribute("email").equals(destinataire)) {
				httpsession.setAttribute("newMessage", true);
			}
		}
	}
}

