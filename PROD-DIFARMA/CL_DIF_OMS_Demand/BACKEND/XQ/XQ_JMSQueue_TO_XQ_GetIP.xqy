xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="CVInventarios";
(:: import schema at "../XSD/XSD_RegistrarOrdenPedidoRq.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_PrcGetIpByLocal";
(:: import schema at "../../Resources/db_PrcGetIpByLocal_sp.xsd" ::)

declare variable $localRequest as element() (:: schema-element(ns1:registrarOrdenPedidoRq) ::) external;

declare function local:func($localRequest as element() (:: schema-element(ns1:registrarOrdenPedidoRq) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        {
            if ($localRequest/destinationIP)
            then <ns2:P_LOCAL>{fn:data($localRequest/destinationIP)}</ns2:P_LOCAL>
            else ()
        }
        {
            if (fn:data($localRequest/local) = "1999")
            then <ns2:P_NUMCADENA>10</ns2:P_NUMCADENA>
            else (<ns2:P_NUMCADENA>40</ns2:P_NUMCADENA>)
        }
        {
            if (fn:data($localRequest/local) = "1999")
            then <ns2:P_ORGID>86</ns2:P_ORGID>
            else (<ns2:P_ORGID>98</ns2:P_ORGID>)
        }   
    </ns2:InputParameters>
};

local:func($localRequest)