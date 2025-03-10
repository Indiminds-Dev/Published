<%@ page language="C#" autoeventwireup="true" inherits="management_BrokerageCharges, App_Web_co654op-" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Brokerage Charges</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>

    <script language="javascript" type="text/javascript">
   function SignOff()
    {
        window.parent.SignOff();
    }


    function ExchageFeehideshow(vValue) {

       

        if (vValue == '1') {

            document.getElementById('tr_exchangefee').style.visibility = 'hidden';
        }

        else {

            document.getElementById('tr_exchangefee').style.visibility = 'visible';
        
        }
    }

    function TradingFeehideshow(vValue) {

       

        if (vValue == '1') {

            document.getElementById('tr_tradingfee').style.visibility = 'hidden';
        }

        else {

            document.getElementById('tr_tradingfee').style.visibility = 'visible';
        
        }
    }

    function ClearingFeehideshow(vValue) {

        if (vValue == '1') {

            document.getElementById('tr_clearingfee').style.visibility = 'hidden';
        }

        else {

            document.getElementById('tr_clearingfee').style.visibility = 'visible';
        
        }
    }

    function SettlementFeehideshow(vValue) {

        if (vValue == '1') {

            document.getElementById('tr_settlementfee').style.visibility = 'hidden';
        }

        else {

            document.getElementById('tr_settlementfee').style.visibility = 'visible';
        
        }
    }

    function TradeIncentivehideshow(vValue) {

       

        if (vValue == '1') {

            document.getElementById('tr_tradeIncentive').style.visibility = 'hidden';
        }

        else {

            document.getElementById('tr_tradeIncentive').style.visibility = 'visible';
        
        }
    }

    function SegmenShowMCXCOMM(segment) {

       
        document.getElementById('sebifee').style.display = 'inline'
      

    }
    
    
    function Segmenthideshow(segment) {

        //document.getElementById('tr_fms').style.display = 'none';
        

    
    if(segment=='cmfo')
        {
            document.getElementById('ctt').style.display='none'
	    document.getElementById('tr_exchangefee').style.display = 'none';
            document.getElementById('tr_tradingfee').style.display = 'none';
            document.getElementById('tr_tradeIncentive').style.display = 'none';
	    document.getElementById('tr_fms').style.display = 'none';
            document.getElementById('stt').style.display='inline'
            document.getElementById('sebifee').style.display='inline'
            document.getElementById('ipft').style.display='inline'
            document.getElementById('tr_clearingfee').style.display = 'none';
            document.getElementById('tr_settlementfee').style.display = 'none';
        
        }
    else if(segment=='cdx')
        {
            document.getElementById('ctt').style.display='none'
            document.getElementById('stt').style.display='none'
	    document.getElementById('tr_exchangefee').style.display = 'none';
            document.getElementById('tr_tradingfee').style.display = 'none';
            document.getElementById('tr_tradeIncentive').style.display = 'none';
            document.getElementById('tr_fms').style.display = 'none';
            document.getElementById('sebifee').style.display='inline'
            document.getElementById('ipft').style.display='inline'
            document.getElementById('tr_clearingfee').style.display = 'none';
            document.getElementById('tr_settlementfee').style.display = 'none';
        
        }
    else if(segment=='cm')
        {
            document.getElementById('clrchrg').style.display = 'none'
	    document.getElementById('tr_exchangefee').style.display = 'none';
            document.getElementById('tr_tradingfee').style.display = 'none';
            document.getElementById('tr_tradeIncentive').style.display = 'none';
            
            // Added On 18Feb2016 ----
            document.getElementById('ctt').style.display = 'none'
            document.getElementById('tr_fms').style.display = 'none';
            document.getElementById('tr_clearingfee').style.display = 'none';
            document.getElementById('tr_settlementfee').style.display = 'none';
        
        }
    else if(segment=='commcdx')
        {
             document.getElementById('sebifee').style.display='inline'
             document.getElementById('ipft').style.display='inline'
             document.getElementById('tr_fms').style.display = 'inline';
            document.getElementById('stt').style.display='none'
	    document.getElementById('tr_exchangefee').style.display = 'none';
            document.getElementById('tr_tradingfee').style.display = 'none';
            document.getElementById('tr_tradeIncentive').style.display = 'none';
            document.getElementById('tr_clearingfee').style.display = 'none';
            document.getElementById('tr_settlementfee').style.display = 'none';

        }    
    else if(segment=='commint')
        {
            document.getElementById('demat').style.display='none'
            document.getElementById('stamp').style.display='none'
            document.getElementById('ctt').style.display='none'
	    document.getElementById('tr_exchangefee').style.display = 'inline';
            document.getElementById('tr_tradingfee').style.display = 'inline';
            document.getElementById('tr_clearingfee').style.display = 'inline';
            document.getElementById('tr_settlementfee').style.display = 'inline';
	    document.getElementById('tr_fms').style.display = 'none';
            document.getElementById('stt').style.display='none'
            document.getElementById('sebifee').style.display='none'
            document.getElementById('ipft').style.display='none'
            document.getElementById('tr_tradeIncentive').style.display = 'none';
        
        }
    else if(segment=='comminx')
        {
            document.getElementById('demat').style.display='none'
            document.getElementById('stamp').style.display='none'
            document.getElementById('ctt').style.display='none'
	    document.getElementById('tr_exchangefee').style.display = 'none';
            document.getElementById('tr_tradingfee').style.display = 'none';
            document.getElementById('tr_clearingfee').style.display = 'none';
            document.getElementById('tr_settlementfee').style.display = 'none';
	    document.getElementById('tr_fms').style.display = 'none';
            document.getElementById('stt').style.display='none'
            document.getElementById('sebifee').style.display='inline'
            document.getElementById('ipft').style.display='inline'
            document.getElementById('tr_tradeIncentive').style.display = 'inline';
        
        }
    else
        {
        
            document.getElementById('stt').style.display='none'
            document.getElementById('sebifee').style.display='none'
            document.getElementById('ipft').style.display='none'
            document.getElementById('ctt').style.display='none'
            document.getElementById('clrchrg').style.display = 'inline'

            document.getElementById('tr_fms').style.display = 'inline'

           document.getElementById('tr_exchangefee').style.display = 'inline';
           document.getElementById('tr_tradingfee').style.display = 'inline';
           document.getElementById('tr_clearingfee').style.display = 'inline';
           document.getElementById('tr_settlementfee').style.display = 'inline';
            document.getElementById('tr_tradeIncentive').style.display = 'none';
        }
    
    
    }
   function OnCompanyChanged(objComp,obj)
   {
       if(obj=='ST')
            ddlsevicetaxbasis.PerformCallback(objComp);
       else if(obj=='STT')
            ddlsttbasis.PerformCallback(objComp);
       else if(obj=='TC')
            ddltransbasis.PerformCallback(objComp);
       else if(obj=='SD')
            ddlstampbasis.PerformCallback(objComp);
       else if(obj=='DC')
            ddldematbasis.PerformCallback(objComp);
       else if(obj=='SF')
            ddlsebibasis.PerformCallback(objComp);
       else if(obj=='IP')
            ddlipftbasis.PerformCallback(objComp);
       else if(obj=='CL')
            ddlClearanceChargebasis.PerformCallback(objComp);
       else if(obj=='CT')
           ddlCttbasis.PerformCallback(objComp);
       else if (obj == 'RM')
           ddlrmsbasic.PerformCallback(objComp);
       else if (obj == 'EF')
           ddlExchangeFeebasic.PerformCallback(objComp);      
       else if(obj=='GS')
            ddlGSTbasis.PerformCallback(objComp);
       else if (obj == 'TF')
           ddlTradingFeebasic.PerformCallback(objComp);      
       else if (obj == 'XC')
           ddlClearingFeebasic.PerformCallback(objComp);      
       else if (obj == 'XS')
           ddlSettlementFeebasic.PerformCallback(objComp);      
       else if (obj == 'TI')
           ddlTradeIncentivebasic.PerformCallback(objComp);      
   } 
   function noNumbers(e)
    {
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                {
                 alert("Please Insert Numeric Only");
                 return false;
                }
         } 
         
          else if(e.which) // Netscape/Firefox/Opera
       {
           keynum = e.which  
           
           if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                 {
                 alert("Please Insert Numeric Only");
                 return false;
                 }     
        }
  } 

