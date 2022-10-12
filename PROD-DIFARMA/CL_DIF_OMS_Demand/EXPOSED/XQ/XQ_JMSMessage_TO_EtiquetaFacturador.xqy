xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../XSD/XSD_Ordenes.xsd" ::)
declare namespace ns1="http://difarma.com/order/etiquetaRequest";
(:: import schema at "../../Resources/etiquetaRequest.xsd" ::)

declare variable $input as element() (:: schema-element(Order) ::) external;

declare function local:func($input as element() (:: schema-element(Order) ::)) as element() (:: schema-element(ns1:Root-Element) ::) {
    <ns1:Root-Element>
        <ns1:trxHdr>
            <ns1:version>{'1.0'}</ns1:version>
            <ns1:context>
                <ns1:idCompany>{'DIFARMA'}</ns1:idCompany>
                <ns1:idCountry>{data($input/OriginAddress/@Country)}</ns1:idCountry>
                <ns1:idStore>{data('CRUZ VERDE CHILE')}</ns1:idStore>
                <ns1:idChannel>{'OMS'}</ns1:idChannel>
            </ns1:context>
            <ns1:trxClientExecDate>{data('2019-09-05T12:56:14.876')}</ns1:trxClientExecDate>
        </ns1:trxHdr>
        <ns1:trxIdentify>
            <ns1:orderType>{'7'}</ns1:orderType>
            <ns1:idEvent>{'1'}</ns1:idEvent>
            <ns1:idOrder>{data($input/@OrderNo)}</ns1:idOrder>
        </ns1:trxIdentify>
        <ns1:trxData>
            <ns1:label>
                <ns1:preffixOrderNumber>{data('C')}</ns1:preffixOrderNumber>
                <ns1:orderNumber>{data($input/@OrderNo)}</ns1:orderNumber>
                <ns1:type>{data('DAD')}</ns1:type>
                <ns1:receiver>
                    <ns1:name>{data(concat($input/PersonInfoShipTo/@FirstName, ';' ,($input/PersonInfoShipTo/@LastName)))}</ns1:name>
                    <ns1:legalId>{'17257392-4'}</ns1:legalId>
                </ns1:receiver>
                <ns1:originBranchOffice>
                    <ns1:id>{data($input/@Origin)}</ns1:id>
                    <ns1:name>{'PENDIENTE'}</ns1:name>
                </ns1:originBranchOffice>
                <ns1:destination>
                    <ns1:branchOfficeId>{data($input/@Destination)}</ns1:branchOfficeId>
                    <ns1:branchOfficeName>{data('PENDIENTE')}</ns1:branchOfficeName>
                    <ns1:address>
                        <ns1:street>{fn:substring(data($input/PersonInfoShipTo/@AddressLine1),0,120)}</ns1:street>
                        <ns1:number>{fn:substring(data($input/PersonInfoShipTo/@AddressLine2),0,20)}</ns1:number>                        
                        <ns1:appartmentNumber>{data($input/PersonInfoShipTo/@AddressLine3)}</ns1:appartmentNumber>
                        <ns1:country>{data($input/PersonInfoShipTo/@Country)}</ns1:country>
                        <ns1:state>{data($input/PersonInfoShipTo/@State)}</ns1:state>
                        <ns1:city>{data($input/PersonInfoShipTo/@City)}</ns1:city>
                        <ns1:municipality>{data($input/PersonInfoShipTo/@AddressLine4)}</ns1:municipality>
                    </ns1:address>
                </ns1:destination>
            </ns1:label>
        </ns1:trxData>
    </ns1:Root-Element>
};

local:func($input)