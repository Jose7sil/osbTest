xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../EXPOSED/XSD/OrderLoad_Rs.xsd" ::)
declare namespace ns1="http://TargetNamespace.com/REST_SaveTheSale_CreateXml_request";
(:: import schema at "../../EXPOSED/XSD/SaveTheSaleRq.xsd" ::)

declare variable $STSRq as element() (:: schema-element(ns1:Root-Element) ::) external;

declare function local:func($STSRq as element() (:: schema-element(ns1:Root-Element) ::)) as element() (:: schema-element(Order) ::) {
        <Order 
        AllocationRuleID="DIF_SCH" 
        DocumentType="0001" 
        EntryType="POS" 
        PaymentStatus="PAID" 
        EnterpriseCode="FCVChile"
        PaymentRuleId="FCVCH_POS_CARD_RULE" 
        SellerOrganizationCode="FCV.PCH"        
        CustomerPhoneNo="{fn:data($STSRq/ns1:clientData/ns1:phone)}" 
        CustomerContactID="{fn:data($STSRq/ns1:clientData/ns1:mail)}"
        EnteredBy="{fn:data($STSRq/ns1:originLocal/ns1:posId)}"
        CustomerFirstName="{fn:data($STSRq/ns1:clientData/ns1:firstName)}"
        CustomerLastName="{fn:data($STSRq/ns1:clientData/ns1:lastName)}"
        BillToID="{fn:data($STSRq/ns1:originLocal/ns1:posId)}"
        CustomerEMailID="{fn:data($STSRq/ns1:clientData/ns1:mail)}"
        OrderDate="{fn:data($STSRq/ns1:orderDate)}"
        OrderNo="{fn:data($STSRq/ns1:orderId)}">
        <PriceInfo Currency="CLP"/>
        <Extn 
        ExtnLocalVentaPOS="{fn:data($STSRq/ns1:originLocal/ns1:localId)}" 
        ExtnRUNRUTNIT="{fn:data($STSRq/ns1:clientData/ns1:id)}" 
        ExtnIsGuestUser="Y" />
        <OrderLines>
        {
            for $products at $contador in $STSRq/ns1:products
            return
            <OrderLine
            PrimeLineNo= "{($contador)}"
            ReqShipDate="{fn:data($STSRq/ns1:shipData/ns1:shipDay)}"            
            ItemGroupCode="PROD"
            SubLineNo="1"
            IsFirmPredefinedNode="Y"
            IsProcurementAllowed="Y"
            LineType="CnC"
            DeliveryMethod="PICK"
            FulfillmentType="PICKUP_IN_STORE"
            ShipNode="{fn:data($STSRq/ns1:shipData/ns1:storeId)}" 
            LevelOfService="{fn:data($STSRq/ns1:shipData/ns1:serviceLevel)}" 
            OrderedQty="{fn:data($products/ns1:quantity)}">
                <Item
                ProductClass="REGULAR"
                UnitOfMeasure="EACH"
                CostCurrency="CLP"
                ItemID="{fn:data($products/ns1:sku)}" 
                UnitCost="{fn:data($products/ns1:unitPrice)}" 
                ItemShortDesc="{fn:data($products/ns1:description)}"/>
                <LinePriceInfo
                IsPriceLocked="Y"
                UnitPrice="{fn:data($products/ns1:unitPrice)}"/>
                <LineCharges>
                    <LineCharge
                    ChargePerUnit="0"
                    ChargePerLine="0"
                    Reference=""
                    ChargeCategory="DISCOUNT"
                    ChargeName="PDT_DISCOUNT"/>
		</LineCharges>
                <LineTaxes>
                    <LineTax
                    Tax="{fn:data($products/ns1:tax)}"
                    ChargeCategory="TAX"
                    TaxableFlag="Y"
                    ChargeName="SALES_TAX"
                    TaxName="SalesTax"/>
		</LineTaxes>
                <Promotion 
                PromotionId=""/>
                <PersonInfoShipTo
                Longitude="{fn:data($STSRq/ns1:originLocal/ns1:longitude)}"
                Latitude="{fn:data($STSRq/ns1:originLocal/ns1:latitude)}"
                AddressLine2="{fn:data($STSRq/ns1:originLocal/ns1:address)}"
                MobilePhone="{fn:data($STSRq/ns1:clientData/ns1:phone)}"
                State="PENDIENTE TABLA"
                Country="CL"                
                AddressLine4="{fn:data($STSRq/ns1:originLocal/ns1:commune)}" 
                EMailID="{fn:data($STSRq/ns1:clientData/ns1:mail)}"
                DayPhone="{fn:data($STSRq/ns1:clientData/ns1:phone)}"
                AddressLine1="{fn:data($STSRq/ns1:originLocal/ns1:address)}"
                City="{fn:data($STSRq/ns1:originLocal/ns1:commune)}"
                FirstName="{fn:data($STSRq/ns1:clientData/ns1:firstName)}"
                LastName="{fn:data($STSRq/ns1:clientData/ns1:lastName)}"/>
                <OrderLineSourcingControls>
                    <OrderLineSourcingCntrl
                    SuppressNodeCapacity="Y"
                    Node="{fn:data($STSRq/ns1:shipData/ns1:storeId)}" />
		</OrderLineSourcingControls>
                <Extn 
                ExtnIsNightShipping="N"
                ExtnVerifyPrescriptionAtPick="Y"
                ExtnIsPrescriptionVerified="N"
                ExtnIsPickUpByAuthPerson="N"
                ExtnIsPrescriptionHoldRequired="N"/>
            </OrderLine>   
        }
        </OrderLines>
        <PaymentMethods>
            <PaymentMethod
            ChargeSequence="1"
            PaymentReference1=""
            PaymentReference5="" 
            PaymentReference7="" 
            PaymentReference8=""
            PaymentReference4="1"
            CreditCardType="VISA"
            CreditCardExpDate="20281101"
            CreditCardNo="541675"
            DisplayCreditCardNo="2580"
            PaymentReference6="VISA"
            PaymentReference9="488645542"
            MaxChargeLimit="{
              sum(for $products in $STSRq/ns1:products
                    return
                    let $quantity := fn:data($products/ns1:quantity)
                    let $unitPrice := fn:data($products/ns1:unitPrice)
                    let $multi := $quantity * $unitPrice
                  return $multi
                )}"
            PaymentType="POS_PAYMENT"
            PaymentReference2="POS_OTHERS"
            UnlimitedCharges="N"          
            CreditCardName="{fn:data($STSRq/ns1:clientData/ns1:firstName)}" 
            FirstName="{fn:data($STSRq/ns1:clientData/ns1:firstName)}"
            LastName="{fn:data($STSRq/ns1:clientData/ns1:lastName)}"
            PaymentReference3="{fn:data($STSRq/ns1:clientData/ns1:id)}">
                <PersonInfoBillTo
                MobilePhone=""
                AddressLine2="{fn:data($STSRq/ns1:originLocal/ns1:address)}"
                State="PENDIENTE TABLA"
                Country="CL"
                DayPhone="{fn:data($STSRq/ns1:clientData/ns1:phone)}" 
                EMailID="{fn:data($STSRq/ns1:clientData/ns1:mail)}" 
                FirstName="{fn:data($STSRq/ns1:clientData/ns1:firstName)}"
                LastName="{fn:data($STSRq/ns1:clientData/ns1:lastName)}"
                AddressLine1="{fn:data($STSRq/ns1:originLocal/ns1:address)}"
                AddressLine4="{fn:data($STSRq/ns1:originLocal/ns1:commune)}"
                City="{fn:data($STSRq/ns1:originLocal/ns1:commune)}"/>
            </PaymentMethod>
            <PaymentDetailsList>
                <PaymentDetails
                AuthCode="24647270"
                AuthorizationID="24647270"
                ProcessedAmount="{
                    sum(for $products in $STSRq/ns1:products
                      return
                      let $quantity := fn:data($products/ns1:quantity)
                      let $unitPrice := fn:data($products/ns1:unitPrice)
                      let $multi := $quantity * $unitPrice
                    return $multi
                )}"
                RequestAmount="{
                    sum(for $products in $STSRq/ns1:products
                      return
                      let $quantity := fn:data($products/ns1:quantity)
                      let $unitPrice := fn:data($products/ns1:unitPrice)
                      let $multi := $quantity * $unitPrice
                    return $multi
                )}"
                ChargeType="CHARGE"
                RequestProcessed="Y"/>
            </PaymentDetailsList>
        </PaymentMethods>
        <PersonInfoBillTo
        DayPhone="{fn:data($STSRq/ns1:clientData/ns1:phone)}"
        AddressLine2="{fn:data($STSRq/ns1:originLocal/ns1:commune)}"
        Country="CL"
        AddressLine1="{fn:data($STSRq/ns1:originLocal/ns1:address)}" 
        AddressLine4="{fn:data($STSRq/ns1:originLocal/ns1:commune)}"
        City="{fn:data($STSRq/ns1:originLocal/ns1:commune)}" 
        EMailID="{fn:data($STSRq/ns1:clientData/ns1:mail)}" 
        FirstName="{fn:data($STSRq/ns1:clientData/ns1:firstName)}"
        LastName="{fn:data($STSRq/ns1:clientData/ns1:lastName)}"/>
        <PersonInfoShipTo
        AddressLine4="{fn:data($STSRq/ns1:originLocal/ns1:commune)}"
        Country="CL"
        AddressLine1="{fn:data($STSRq/ns1:originLocal/ns1:address)}"
        AddressLine2="{fn:data($STSRq/ns1:originLocal/ns1:commune)}"
        City="{fn:data($STSRq/ns1:originLocal/ns1:commune)}"
        EMailID="{fn:data($STSRq/ns1:clientData/ns1:mail)}"
        FirstName="{fn:data($STSRq/ns1:clientData/ns1:firstName)}"
        LastName="{fn:data($STSRq/ns1:clientData/ns1:lastName)}"/>
        </Order>
};

local:func($STSRq)