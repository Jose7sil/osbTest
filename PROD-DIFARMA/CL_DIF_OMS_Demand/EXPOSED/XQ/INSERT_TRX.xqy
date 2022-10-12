xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/INSERT_POS_TRX";
(:: import schema at "../../Resources/INSERT_POS_TRX_sp.xsd" ::)

declare variable $request as xs:string external;
declare variable $response as xs:string external;
declare variable $numerodoc as xs:string external;



declare function local:func($request as xs:string, $response as xs:string, $numeroDoc as xs:string) as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
          <ns1:P_REQUEST>{fn:data($request)}</ns1:P_REQUEST>
        <ns1:P_RESPONSE>{fn:data($response)}</ns1:P_RESPONSE>
        <ns1:P_NUMERO_DOC>{fn:data($numerodoc)}</ns1:P_NUMERO_DOC>
        <ns1:P_ORIGEN>{fn:data('DEMAND')}</ns1:P_ORIGEN>
    </ns1:InputParameters>
};

local:func($request, $response, $numerodoc)