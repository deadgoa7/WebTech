var webSocket = new WebSocket('ws://localhost:8090/WebTechProject/ChatServerEndpoint');
		    
webSocket.onmessage = function processMessage(incomingMessage) {
	var jsonData = JSON.parse(incomingMessage.data);
	if (jsonData.messageType == "ChatMessage") messagesTextArea.value += jsonData.date + ' ' + jsonData.name + ' - ' + jsonData.message+'\n';	    	
}

function send() {
	var today = new Date();
	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	var time = today.getHours() + ":" + today.getMinutes() ;
	var dateTime = date+' '+time;
	webSocket.send(JSON.stringify({'message' : messagetextField.value, 'date' : dateTime, 'destinataire': dest.value }));
	messagetextField.value = "";
}

window.onbeforeunload = function doSomething() {
	webSocket.onclose = function () {}; 
	webSocket.close();
};