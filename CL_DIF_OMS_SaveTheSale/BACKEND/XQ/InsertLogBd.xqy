xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/REST_SaveTheSale_CreateXml_request";
(:: import schema at "../../EXPOSED/XSD/SaveTheSaleRq.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/PRC_INSERTAR_LOG_STS";
(:: import schema at "../../Resources/PRC_INSERTAR_LOG_STS_sp.xsd" ::)

declare variable $rqOrderId as element() (:: schema-element(ns1:Root-Element) ::) external;
declare variable $rqRequestJson as xs:string external;
declare variable $rqXmlOms as xs:string external;

declare function local:func($rqOrderId as element() (:: schema-element(ns1:Root-Element) ::), 
                            $rqRequestJson as xs:string, 
                            $rqXmlOms as xs:string) 
                            as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:P_FECHATRX>{fn:concat(fn:substring(string(fn:current-dateTime()), 0,20), '.000')}</ns2:P_FECHATRX>
        <ns2:P_JSONDESDEPOS>{fn:data($rqRequestJson)}</ns2:P_JSONDESDEPOS>
        <ns2:P_XMLPARAOMS>{fn:data($rqXmlOms)}</ns2:P_XMLPARAOMS>
        <ns2:P_ORDENNUMERO>{fn:data($rqOrderId/ns1:orderId)}</ns2:P_ORDENNUMERO>
    </ns2:InputParameters>
};

local:func($rqOrderId, $rqRequestJson, $rqXmlOms)