xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)
declare namespace cvin="CVInventarios";
declare default element namespace "";
(:: import schema at "../XSD/XSD_Ordenes.xsd" ::)

declare variable $input as element() (:: schema-element(Order) ::) external;

declare function local:func($input as element() (:: schema-element(Order) ::)) as element() (:: schema-element(Order) ::) {
    <cvin:registrarOrdenPedidoRq>
        <tipo>I</tipo>
        <local>{data($input/@Origin)}</local>
        <nroOrden>{data($input/@OrderNo)}</nroOrden> 
        <productos>
            {
                for $OrderLine in $input/OrderLines/OrderLine
                return 
                <producto>
                    <idProducto>{fn:data($OrderLine/Item/@ItemID)}</idProducto>
                    <cantidad>{fn:data($OrderLine/@OrderedQty)}</cantidad>
                </producto>
            }
        </productos>
    </cvin:registrarOrdenPedidoRq>
};

local:func($input)