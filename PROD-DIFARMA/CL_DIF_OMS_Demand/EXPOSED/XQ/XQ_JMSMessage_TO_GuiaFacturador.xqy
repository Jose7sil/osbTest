xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../XSD/XSD_Ordenes.xsd" ::)
declare namespace ns1="http://difarma.com/order/guia";
(:: import schema at "../../Resources/guiarRequest.xsd" ::)

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
            <ns1:trxClientExecDate>{fn-bea:remove-timezone-from-dateTime(xs:dateTime(data($input/@OrderDate)))}</ns1:trxClientExecDate>
        </ns1:trxHdr>
         <ns1:trxIdentify>
            <ns1:orderType>{'6'}</ns1:orderType>
            <ns1:idEvent>{'1'}</ns1:idEvent>
            <ns1:idOrder>{data($input/@OrderNo)}</ns1:idOrder>
        </ns1:trxIdentify>
        <ns1:trxData>
            <ns1:deliveryOrder>
                <ns1:deliveryDate>{fn:substring(string(fn:current-date()), 1,10)}</ns1:deliveryDate>
                <ns1:observations></ns1:observations>
                <ns1:driver></ns1:driver>
                <ns1:licensePlate></ns1:licensePlate>
                <ns1:transferType>{data('Otros traslados no venta')}</ns1:transferType>
                <ns1:officeType>{data('Despacho por cuenta del receptor del documento')}</ns1:officeType>
                <ns1:origin>
                    <ns1:branchOfficeName>{data($input/@Origin)}</ns1:branchOfficeName>
                    <ns1:address>
                        <ns1:street>{data($input/OriginAddress/@AddressLine2)}</ns1:street>
                        <ns1:number>{'1'}</ns1:number>
                        <ns1:appartmentNumber>{data($input/OriginAddress/@AddressLine3)}</ns1:appartmentNumber>
                        <ns1:detail></ns1:detail>
                        <ns1:country>{data($input/OriginAddress/@Country)}</ns1:country>
                        <ns1:state>{data($input/OriginAddress/@Region)}</ns1:state>
                        <ns1:city>{data($input/OriginAddress/@City)}</ns1:city>
                        <ns1:municipality>{data($input/OriginAddress/@AddressLine4)}</ns1:municipality>
                        <ns1:postalcode>{data($input/OriginAddress/@ZipCode)}</ns1:postalcode>
                    </ns1:address>
                </ns1:origin>
                <ns1:destination>
                    <ns1:branchOfficeName>{data($input/@Destination)}</ns1:branchOfficeName>
                    <ns1:address>
                        <ns1:street>{data($input/DestinationAddress/@AddressLine2)}</ns1:street>
                         <ns1:number>{'1'}</ns1:number>
                        <ns1:appartmentNumber>{data($input/DestinationAddress/@AddressLine3)}</ns1:appartmentNumber>
                        <ns1:detail></ns1:detail>
                        <ns1:country>{data($input/DestinationAddress/@Country)}</ns1:country>
                        <ns1:state>{data($input/DestinationAddress/@Region)}</ns1:state>
                        <ns1:city>{data($input/DestinationAddress/@City)}</ns1:city>
                        <ns1:municipality>{data($input/DestinationAddress/@AddressLine4)}</ns1:municipality>
                        <ns1:postalcode>{data($input/DestinationAddress/@ZipCode)}</ns1:postalcode>
                    </ns1:address>
                </ns1:destination>
                <ns1:receiver>
                    <ns1:name>{data(concat($input/DestinationAddress/@FirstName, ' ' ,($input/DestinationAddress/@LastName)))}</ns1:name>
                    <ns1:legalId>{data($input/Extn/@ExtnRUNRUTNIT)}</ns1:legalId>
                    <ns1:economicActivity>{data('PARTICULAR')}</ns1:economicActivity>
                </ns1:receiver>
                
                <ns1:itemSale>
                     {
                     
                    for $item in $input/OrderLines/OrderLine
                    return
                    <ns1:item>
                        <ns1:itemId>{data($item/@PrimeLineNo)}</ns1:itemId>
                        <ns1:sku>{data($item/Item/@ItemID)}</ns1:sku>
                        <ns1:itemSaleName>{data($item/Item/@ItemShortDesc)}</ns1:itemSaleName>
                        <ns1:shippingTimeRange></ns1:shippingTimeRange>
                        <ns1:amountInfo>
                            <ns1:quantity>{data($item/@OrderedQty)}</ns1:quantity>
                            <ns1:unitAmount>{number($item/LinePriceInfo/@UnitPrice)}</ns1:unitAmount>
                            <ns1:unitDiscountAmount>{number('0')}</ns1:unitDiscountAmount>
                            <ns1:totalDiscountAmount>{fn:number('4')}</ns1:totalDiscountAmount>
                            <ns1:totalItemAmount>{number($item/LinePriceInfo/@LineTotal)}</ns1:totalItemAmount>
                        </ns1:amountInfo>
                    </ns1:item>
                    
                    }
                </ns1:itemSale>
                
                <ns1:amountInfo>
                    <ns1:amount>{number($input/OrderLines/OrderLine/LinePriceInfo/@LineTotal)}</ns1:amount>
                    <ns1:shippingAmount>{number('0')}</ns1:shippingAmount>
                    <ns1:taxAmount>{number($input/OverallTotals/@GrandTax)}</ns1:taxAmount>
                    <ns1:discountAmount>{number($input/OverallTotals/@GrandDiscount)}</ns1:discountAmount>
                    <ns1:total>{number($input/OverallTotals/@GrandTotal)}</ns1:total>
                </ns1:amountInfo>
                <ns1:executor>
                    <ns1:executorId>{data($input/OriginAddress/@PersonID)}</ns1:executorId>
                    <ns1:firstName>{data($input/OriginAddress/@StoreUserFirstName)}</ns1:firstName>
                    <ns1:lastName>{data($input/OriginAddress/@StoreUserLastName)}</ns1:lastName>
                    <ns1:email>{data($input//OriginAddress/@EMailID)}</ns1:email>
                </ns1:executor>
            </ns1:deliveryOrder>
        </ns1:trxData>
    </ns1:Root-Element>
};

local:func($input)