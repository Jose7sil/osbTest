xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="CVInventarios";
(:: import schema at "../XSD/XSD_RegistrarOrdenPedidoRq.xsd", 
                     "../WSDL/BS0001_Ordenes.wsdl" ::)

declare variable $registrarOrdenPedidoLocalRq as element() (:: schema-element(ns1:registrarOrdenPedidoRq) ::) external;

declare function local:func($registrarOrdenPedidoLocalRq as element() (:: schema-element(ns1:registrarOrdenPedidoRq) ::)) as element() (:: schema-element(ns1:WSOrdenEcommerce.Execute) ::) {
    <ns1:WSOrdenEcommerce.Execute>
      
        <ns1:Sdtordenecommerce>
              <ns1:Tipo>{fn:data($registrarOrdenPedidoLocalRq/tipo)}</ns1:Tipo>
                <ns1:LocalEcommerce>{fn:data($registrarOrdenPedidoLocalRq/local)}</ns1:LocalEcommerce>
                <ns1:NroOrden>{fn:data($registrarOrdenPedidoLocalRq/nroOrden)}</ns1:NroOrden>
               <ns1:UsuarioId>{fn:data($registrarOrdenPedidoLocalRq/usuarioId)}</ns1:UsuarioId>
                 <ns1:UsuarioRut>{fn:data($registrarOrdenPedidoLocalRq/usuarioRut)}</ns1:UsuarioRut>
 
        
        
                <ns1:Producto>
               { for $producto in $registrarOrdenPedidoLocalRq/productos/producto return
                    <ns1:ProductoItem>
                            <ns1:ProductoId>{fn:data($producto/idProducto)}</ns1:ProductoId>
                            <ns1:Cantidad>{fn:data($producto/cantidad)}</ns1:Cantidad>
                    </ns1:ProductoItem>}
                </ns1:Producto>
        </ns1:Sdtordenecommerce>
    </ns1:WSOrdenEcommerce.Execute>
};

local:func($registrarOrdenPedidoLocalRq)