function disp_prompt(name)
    {
    //alert (name);
           if ( name == "tab0")
        {
         var h=document.getElementById('ASPxPageControl1_hddf1').value;
         //alert (h);
         document.location.href="BrokerageMain.aspx?id="+h; 
         //alert (h);
        }
        else if ( name == "tab1")
        {
          //document.location.href="BrokerageCharges.aspx"; 
        }
    }
    function ShowTax(objTax)
    {
        var SplTax=objTax.split('~');
        if(SplTax[0]!='0')
        {
            ddlsevicetaxbasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddlsevicetaxbasis.SetEnabled(false);
            else
                ddlsevicetaxbasis.SetEnabled(true);
        }
    }
    function ShowGST(objGST)
    {
        var SplTax=objGST.split('~');
        if(SplTax[0]!='0')
        {
            ddlGSTbasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddlGSTbasis.SetEnabled(false);
            else
                ddlGSTbasis.SetEnabled(true);
        }
    }
    function ShowStt(objStt)
    {
        var SplTax=objStt.split('~');
        if(SplTax[0]!='0')
        {
            ddlsttbasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddlsttbasis.SetEnabled(false);
            else
                ddlsttbasis.SetEnabled(true);
        }
    }
    function ShowTrCharge(objTran)
    {
        var SplTax=objTran.split('~');
        if(SplTax[0]!='0')
        {
            ddltransbasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddltransbasis.SetEnabled(false);
            else
                ddltransbasis.SetEnabled(true);
        }
    }
    function ShowSDuty(objSDuty)
    {
        var SplTax=objSDuty.split('~');
        if(SplTax[0]!='0')
        {
            ddlstampbasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddlstampbasis.SetEnabled(false);
            else
                ddlstampbasis.SetEnabled(true);
        }
    }
    function ShowDCharge(objDcharge)
    {
        var SplTax=objDcharge.split('~');
        if(SplTax[0]!='0')
        {
            ddldematbasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddldematbasis.SetEnabled(false);
            else
                ddldematbasis.SetEnabled(true);
        }
    }
    function ShowSebiFee(objSebi)
    {
        var SplTax=objSebi.split('~');
        if(SplTax[0]!='0')
        {
            ddlsebibasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddlsebibasis.SetEnabled(false);
            else
                ddlsebibasis.SetEnabled(true);
                
        }
    }
    function Showipft(objipft)
    {
        var SplTax=objipft.split('~');
        if(SplTax[0]!='0')
        {
            ddlipftbasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddlipftbasis.SetEnabled(false);
            else
                ddlipftbasis.SetEnabled(true);
                
        }
    }
    function ShowClearanceCharge(objClCharge)
    {
        var SplTax=objClCharge.split('~');
        if(SplTax[0]!='0')
        {
            ddlClearanceChargebasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddlClearanceChargebasis.SetEnabled(false);
            else
                ddlClearanceChargebasis.SetEnabled(true);
                
        }
        
    }
    function ShowCtt(objCttScheme)
    {
        var SplTax=objCttScheme.split('~');
        if(SplTax[0]!='0')
        {
            
            ddlCttbasis.SetValue(SplTax[0]);
            if(SplTax[1]=='2')
                ddlCttbasis.SetEnabled(false);
            else
                ddlCttbasis.SetEnabled(true);
                
        }

    }

    //    -------------- RMS Fee-----------------


    function Showrms(objRmsScheme) {
        var SplTax = objRmsScheme.split('~');

      //  alert(SplTax[0]);
        
        if (SplTax[0] != '0') {

            ddlrmsbasic.SetValue(SplTax[0]);
            if (SplTax[1] == '2')
                ddlrmsbasic.SetEnabled(false);
            else
                ddlrmsbasic.SetEnabled(true);

        }

    }

    //----------------------------------------------------



    //    -------------- Exchange Fee-----------------


    function Showexchangefee(objexchScheme) {
        var SplTax = objexchScheme.split('~');

       // alert(SplTax[0]);

        if (SplTax[0] != '0') {

            ddlExchangeFeebasic.SetValue(SplTax[0]);
            if (SplTax[1] == '2')
                ddlExchangeFeebasic.SetEnabled(false);
            else
                ddlExchangeFeebasic.SetEnabled(true);

        }

    }

    //----------------------------------------------------
    
    //    -------------- Trading Fee-----------------


    function Showtradingfee(objtfScheme) {
        var SplTax = objtfScheme.split('~');

       // alert(SplTax[0]);

        if (SplTax[0] != '0') {

            ddlTradingFeebasic.SetValue(SplTax[0]);
            if (SplTax[1] == '2')
                ddlTradingFeebasic.SetEnabled(false);
            else
                ddlTradingFeebasic.SetEnabled(true);

        }

    }

    //----------------------------------------------------

    //    -------------- Clearing Fee-----------------


    function Showclearingfee(objxcScheme) {
        var SplTax = objxcScheme.split('~');

       // alert(SplTax[0]);

        if (SplTax[0] != '0') {

            ddlClearingFeebasic.SetValue(SplTax[0]);
            if (SplTax[1] == '2')
                ddlClearingFeebasic.SetEnabled(false);
            else
                ddlClearingFeebasic.SetEnabled(true);

        }

    }

    //----------------------------------------------------

    //    -------------- Settlement Fee-----------------


    function Showsettlementfee(objxsScheme) {
        var SplTax = objxsScheme.split('~');

       // alert(SplTax[0]);

        if (SplTax[0] != '0') {

            ddlSettlementFeebasic.SetValue(SplTax[0]);
            if (SplTax[1] == '2')
                ddlSettlementFeebasic.SetEnabled(false);
            else
                ddlSettlementFeebasic.SetEnabled(true);

        }

    }

    //----------------------------------------------------

    //    -------------- Trade Incentive-----------------


    function ShowtradeIncentive(objtiScheme) {
        var SplTax = objtiScheme.split('~');

        //alert(SplTax[0]);
        
        if (SplTax[0] != '0') {

            ddlTradeIncentivebasic.SetValue(SplTax[0]);
            if (SplTax[1] == '2')
                ddlTradeIncentivebasic.SetEnabled(false);
            else
                ddlTradeIncentivebasic.SetEnabled(true);

        }

    }

    //----------------------------------------------------
    
    
    FieldName='ASPxPageControl1ATI';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" Width="100%" runat="server" ActiveTabIndex="1"
                            ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="Charges" Name="Charges">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">&nbsp;<table border="1" class="TableMain100">
                                            <tr>
                                                <asp:HiddenField ID="hddf1" runat="server" />
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                </td>
                                                <td style="width: 127px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Scheme</td>
                                                <td style="width: 52px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Basis</td>
                                            </tr>
                                            <tr id="servtax">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Service Tax/VAT</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Style="text-align: right;" EnableSynchronization="False"
                                                        Width="230px" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceGroup"
                                                        TextField="d" ValueField="ChargeGroup_Code" ID="ddlservicetaxscheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'ST'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlsevicetaxbasis" ClientInstanceName="ddlsevicetaxbasis"
                                                        Width="120px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlsevicetaxbasis_Callback" OnCustomJSProperties="ddlsevicetaxbasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowTax(s.cpSerTax);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr id="gst">	
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;GST</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Style="text-align: right;" EnableSynchronization="False"
                                                        Width="230px" EnableIncrementalFiltering="True" ValueType="System.String" DataSourceID="AccessDataSourceGroup"
                                                        TextField="d" ValueField="ChargeGroup_Code" ID="ddlGSTscheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'GS'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlGSTbasis" ClientInstanceName="ddlGSTbasis"
                                                        Width="120px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlGSTbasis_Callback" OnCustomJSProperties="ddlGSTbasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowGST(s.cpGST);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr id="stt">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;STT</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" EnableSynchronization="False" Width="230px" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlsttscheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'STT'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlsttbasis" ClientInstanceName="ddlsttbasis"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlsttbasis_Callback" OnCustomJSProperties="ddlsttbasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowStt(s.cpSTTTax);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr id="trancharge">
                                                <td style="width: 102px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Transaction Charges</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" EnableSynchronization="False" Width="230px" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddltranscheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'TC'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddltransbasis" ClientInstanceName="ddltransbasis"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddltransbasis_Callback" OnCustomJSProperties="ddltransbasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowTrCharge(s.cpTrCharge);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr id="stamp">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Stamp Duty</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" EnableSynchronization="False" Width="230px" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlstampscheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'SD'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlstampbasis" ClientInstanceName="ddlstampbasis"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlstampbasis_Callback" OnCustomJSProperties="ddlstampbasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowSDuty(s.cpSDuty);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr id="demat">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Demat Charges</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddldematscheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'DC'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddldematbasis" ClientInstanceName="ddldematbasis"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddldematbasis_Callback" OnCustomJSProperties="ddldematbasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowDCharge(s.cpDCharge);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr id="sebifee">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Sebi Fee</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="true" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlsebischeme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'SF'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlsebibasis" ClientInstanceName="ddlsebibasis"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlsebibasis_Callback" OnCustomJSProperties="ddlsebibasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowSebiFee(s.cpSebiFee);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr id="ipft">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;IPFT Charge</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="true" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlipftscheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'IP'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlipftbasis" ClientInstanceName="ddlipftbasis"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlipftbasis_Callback" OnCustomJSProperties="ddlipftbasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){Showipft(s.cpipft);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr id="clrchrg">
                                                <td style="width: 85px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Clearing Charges</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlClearanceChargescheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'CL'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlClearanceChargebasis" ClientInstanceName="ddlClearanceChargebasis"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlClearanceChargebasis_Callback" OnCustomJSProperties="ddlClearanceChargebasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowClearanceCharge(s.cpClCharge);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            
                                            <tr id="ctt">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;CTT</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlCttScheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'CT'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlCttbasis" ClientInstanceName="ddlCttbasis"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlCttbasis_Callback" OnCustomJSProperties="ddlCttbasis_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowCtt(s.cpCttCharge);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                            
                                           <%-- ---------------------------- RMS Fee Start-------------------------------------%>
                                           
                                           
                                            <tr id="tr_fms">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;RMS</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlrmsScheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'RM'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlrmsbasic" ClientInstanceName="ddlrmsbasic"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlrmsbasic_Callback" OnCustomJSProperties="ddlrmsbasic_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){Showrms(s.cprmsCharge);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                           
                                           
                                           
                                          <%-- -------------------------------- RMS Fee End--------------------------------------------%>
                                          
                                          
                                          
                                          
                                            <%-- ---------------------------- Exchange Fee Start-------------------------------------%>
                                           
                                           
                                            <tr id="tr_exchangefee">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Exchange Fee</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlExchangeFeeScheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'EF'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlExchangeFeebasic" ClientInstanceName="ddlExchangeFeebasic"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlExchangeFeebasic_Callback" OnCustomJSProperties="ddlExchangeFeebasic_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                           <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){Showexchangefee(s.cpexchangeCharge);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                           
                                           
                                           
                                          <%-- -------------------------------- Exchange Fee End--------------------------------------------%>
                                            
                                            <%-- ---------------------------- Trading Fee Start-------------------------------------%>
                                           
                                           
                                            <tr id="tr_tradingfee">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Trading Fee</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlTradingFeeScheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'TF'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlTradingFeebasic" ClientInstanceName="ddlTradingFeebasic"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlTradingFeebasic_Callback" OnCustomJSProperties="ddlTradingFeebasic_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                           <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){Showtradingfee(s.cptradingCharge);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                           
                                           
                                           
                                          <%-- -------------------------------- Trading Fee End--------------------------------------------%>

                                            <%-- ---------------------------- Clearing Fee Start-------------------------------------%>
                                           
                                           
                                            <tr id="tr_clearingfee">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Clearing Fee</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlClearingFeeScheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'XC'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlClearingFeebasic" ClientInstanceName="ddlClearingFeebasic"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlClearingFeebasic_Callback" OnCustomJSProperties="ddlClearingFeebasic_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                           <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){Showclearingfee(s.cpclearingfee);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                           
                                           
                                           
                                          <%-- -------------------------------- Clearing Fee End--------------------------------------------%>

                                            <%-- ---------------------------- Settlement Fee Start-------------------------------------%>
                                           
                                           
                                            <tr id="tr_settlementfee">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Settlement Fee</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlSettlementFeeScheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'XS'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlSettlementFeebasic" ClientInstanceName="ddlSettlementFeebasic"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlSettlementFeebasic_Callback" OnCustomJSProperties="ddlSettlementFeebasic_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                           <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){Showsettlementfee(s.cpsettlementfee);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                           
                                           
                                           
                                          <%-- -------------------------------- Settlement Fee End--------------------------------------------%>

                                            <%-- ---------------------------- Trade Incentive Start-------------------------------------%>
                                           
                                           
                                            <tr id="tr_tradeIncentive">
                                                <td style="width: 83px; height: 11px; background-color: #b7ceec">
                                                    &nbsp;Trade Incentive</td>
                                                <td style="width: 127px">
                                                    <dxe:ASPxComboBox runat="server" Width="230px" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" DataSourceID="AccessDataSourceGroup" TextField="d"
                                                        ValueField="ChargeGroup_Code" ID="ddlTradeIncentiveScheme">
                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) { OnCompanyChanged(s.GetValue(),'TI'); }">
                                                        </ClientSideEvents>
                                                    </dxe:ASPxComboBox>
                                                </td>
                                                <td style="width: 153px">
                                                    <dxe:ASPxComboBox runat="server" ID="ddlTradeIncentivebasic" ClientInstanceName="ddlTradeIncentivebasic"
                                                        Width="120px" DropDownStyle="DropDown" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                        ValueType="System.String" OnCallback="ddlTradeIncentivebasic_Callback" OnCustomJSProperties="ddlTradeIncentivebasic_CustomJSProperties">
                                                        <Items>
                                                            <dxe:ListEditItem Text="Exclusive" Value="2"></dxe:ListEditItem>
                                                           <dxe:ListEditItem Text="Inclusive" Value="1"></dxe:ListEditItem>
                                                            <dxe:ListEditItem Text="Not Applicable" Value="3"></dxe:ListEditItem>
                                                        </Items>
                                                        <ClientSideEvents EndCallback="function(s,e){ShowtradeIncentive(s.cptradeIncentive);}" />
                                                    </dxe:ASPxComboBox>
                                                </td>
                                            </tr>
                                           
                                           
                                           
                                          <%-- -------------------------------- Trade Incentive End--------------------------------------------%>
                                            
                                            
                                            
                                            <tr>
                                                <td>
                                                </td>
                                                <td>
                                                </td>
                                                <td>
                                                    <asp:Button ID="btnSave" runat="server" Style="cursor: pointer" Text="Save" CssClass="btnUpdate"
                                                        OnClick="btnSave_Click" Height="21px" Width="46px" />
                                                </td>
                                            </tr>
                                        </table>  
                                                                   
                                                                
 </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                            </TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                             if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                             else  if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            }"></ClientSideEvents>
                            <ContentStyle>
                                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                            </ContentStyle>
                            <LoadingPanelStyle ImageSpacing="6px">
                            </LoadingPanelStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="AccessDataSourceGroup" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT (isnull(ChargeGroup_Name,''))+'[' + ChargeGroup_Code+']'as d,ChargeGroup_Code FROM [Master_ChargeGroup] where ChargeGroup_Type='2'">
        </asp:SqlDataSource>
    </form>
</body>
</html>
