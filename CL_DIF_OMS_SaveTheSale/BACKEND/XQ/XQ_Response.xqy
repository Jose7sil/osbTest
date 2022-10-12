xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare default element namespace "";
(:: import schema at "../../EXPOSED/XSD/RsOk.xsd" ::)

declare variable $varStatus as element() external;

declare function local:func($varStatus as element()) as element() (:: schema-element(response) ::) {
    <response>
        <status>200</status>
        <description>OK</description>
    </response>
};

local:func($varStatus)