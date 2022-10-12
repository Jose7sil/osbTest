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
            <ns1:version></ns1:version>
            <ns1:context>
                <ns1:idCompany></ns1:idCompany>
                <ns1:idCountry></ns1:idCountry>
                <ns1:idStore></ns1:idStore>
                <ns1:idChannel></ns1:idChannel>
            </ns1:context>
            <ns1:trxClientExecDate></ns1:trxClientExecDate>
        </ns1:trxHdr>
        <ns1:trxIdentify>
            <ns1:orderType></ns1:orderType>
            <ns1:idEvent></ns1:idEvent>
            <ns1:idOrder></ns1:idOrder>
        </ns1:trxIdentify>
        <ns1:trxData>
            <ns1:deliveryOrder>
                <ns1:deliveryDate></ns1:deliveryDate>
                <ns1:observations></ns1:observations>
                <ns1:driver></ns1:driver>
                <ns1:licensePlate></ns1:licensePlate>
                <ns1:transferType></ns1:transferType>
                <ns1:officeType></ns1:officeType>
                <ns1:origin>
                    <ns1:branchOfficeName></ns1:branchOfficeName>
                    <ns1:address>
                        <ns1:street></ns1:street>
                        <ns1:number></ns1:number>
                        <ns1:appartmentNumber></ns1:appartmentNumber>
                        <ns1:detail></ns1:detail>
                        <ns1:country></ns1:country>
                        <ns1:state></ns1:state>
                        <ns1:city></ns1:city>
                        <ns1:municipality></ns1:municipality>
                        <ns1:postalcode></ns1:postalcode>
                    </ns1:address>
                </ns1:origin>
                <ns1:destination>
                    <ns1:branchOfficeName></ns1:branchOfficeName>
                    <ns1:address>
                        <ns1:street></ns1:street>
                        <ns1:number></ns1:number>
                        <ns1:appartmentNumber></ns1:appartmentNumber>
                        <ns1:detail></ns1:detail>
                        <ns1:country></ns1:country>
                        <ns1:state></ns1:state>
                        <ns1:city></ns1:city>
                        <ns1:municipality></ns1:municipality>
                        <ns1:postalcode></ns1:postalcode>
                    </ns1:address>
                </ns1:destination>
                <ns1:receiver>
                    <ns1:name></ns1:name>
                    <ns1:legalId></ns1:legalId>
                    <ns1:economicActivity></ns1:economicActivity>
                </ns1:receiver>
                <ns1:itemSale>
                    <ns1:item>
                        <ns1:itemId></ns1:itemId>
                        <ns1:sku></ns1:sku>
                        <ns1:itemSaleName></ns1:itemSaleName>
                        <ns1:shippingTimeRange></ns1:shippingTimeRange>
                        <ns1:amountInfo>
                            <ns1:quantity></ns1:quantity>
                            <ns1:unitAmount></ns1:unitAmount>
                            <ns1:unitDiscountAmount></ns1:unitDiscountAmount>
                            <ns1:totalDiscountAmount></ns1:totalDiscountAmount>
                            <ns1:totalItemAmount></ns1:totalItemAmount>
                        </ns1:amountInfo>
                    </ns1:item>
                    <ns1:item>
                        <ns1:itemId></ns1:itemId>
                        <ns1:sku></ns1:sku>
                        <ns1:itemSaleName></ns1:itemSaleName>
                        <ns1:shippingTimeRange></ns1:shippingTimeRange>
                        <ns1:amountInfo>
                            <ns1:quantity></ns1:quantity>
                            <ns1:unitAmount></ns1:unitAmount>
                            <ns1:unitDiscountAmount></ns1:unitDiscountAmount>
                            <ns1:totalDiscountAmount></ns1:totalDiscountAmount>
                            <ns1:totalItemAmount></ns1:totalItemAmount>
                        </ns1:amountInfo>
                    </ns1:item>
                </ns1:itemSale>
                <ns1:amountInfo>
                    <ns1:amount></ns1:amount>
                    <ns1:shippingAmount></ns1:shippingAmount>
                    <ns1:taxAmount></ns1:taxAmount>
                    <ns1:discountAmount></ns1:discountAmount>
                    <ns1:total></ns1:total>
                </ns1:amountInfo>
                <ns1:executor>
                    <ns1:executorId></ns1:executorId>
                    <ns1:firstName></ns1:firstName>
                    <ns1:lastName></ns1:lastName>
                    <ns1:email></ns1:email>
                </ns1:executor>
            </ns1:deliveryOrder>
        </ns1:trxData>
    </ns1:Root-Element>
};

local:func($input)