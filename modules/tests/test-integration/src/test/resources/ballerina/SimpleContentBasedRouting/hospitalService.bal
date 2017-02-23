import ballerina.lang.messages;
import ballerina.net.http;
import ballerina.lang.jsons;
import ballerina.lang.strings;

@http:BasePath ("/echannel")
service EchannelService {

    @http:POST
    @http:Path ("/checkAvailability")
    resource availability (message m) {
	       http:ClientConnector nawalokaChannel = create http:ClientConnector("http://localhost:9090");
	       message response = {};
	       json payload = {};
	       json jsonMsg = {};
	       string hospitalName;
	       jsonMsg = messages:getJsonPayload(m);
	       hospitalName=jsons:getString(jsonMsg, "$.CheckAvailability.hospital");

	      if ( strings:equalsIgnoreCase(hospitalName, "nawaloka") ) {
             		response = http:ClientConnector.post(nawalokaChannel, "/nawalokaChannel/checkAvailability", m);
        		reply response;
              }
              else if (strings:equalsIgnoreCase(hospitalName, "central")){
			response = http:ClientConnector.post(nawalokaChannel, "/centralChannel/checkAvailability", m);
        		reply response;
	      }else {
            		payload = `{"Status":"Not Found."}`;
              }
	       
	       
        
   }
}

