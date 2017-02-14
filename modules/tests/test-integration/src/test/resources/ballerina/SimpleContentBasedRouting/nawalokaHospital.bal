import ballerina.lang.message;

@BasePath ("/nawalokaChannel")
service NawalokaEchannelService {

    @POST
    @Path ("/checkAvailability")
    resource availability (message m) {
	       message response = {};
	       json payload = {};
	       json incomingMsg = {};
	         
		payload = `{"AvailabilityDetails": {"ID": "123", "Name": "TestDoctor","Speclization": "test"}}`;
		message:setJsonPayload(response, payload);
        	reply response;
        
   }
}

