xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/REST_SaveTheSale_CreateXml_request";
(:: import schema at "../../EXPOSED/XSD/SaveTheSaleRq.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/PRC_INSERTAR_LOG_STS";
(:: import schema at "../../Resources/PRC_INSERTAR_LOG_STS_sp.xsd" ::)

declare variable $rqInsert as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($rqInsert as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:P_FECHATRX>{fn:concat(fn:substring(string(fn:current-dateTime()), 0,20), '.000')}</ns2:P_FECHATRX>
        <ns2:P_JSONDESDEPOS>pruebaOsb</ns2:P_JSONDESDEPOS>
        <ns2:P_XMLPARAOMS>pruebaOsb</ns2:P_XMLPARAOMS>
        <ns2:P_ORDENNUMERO>{fn:data($rqInsert/ns1:orderId)}</ns2:P_ORDENNUMERO>
    </ns2:InputParameters>
};

local:func($rqInsert)