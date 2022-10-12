xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../EXPOSED/XSD/XSD_Ordenes.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/db_PRC_INSERT_DEMAND_FAC";
(:: import schema at "../../Resources/db_PRC_INSERT_DEMAND_FAC_sp.xsd" ::)

declare variable $input as element() (:: schema-element(Order) ::) external;

declare function local:func($input as element() (:: schema-element(Order) ::)) as element() (:: schema-element(ns1:InputParameters) ::) {
    <ns1:InputParameters>
        <ns1:P_NROORDEN>{fn:data($input/@OrderNo)}</ns1:P_NROORDEN>
        {
        if(exists($input/References/Reference)) then
            for $valor in $input/References/Reference return
                if(exists($valor/@Name) and ($valor/@Name eq 'BOLETA_ID'))
                then <ns1:P_NROBOLETA>{fn:data($valor/@Value)}</ns1:P_NROBOLETA>
                else ()
        else <ns1:P_NROBOLETA>0</ns1:P_NROBOLETA>
        }
        <ns1:P_IDLOCAL>{
        let $enterpriseCode := fn:data($input/@EnterpriseCode)
        return
        if($enterpriseCode = "FCVChile")
        then fn:data("1999")
        else(fn:data($input/@Origin))
        }</ns1:P_IDLOCAL>
        <ns1:P_IDLOCAL_DESPACHA>{fn:data($input/@Origin)}</ns1:P_IDLOCAL_DESPACHA>
        <ns1:P_IDVENDEDOR>{fn:data($input/OriginAddress/@PersonID)}</ns1:P_IDVENDEDOR>
        <ns1:P_ORIGEN>{fn:data('DEMAND_OSB')}</ns1:P_ORIGEN>
        {
          if(fn:data($input/@EnterpriseCode) = 'MCOChile')
          then <ns1:P_EMPRESA>98</ns1:P_EMPRESA>     
          else(<ns1:P_EMPRESA>86</ns1:P_EMPRESA>)
        }
        {
          if(fn:data($input/@EnterpriseCode) = 'MCOChile')
          then <ns1:P_CADENA>40</ns1:P_CADENA>     
          else(<ns1:P_CADENA>10</ns1:P_CADENA>)
        }
        {
        if(exists($input/References/Reference)) then
            for $valor in $input/References/Reference return
                if(exists($valor/@Name) and ($valor/@Name eq 'BOLETA_ID'))
                then <ns1:P_CORRELATIVO_TRX>{fn:concat(fn-bea:date-to-string-with-format("yyyy",current-date()),fn:data($valor/@Value))}</ns1:P_CORRELATIVO_TRX>
                else ()
        else <ns1:P_CORRELATIVO_TRX>0</ns1:P_CORRELATIVO_TRX>
        }
        <ns1:P_FECHA_HORA>{fn:data($input/@OrderDate)}</ns1:P_FECHA_HORA>
        <ns1:P_ESTADO_TRX>0</ns1:P_ESTADO_TRX>
        <ns1:P_TIPO_VENTA>VTA</ns1:P_TIPO_VENTA>
    </ns1:InputParameters>
};

local:func($input)