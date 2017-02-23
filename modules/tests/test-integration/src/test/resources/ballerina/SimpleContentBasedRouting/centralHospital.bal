import ballerina.lang.messages;

@http:BasePath ("/centralChannel")
service CentralEchannelService {

    @http:POST
    @http:Path ("/checkAvailability")
    resource availability (message m) {
	       message response = {};
	       json payload = {};
	       json incomingMsg = {};
	         
	  	payload = `{"AvailabilityDetails": {"ID": "456", "Name": "TestDoctorCentral","Speclization": "test"}}`;
		messages:setJsonPayload(response, payload);
        	reply response;
        
   }
}

