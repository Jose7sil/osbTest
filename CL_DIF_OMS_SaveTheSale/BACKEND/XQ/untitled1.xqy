xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://TargetNamespace.com/REST_SaveTheSale_CreateXml_request";
(:: import schema at "../../EXPOSED/XSD/SaveTheSaleRqClone.xsd", 
                     "../../EXPOSED/XSD/SaveTheSaleRq.xsd" ::)

declare variable $rq as element() (:: schema-element(ns1:Root-ElementClone) ::) external;

declare function local:func($rq as element() (:: schema-element(ns1:Root-ElementClone) ::)) as element() (:: schema-element(ns1:Root-Element) ::) {
    <ns1:Root-Element>
        <ns1:clientData>
            <ns1:firstName>{fn:data($rq/ns1:clientData/ns1:firstName)}</ns1:firstName>
            <ns1:id>{fn:data($rq/ns1:clientData/ns1:id)}</ns1:id>
            <ns1:lastName>{fn:data($rq/ns1:clientData/ns1:lastName)}</ns1:lastName>
            <ns1:mail>{fn:data($rq/ns1:clientData/ns1:mail)}</ns1:mail>
            <ns1:phone>{fn:data($rq/ns1:clientData/ns1:phone)}</ns1:phone>
        </ns1:clientData>
        <ns1:originLocal>
            <ns1:address>{fn:data($rq/ns1:originLocal/ns1:address)}</ns1:address>
            <ns1:city>{fn:data($rq/ns1:originLocal/ns1:city)}</ns1:city>
            <ns1:commune>{fn:data($rq/ns1:originLocal/ns1:commune)}</ns1:commune>
            <ns1:localId>{fn:data($rq/ns1:originLocal/ns1:localId)}</ns1:localId>
            <ns1:posId>{fn:data($rq/ns1:originLocal/ns1:posId)}</ns1:posId>
            <ns1:latitude>{fn:data($rq/ns1:originLocal/ns1:latitude)}</ns1:latitude>
            <ns1:longitude>{fn:data($rq/ns1:originLocal/ns1:longitude)}</ns1:longitude>
        </ns1:originLocal>
        <ns1:shipData>
            <ns1:serviceLevel>{fn:data($rq/ns1:shipData/ns1:serviceLevel)}</ns1:serviceLevel>
            <ns1:shipDay>{fn:data($rq/ns1:shipData/ns1:shipDay)}</ns1:shipDay>
            <ns1:storeId>{fn:data($rq/ns1:shipData/ns1:storeId)}</ns1:storeId>
        </ns1:shipData>
        <ns1:deliveryType>{fn:data($rq/ns1:deliveryType)}</ns1:deliveryType>
        <ns1:orderDate>{fn:data($rq/ns1:orderDate)}</ns1:orderDate>
        <ns1:orderId>{fn:data($rq/ns1:orderId)}</ns1:orderId>
        {
            for $products in $rq/ns1:products
            return 
            <ns1:products>
                <ns1:description>{fn:data($products/ns1:description)}</ns1:description>
                <ns1:quantity>{fn:data($products/ns1:quantity)}</ns1:quantity>
                <ns1:sku>{fn:data($products/ns1:sku)}</ns1:sku>
                <ns1:unitPrice>{fn:data($products/ns1:unitPrice)}</ns1:unitPrice>
                <ns1:tax>{fn:data($products/ns1:tax)}</ns1:tax>
            </ns1:products>
        }
    </ns1:Root-Element>
};

local:func($rq)