import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.jsons;
import ballerina.lang.strings;

@http:BasePath("/selectiveConsumer")
service SelectiveConsumerService{

    @http:POST
    @http:Path ("/invoke")
    resource selectiveConsumerResource (message m) {
        message response;

        response = requestSender(m);
        reply response;
    }
}

function validateRequest(message msg)(boolean validationStatus){
    json payload;
    string crediability;

    payload = messages:getJsonPayload(msg);
    crediability = jsons:getString(payload, "$.creditRequest.checkStatus");
    if(strings:equalsIgnoreCase(crediability, "special")){
        validationStatus = true;
    }
    else{
        validationStatus = false;
    }
    return;
}

function requestSender(message incomingMsg)(message response){
    http:ClientConnector ep = create http:ClientConnector ("http://localhost:9090");

    boolean status;

    status = validateRequest(incomingMsg);
    if(status){
        response = http:ClientConnector.post(ep, "/bankCreditService/specialityCreditDep", incomingMsg);
    }
    else{

    }
    return;

}
