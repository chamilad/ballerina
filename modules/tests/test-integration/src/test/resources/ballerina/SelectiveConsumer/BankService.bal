@http:BasePath("/bankCreditService")
service BankCreditService{

    @http:POST
    @http:Path ("/specialityCreditDep")
    resource specialityCreditDep (message m) {
        reply m;
    }

    @http:POST
    @http:Path ("/normalCreditDep")
    resource normalCreditDep (message m) {
        reply m;
    }
}

@http:BasePath("/bankCardService")
service BankCardService{

    @http:POST
    @http:Path ("/specialityCustomerDep")
    resource specialityCustomerDep (message m) {
        reply m;
    }

    @http:POST
    @http:Path ("/normalCustomerDep")
    resource normalCustomerDep (message m) {
        reply m;
    }
}