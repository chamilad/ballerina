import ballerina.lang.messages;

@http:BasePath ("/nawalokaChannel")
service NawalokaEchannelService {

    @http:POST
    @http:Path ("/checkAvailability")
    resource availability (message m) {
	       message response = {};
	       json payload = {};
	       json incomingMsg = {};
	         
		payload = `{"AvailabilityDetails": {"ID": "123", "Name": "TestDoctor","Speclization": "test"}}`;
		messages:setJsonPayload(response, payload);
        	reply response;
        
   }
}

