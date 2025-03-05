<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="management_frontendexports_ODIN, App_Web_jdrimxnc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Front-End Exports For ODIN</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    
    <%--New Work 04/08/2022--%>
    <link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />
    
    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>
    
    <script language="javascript" type="text/javascript" src="../CentralData/JSScript/timeSolver.min.js"></script>
    <%--End of New Work 04/08/2022--%>

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:32767;
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
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:3000;
	}

	form{
		display:inline;
	}
	.grid_scroll
     {
		    overflow-y: no;  
            overflow-x: scroll; 
            width:90%;
            scrollbar-base-color: #C0C0C0;
        
	} 
	
	</style>

    <script language="javascript" type="text/javascript">
   
  $(document).ready(function() {
        var RadioButton1 = $('#<%= rdbPOAAll.ClientID %>');
        var RadioButton2 = $('#<%= rdbPOASelected.ClientID %>');
        RadioButton1.attr('disabled', true);
        RadioButton2.attr('disabled', true);
    });
   function Page_Load()///Call Into Page Load
            {   
                //New Work 14/04/2022
//                 Show('tr3');
                   Hide('tr3');
                //End of New Work 14/04/2022
                 Show('lblFor');
                 Show('lblForValue');
                 //New Work 14/04/2022
//                 Hide('tr_Segment');
//                 Show('tr_ClientRms');
//                 Show('tr_UserRoleName');
                 Show('tr_Segment');
                 Hide('tr_ClientRms');
                 Hide('tr_UserRoleName');
                 //End of New Work 14/04/2022
                 Show('tr_Category');
                 Hide('tr_tradedate');
                 Hide('tr_closepricedate');
                 Hide('tr_varmargin');
                 Hide('tr_Collateralholdingdatre');
                 Hide('tr_TradingAccount');
                 Hide('tr_MarginAccount');
                 Hide('tr_Product');
                 Hide('tr_generatedisplay');
                 Show('tr_show');
//                 New Work 04/08/2022
                 Show('tr_GenerateShow');
                 Show('aBtnShow');
//                 End of New Work 04/08/2022                 
                 Hide('btngenerate');
                 Hide('btndisplay');
                 Show('btn_show');
                 Hide('tr_grd');
                 Hide('tr_sapn');
                 Hide('tr_chkproduct');
                 Hide('tr_Category');
                 Hide('tr_rmslimtaging');
                 Hide('tr_unclearban');
                 Hide('showFilter');
                 Hide('tr_iscollateral');
                 Hide('tr_evaluationmethod');
                 Hide('tr_exchangeuserid');
                 Hide('tr_expirydate');
                 Hide('tr_exchangeuserinfo');
                 Hide('tr_enabledflag');
                 Hide('tr_considerdpholding');
                 Hide('display');
                 disabelchkrmslimit();
                 Hide('tr_UnApprovedShares');
                 txtUnApprovedShares.SetValue('100.00');
                 Hide('tr_applyhaircut');
                 //New Work
                 Hide('displayHWCQ');
                 //End of New Work
                 height();
                 selecttion();
            }
            function setparam()
            {
                 document.getElementById('DDLformat').setvalue='ODIN';
                 var list  = document.getElementById('DDLexport');
                 var new9=document.getElementById("DDLexport");
                 var optn10 = document.createElement("OPTION"); 
                 list.options.length = 0;
                
                 optn10.text = "Manual Postion"; 
                 optn10.value = "11";
                 new9.add(optn10);
                 Hide('tr_ClientRms');
                 Hide('tr_UserRoleName');
                 Hide('tr3');
                 Show('tr_tradedate');
                 Hide('tr_filter');
                 Show('tr_Segment');
            }
            function insert()
            {
                var list  = document.getElementById('DDLexport');
                list.options.length = 0;
                var new2=document.getElementById("DDLexport");
                var optn = document.createElement("OPTION"); 
                //var optn2 = document.createElement("OPTION");
                var optn3 = document.createElement("OPTION");
                var optn4 = document.createElement("OPTION");
                var optn5 = document.createElement("OPTION");
                var optn6 = document.createElement("OPTION");
                var optn7 = document.createElement("OPTION");
                var optn8 = document.createElement("OPTION");
                //New Work 14/04/2022
                optn.text = "User Upload"; 
                optn.value = "1";
                new2.add(optn);
                optn8.text = "DP Beneficiary ID Upload"; 
                optn8.value = "2";
                new2.add(optn8);
//                optn2.text = "Investor Client Addition/Modification"; 
//                optn2.value = "0";
//                new2.add(optn2);
                optn4.text = "DP / POOL  HOLDING UPLOAD"; 
                optn4.value = "4";
                new2.add(optn4);
                optn5.text = "Dealer-Client Mapping (Addition/Removal)"; 
//                optn5.value = "8";
//                new2.add(optn5);
//                optn6.text = "Client Products Enabled"; 
//                optn6.value = "9";
//                new2.add(optn6);
//                optn7.text = "Default Dealer Upload"; 
//                optn7.value = "10";
//                new2.add(optn7);
                optn7.text = "Default Dealer Upload"; 
                optn7.value = "10";
                new2.add(optn7);
                optn5.text = "Dealer-Client Mapping (Addition/Removal)"; 
                optn5.value = "8";
                new2.add(optn5);
                optn3.text = "RMS Limit (Deposits Upload)"; 
                optn3.value = "3";
                new2.add(optn3);
                //End of New Work 14/04/2022
            }
            //New Work 14/04/2022
            function insert_DDLexport(obj)
            {
                var list  = document.getElementById('DDLexport');
                list.options.length = 0;
                var new2=document.getElementById("DDLexport");
                var optn3 = document.createElement("OPTION");
                var optn5 = document.createElement("OPTION");
                var optn7 = document.createElement("OPTION");
                if(obj=="8")
                {
                    optn5.text = "Dealer-Client Mapping (Addition/Removal)"; 
                    optn5.value = "8";
                    new2.add(optn5);
                    optn7.text = "Default Dealer Upload"; 
                    optn7.value = "10";
                    new2.add(optn7);
                    optn3.text = "RMS Limit (Deposits Upload)"; 
                    optn3.value = "3";
                    new2.add(optn3);
                }
                if(obj=="3")
                {
                    optn3.text = "RMS Limit (Deposits Upload)"; 
                    optn3.value = "3";
                    new2.add(optn3);
                    optn7.text = "Default Dealer Upload"; 
                    optn7.value = "10";
                    new2.add(optn7);
                    optn5.text = "Dealer-Client Mapping (Addition/Removal)"; 
                    optn5.value = "8";
                    new2.add(optn5);
                }
            }
            //End of New Work 14/04/2022
            function remove()
            {
                var list  = document.getElementById('DDLexport');
                var new9=document.getElementById("DDLexport");
                var optn10 = document.createElement("OPTION"); 
                list.options.length = 0;
                optn10.text = "Manual Postion"; 
                optn10.value = "11";
                new9.add(optn10);
            }
           function allhide()
           {
                  Hide('showFilter');
                  Hide('tr_ClientRms');
                  Hide('tr_UserRoleName');
                  Hide('dtfor');
                  Hide('tr_Category');
                  Hide('tr_tradedate');
                  Hide('tr_closepricedate');
                  Hide('tr_varmargin');
                  Hide('tr_Collateralholdingdatre');
                  Hide('tr_TradingAccount');
                  Hide('tr_MarginAccount');
                  Hide('tr_Product');
                  Hide('tr_generatedisplay');
                  Hide('tr_grd');
                  Hide('btngenerate');
                  Hide('btndisplay');
                  Hide('tr_sapn');
                  Hide('tr_iscollateral');
                  Hide('tr_evaluationmethod');
                  Hide('tr_chkproduct');
                  Hide('tr_rmslimtaging');
                  Hide('tr_unclearban');
                  Hide('tr_exchangeuserid');
                  Hide('tr_expirydate');
                  Hide('tr_exchangeuserinfo');
                  Hide('tr_enabledflag');
                  Hide('tr_considerdpholding');
                  Hide('display');
                  disabelchkrmslimit();
                  Hide('tr_UnApprovedShares');
                  Hide('tr_applyhaircut');
                  height();
                  selecttion();
           }
  function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
  function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
    function height()
        {
            if(document.body.scrollHeight>=560)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '560px';
            }
            //
        }
    function Fn_DDLexport(obj)
    {
       if(obj=="0" || obj=="1")
       {
                 Show('tr3');
                 document.getElementById("rdbDateAll").checked=true;
                 Show('lblFor');
                 Show('lblForValue');
                 Hide('tr_Segment');
                 Show('tr_ClientRms');
                 Show('tr_UserRoleName');
                 Show('tr_Category');
                 Hide('tr_tradedate');
                 Hide('tr_closepricedate');
                 Hide('tr_varmargin');
                 Hide('tr_Collateralholdingdatre');
                 Hide('tr_TradingAccount');
                 Hide('tr_MarginAccount');
                 Hide('tr_Product');
                 Hide('tr_generatedisplay');
                 Show('tr_show');
//                 New Work 04/08/2022
                 Show('tr_GenerateShow');
                 Show('aBtnShow');
//                 End of New Work 04/08/2022                 
                 Hide('btngenerate');
                 Hide('btndisplay');
                 Show('btn_show');
                 Hide('tr_grd');
                 Hide('tr_chkproduct');
                 Hide('tr_Category');
                 Hide('tr_rmslimtaging');
                 Hide('tr_unclearban');
                 Hide('tr_iscollateral');
                 Hide('tr_evaluationmethod');
                 Hide('tr_exchangeuserid');
                 Hide('tr_expirydate');
                 Hide('tr_exchangeuserinfo');
                 Hide('tr_enabledflag');
                 Hide('tr_considerdpholding');
                 Hide('display');
                 disabelchkrmslimit();
                 Hide('tr_UnApprovedShares');
                 Hide('tr_applyhaircut');
                 //New Work
                 Hide('displayHWCQ');
                 //End of New Work
                 height();
       }
       if(obj=="2")
       {
                 Show('tr3');
                 Show('lblFor');
                 Show('lblForValue');
                 document.getElementById("rdbDateSpecific").checked=true;
                 Hide('lblFor');
                 Hide('lblForValue');
                 Hide('tr_Segment');
                 Show('tr_ClientRms');
                 Show('tr_UserRoleName');
                 Show('tr_Category');
                 Hide('tr_tradedate');
                 Hide('tr_closepricedate');
                 Hide('tr_varmargin');
                 Hide('tr_Collateralholdingdatre');
                 Hide('tr_TradingAccount');
                 Hide('tr_MarginAccount');
                 Hide('tr_Product');
                 Hide('tr_generatedisplay');
                 Show('tr_show');
//                   New Work 04/08/2022
                 Show('tr_GenerateShow');
                 Show('aBtnShow');
//                 End of New Work 04/08/2022                 
                 Hide('btngenerate');
                 Hide('btndisplay');
                 Show('btn_show');
                 Hide('tr_grd');
                 Hide('tr_chkproduct');
                 Hide('tr_Category');
                 Hide('tr_rmslimtaging');
                 Hide('tr_unclearban');
                 Hide('tr_iscollateral');
                 Hide('tr_evaluationmethod');
                 Hide('tr_exchangeuserid');
                 Hide('tr_expirydate');
                 Hide('tr_exchangeuserinfo');
                 Hide('tr_enabledflag');
                 Hide('tr_considerdpholding');
                 Hide('display');
                 disabelchkrmslimit();
                 Hide('tr_UnApprovedShares');
                 Hide('tr_applyhaircut');
                 //New Work
                 Hide('displayHWCQ');
                 //End of New Work
                 height();
       }
      else if(obj=="3")
       {
                 Hide('tr3');
                 Hide('tr_ClientRms');
                 Hide('tr_UserRoleName');
                 Show('tr_Category');
                 Show('tr_tradedate');
                 Show('tr_closepricedate');
                 Show('tr_varmargin');
                 Show('tr_Collateralholdingdatre');
                 Show('tr_TradingAccount');
                 Show('tr_MarginAccount');
                 Show('tr_Segment');
                 Show('tr_Product');
                 Show('tr_generatedisplay');
                 Hide('tr_show');
//                 New Work 04/08/2022
                 Hide('tr_GenerateShow');
                 Hide('aBtnShow');
//                 End of New Work 04/08/2022                 
                 Hide('btngenerate');
                 Show('btndisplay');
                 Hide('btn_show');
                 Hide('tr_grd');
                 Hide('tr_chkproduct');
                 Show('tr_rmslimtaging');
                 Show('tr_unclearban');
                 Hide('tr_exchangeuserid');
                 Hide('tr_expirydate');
                 Hide('tr_exchangeuserinfo');
                 Hide('tr_enabledflag');
                 Hide('tr_iscollateral');
                 Hide('tr_evaluationmethod');
                 Show('tr_considerdpholding');
                 Show('display');
                 disabelchkrmslimit();
                 Show('tr_UnApprovedShares');
                 Show('tr_applyhaircut');
                 //New Work
                 Hide('displayHWCQ');
                 //End of New Work
                 height();
           
       }
       else  if(obj=="4")
       {
                 Hide('tr3');
                 Show('tr_Segment');
                 Show('tr_iscollateral');
                 Show('tr_evaluationmethod');
                 Hide('tr_ClientRms');
                 Hide('tr_UserRoleName');
                 Hide('tr_Category');
                 Show('tr_tradedate');
                 Hide('tr_closepricedate');
                 Hide('tr_varmargin');
                 Hide('tr_Collateralholdingdatre');
                 Hide('tr_TradingAccount');
                 Hide('tr_MarginAccount');
                 Hide('tr_Product');
                 Hide('tr_generatedisplay');
                 Show('tr_show');
//                 New Work 04/08/2022
                 Show('tr_GenerateShow');
                 Show('aBtnShow');
//                 End of New Work 04/08/2022                 
                 Hide('btngenerate');
                 Hide('btndisplay');
                 Show('btn_show');
                 Hide('tr_grd');
                 Hide('tr_chkproduct');
                 Hide('tr_rmslimtaging');
                 Hide('tr_unclearban');
                 Hide('tr_exchangeuserid');
                 Hide('tr_expirydate');
                 Hide('tr_exchangeuserinfo');
                 Hide('tr_enabledflag');
                 Hide('tr_considerdpholding');
                 Hide('display');
                 disabelchkrmslimit();
                 Hide('tr_UnApprovedShares');
                 Hide('tr_applyhaircut');
                 //New Work
                 Show('displayHWCQ');
                 //End of New Work
                 height();
       }
       else  if(obj=="5")
       {
                 Hide('tr3');
                 Hide('tr_Segment');
                 Hide('tr_ClientRms');
                 Hide('tr_UserRoleName');
                 Hide('tr_iscollateral');
                 Hide('tr_evaluationmethod');
                 Hide('tr_Category');
                 Show('tr_tradedate');
                 Hide('tr_closepricedate');
                 Hide('tr_varmargin');
                 Hide('tr_Collateralholdingdatre');
                 Hide('tr_TradingAccount');
                 Hide('tr_MarginAccount');
                 Hide('tr_Product');
                 Hide('tr_generatedisplay');
                 Show('tr_show');
//                 New Work 04/08/2022
                 Show('tr_GenerateShow');
                 Show('aBtnShow');
//                 End of New Work 04/08/2022                 
                 Hide('btngenerate');
                 Hide('btndisplay');
                 Show('btn_show');
                 Hide('tr_grd');
                 Hide('tr_chkproduct');
                 Hide('tr_rmslimtaging');
                 Hide('tr_unclearban');
                 Hide('tr_exchangeuserid');
                 Hide('tr_expirydate');
                 Hide('tr_exchangeuserinfo');
                 Hide('tr_enabledflag');
                 Hide('tr_considerdpholding');
                 Hide('display');
                 disabelchkrmslimit();
                 Hide('tr_UnApprovedShares');
                 Hide('tr_applyhaircut');
                 //New Work
                 Hide('displayHWCQ');
                 //End of New Work
                 height();
       }
       else  if(obj=="8")
       {
                 Hide('tr3');
                 Show('tr_Segment');
                 Hide('tr_iscollateral');
                 Hide('tr_ClientRms');
                 Hide('tr_UserRoleName');
                 Hide('tr_evaluationmethod');
                 Hide('tr_Category');
                 Hide('tr_tradedate');
                 Hide('tr_closepricedate');
                 Hide('tr_varmargin');
                 Hide('tr_Collateralholdingdatre');
                 Hide('tr_TradingAccount');
                 Hide('tr_MarginAccount');
                 Hide('tr_Product');
                 Hide('tr_generatedisplay');
                 Show('tr_show');
//                 New Work 04/08/2022
                 Show('tr_GenerateShow');
                 Show('aBtnShow');
//                 End of New Work 04/08/2022                 
                 Hide('btngenerate');
                 Hide('btndisplay');
                 Show('btn_show');
                 Hide('tr_grd');
                 Hide('tr_chkproduct');
                 Hide('tr_rmslimtaging');
                 Hide('tr_unclearban');
                 Hide('tr_exchangeuserid');
                 Hide('tr_expirydate');
                 Hide('tr_exchangeuserinfo');
                 Hide('tr_enabledflag');
                 Hide('tr_considerdpholding');
                 Hide('display');
                 disabelchkrmslimit();
                 Hide('tr_UnApprovedShares');
                 Hide('tr_applyhaircut');
                 //New Work
                 Hide('displayHWCQ');
                 //End of New Work
                 height();
       }
       else  if(obj=="9")
       {
                 Hide('tr3');
                 Hide('tr_Segment');
                 Hide('tr_ClientRms');
                 Hide('tr_UserRoleName');
                 Hide('tr_iscollateral');
                 Hide('tr_evaluationmethod');
                 Hide('tr_Category');
                 Hide('tr_tradedate');
                 Hide('tr_closepricedate');
                 Hide('tr_varmargin');
                 Hide('tr_Collateralholdingdatre');
                 Hide('tr_TradingAccount');
                 Hide('tr_MarginAccount');
                 Hide('tr_Product');
                 Hide('tr_generatedisplay');
                 Show('tr_show');
//                 New Work 04/08/2022
                 Show('tr_GenerateShow');
                 Show('aBtnShow');
//                 End of New Work 04/08/2022                 
                 Hide('btngenerate');
                 Hide('btndisplay');
                 Show('btn_show');
                 Hide('tr_grd');
                 Show('tr_chkproduct');
                 Hide('tr_rmslimtaging');
                 Hide('tr_unclearban');
                 Hide('tr_exchangeuserid');
                 Hide('tr_expirydate');
                 Hide('tr_exchangeuserinfo');
                 Hide('tr_enabledflag');
                 Hide('tr_considerdpholding');
                 Hide('display');
                 disabelchkrmslimit();
                 Hide('tr_UnApprovedShares');
                 Hide('tr_applyhaircut');
                 //New Work
                 Hide('displayHWCQ');
                 //End of New Work
                 height();
       }
       else if(obj=="10")
       {
                Hide('showFilter');
                Hide('tr_ClientRms');
                Hide('tr_UserRoleName');
                Hide('dtfor');
                Show('tr_Segment');
                Hide('tr_Category');
                Hide('tr_tradedate');
                Hide('tr_closepricedate');
                Hide('tr_varmargin');
                Hide('tr_Collateralholdingdatre');
                Hide('tr_TradingAccount');
                Hide('tr_MarginAccount');
                Hide('tr_Product');
                Hide('tr_generatedisplay');
                Show('tr_show');
//                 New Work 04/08/2022
                 Show('tr_GenerateShow');
                 Show('aBtnShow');
//                 End of New Work 04/08/2022                
                Hide('btngenerate');
                Hide('btndisplay');
                Show('btn_show');
                Hide('tr_grd');
                Hide('tr_chkproduct');
                //New Work 14/04/2022
//                Show('tr_exchangeuserid');
//                Show('tr_expirydate');
//                Show('tr_exchangeuserinfo');
//                Show('tr_enabledflag');
                Hide('tr_exchangeuserid');
                Hide('tr_expirydate');
                Hide('tr_exchangeuserinfo');
                Hide('tr_enabledflag');
                //End of New Work 14/04/2022
                Hide('tr_rmslimtaging');
                Hide('tr_unclearban');
                Hide('tr_iscollateral');
                Hide('tr_evaluationmethod');
                Hide('tr_considerdpholding');
                Hide('display');
                disabelchkrmslimit();
                Hide('tr_UnApprovedShares');
                Hide('tr_applyhaircut');
                //New Work
                 Hide('displayHWCQ');
                 //End of New Work
                height();
               
       }
       else if(obj=="TAW_RMS" || obj=="TAW_POS")
       {
            TWA_InterfaceSetting(obj);
            document.getElementById("HiddenField_WhichTAWType").value=obj;
       }
       else
        {
            Hide('showFilter');
            Hide('tr_ClientRms');
            Hide('tr_UserRoleName');
            Hide('dtfor');
            Show('tr_Segment');
            Hide('tr_Category');
            Hide('tr_tradedate');
            Hide('tr_closepricedate');
            Hide('tr_varmargin');
            Hide('tr_Collateralholdingdatre');
            Hide('tr_TradingAccount');
            Hide('tr_MarginAccount');
            Hide('tr_Product');
            Hide('tr_generatedisplay');
            Show('tr_show');
//          New Work 04/08/2022
            Show('tr_GenerateShow');
            Show('aBtnShow');
//          End of New Work 04/08/2022            
            Hide('btngenerate');
            Hide('btndisplay');
            Show('btn_show');
            Hide('tr_grd');
            Hide('tr_chkproduct');
            Hide('tr_exchangeuserid');
            Hide('tr_expirydate')
            Hide('tr_exchangeuserinfo');
            Hide('tr_enabledflag');
            Hide('tr_iscollateral');
            Hide('tr_evaluationmethod');
            Hide('tr_considerdpholding');
            Hide('display');
            disabelchkrmslimit();
            Hide('tr_UnApprovedShares');
            Hide('tr_applyhaircut');
            //New Work
             Hide('displayHWCQ');
             //End of New Work
            height();
               
        }
        selecttion();
        height();
    }
    function TWA_InterfaceSetting(WhichCall)
    {
        if(WhichCall=="TAW_RMS")
        {
             Hide('tr3');
             Hide('tr_ClientRms');
             Hide('tr_UserRoleName');
             Show('tr_Category');
             Show('tr_tradedate');
             Show('tr_closepricedate');
             Show('tr_varmargin');
             Show('tr_Collateralholdingdatre');
             Show('tr_TradingAccount');
             Show('tr_MarginAccount');
             Hide('tr_Segment');
             Show('tr_Product');
             Show('tr_generatedisplay');
             Hide('tr_show');
//           New Work 04/08/2022
             Hide('tr_GenerateShow');
             Hide('aBtnShow');
//           End of New Work 04/08/2022             
             Hide('btngenerate');
             Show('btndisplay');
             Hide('btn_show');
             Hide('tr_grd');
             Hide('tr_chkproduct');
             Show('tr_rmslimtaging');
             Show('tr_unclearban');
             Hide('tr_exchangeuserid');
             Hide('tr_expirydate');
             Hide('tr_exchangeuserinfo');
             Hide('tr_enabledflag');
             Hide('tr_iscollateral');
             Hide('tr_evaluationmethod');
             Show('tr_considerdpholding');
             Show('display');
             Show('tr_UnApprovedShares');
             Show('tr_applyhaircut');
             //New Work
             Hide('displayHWCQ');
             //End of New Work
             height();
        }
        else
        {
                 
            Hide('tr3');
            Hide('tr_ClientRms');
            Hide('tr_UserRoleName');
            Hide('tr_Category');
            Show('tr_tradedate');
            Hide('tr_closepricedate');
            Hide('tr_varmargin');
            Hide('tr_Collateralholdingdatre');
            Hide('tr_TradingAccount');
            Hide('tr_MarginAccount');
            Hide('tr_Segment');
            Hide('tr_Product');
            Hide('btngenerate');
            Hide('btn_show');
//           New Work 04/08/2022
             Hide('aBtnShow');
//           End of New Work 04/08/2022            
            Hide('tr_grd');
            Hide('tr_chkproduct');
            Hide('tr_rmslimtaging');
            Hide('tr_unclearban');
            Hide('tr_exchangeuserid');
            Hide('tr_expirydate');
            Hide('tr_exchangeuserinfo');
            Hide('tr_enabledflag');
            Hide('tr_iscollateral');
            Hide('tr_evaluationmethod');
            Hide('tr_considerdpholding');
            Hide('display');
            disabelchkrmslimit();
            Hide('tr_UnApprovedShares');
            Hide('tr_applyhaircut');
            Show('Tr2');
            Hide('Tr3');
            Hide('showFilter');
            Show("tr_show");
//           New Work 04/08/2022
             Show('tr_GenerateShow');
             Show("aBtnShow");
//           End of New Work 04/08/2022            
            Show("btn_show");
            Hide("tr_generatedisplay");
            //New Work
            Hide('displayHWCQ');
            //End of New Work
        }
    }
     function Segment(obj)
        {
             if(obj=="a")
             {
                Hide('showFilter');
             }
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Segment';
                  Show('showFilter');
             }
             Hide('litSegmentMain');
             selecttion();
            
        }
      function Clients(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Clients';
                  Show('showFilter');
             }
             selecttion();
        }
      function Branch(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                   if(document.getElementById('ddlGroup').value=="0")
                   {
                    document.getElementById('cmbsearchOption').value='Branch';
                   }
                   if(document.getElementById('ddlGroup').value=="2")
                   {
                    document.getElementById('cmbsearchOption').value='BranchGroup';
                   }
                  Show('showFilter');
             }
             selecttion(); 
      }
     function Group(obj)
      {
            if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='Group';
                  Show('showFilter');
             }
           selecttion();
      }
       function FunClientScrip(objID,objListFun,objEvent)
        {
          var cmbVal;
         
            if(document.getElementById('cmbsearchOption').value=="Clients")
            {
                if(document.getElementById('ddlGroup').value=="0" || document.getElementById('ddlGroup').value=="2")//////////////Group By  selected are branch
                {
                    if(document.getElementById('ddlGroup').value=="0")
                    {
                        if(document.getElementById('rdbranchAll').checked==true)
                           {
                               cmbVal='ClientsBranch'+'~'+'ALL';
                           }
                       else
                           {
                               cmbVal='ClientsBranch'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Branch').value;
                           }
                    }
                    if(document.getElementById('ddlGroup').value=="2")
                    {
                       if(document.getElementById('rdbranchAll').checked==true)
                           {
                               cmbVal='ClientsBranchGroup'+'~'+'ALL';
                           }
                       else
                           {
                               cmbVal='ClientsBranchGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_BranchGroup').value;
                           }
                    }
                }
               else //////////////Group By selected are Group
                {
                   if(document.getElementById('rdddlgrouptypeAll').checked==true)
                       {
                           cmbVal='ClientsGroup'+'~'+'ALL'+'~'+document.getElementById('ddlgrouptype').value;
                       }
                   else
                       {
                           cmbVal='ClientsGroup'+'~'+'Selected'+'~'+document.getElementById('HiddenField_Group').value;
                       }
               }
            }
            else
            {
                cmbVal=document.getElementById('cmbsearchOption').value;
                cmbVal=cmbVal+'~'+document.getElementById('ddlgrouptype').value;
            }
          
          ajax_showOptions(objID,objListFun,objEvent,cmbVal);

        }
        function btnAddsubscriptionlist_click()
            {
            
                var cmb=document.getElementById('cmbsearchOption');
                        var userid = document.getElementById('txtSelectionID');
                        if(userid.value != '')
                        {
                            var ids = document.getElementById('txtSelectionID_hidden');
                            var listBox = document.getElementById('lstSlection');
                            var tLength = listBox.length;
                           
                            
                            var no = new Option();
                            no.value = ids.value;
                            no.text = userid.value;
                            listBox[tLength]=no;
                            var recipient = document.getElementById('txtSelectionID');
                            recipient.value='';
                        }
                        else
                            alert('Please search name and then Add!')
                        var s=document.getElementById('txtSelectionID');
                        s.focus();
                        s.select();
                   
            }
        
      function clientselectionfinal()
	        {
	            var listBoxSubs = document.getElementById('lstSlection');
	          
                var cmb=document.getElementById('cmbsearchOption');
                var listIDs='';
                var i;
                if(listBoxSubs.length > 0)
                {  
                           
                    for(i=0;i<listBoxSubs.length;i++)
                    {
                        if(listIDs == '')
                            listIDs = listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                        else
                            listIDs += ',' + listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                    }
                    var sendData = cmb.value + '~' + listIDs;
                    CallServer(sendData,"");
                   
                }
	            var i;
                for(i=listBoxSubs.options.length-1;i>=0;i--)
                {
                    listBoxSubs.remove(i);
                }
            
                Hide('showFilter');
                document.getElementById('btn_show').disabled=false;
                //New Work 04/08/2022
                document.getElementById('aBtnShow').disabled=false;
                //End of New Work 04/08/2022
	        }
	     
	   function btnRemovefromsubscriptionlist_click()
            {
                
                var listBox = document.getElementById('lstSlection');
                var tLength = listBox.length;
                
                var arrTbox = new Array();
                var arrLookup = new Array();
                var i;
                var j = 0;
                for (i = 0; i < listBox.options.length; i++) 
                {
                    if (listBox.options[i].selected && listBox.options[i].value != "") 
                    {
                        
                    }
                    else 
                    {
                        arrLookup[listBox.options[i].text] = listBox.options[i].value;
                        arrTbox[j] = listBox.options[i].text;
                        j++;
                    }
                }
                listBox.length = 0;
                for (i = 0; i < j; i++) 
                {
                    var no = new Option();
                    no.value = arrLookup[arrTbox[i]];
                    no.text = arrTbox[i];
                    listBox[i]=no;
                }
            }
  function  fnddlGroup(obj)
   {
        if(obj=="0" || obj=="2")
        {
            Hide('td_group');
            Show('td_branch');
        }
        else if(obj=="1")
        {
            Show('td_group');
            Hide('td_branch');
            var btn = document.getElementById('btnhide');
            btn.click();
        }
        selecttion();
   }
   function fngrouptype(obj)
   {
       if(obj=="0")
       {
       Hide('td_allselect');
        alert('Please Select Group Type !');
       }
       else
       {
       Show('td_allselect');
       }
       selecttion();
   }
   function norecord()
   {
                    alert('No Record Found');
                    //New Work 14/04/2022
//                    window.location = "../management/frontendexports.aspx";
                    //End of New Work 14/04/2022
//                    allhide();
//                    Show('Tr1');
//                    Show('Tr2');
//                    alert('No Record Found');
//                    Show('tr3');
//                    Hide('tr_Segment');
//                    Show('tr_Group');
//                    Show('tr_Clients');
//                    Show('tr_show');
//                    disabelchkrmslimit();
//                    height();
//                    selecttion();
   }
   function norecordforinvclientsegment(obj)
   {
   Hide('showFilter');
                    Hide('tr_ClientRms');
                    Hide('tr_UserRoleName');
                    Hide('dtfor');
                    Show('tr_Segment');
                    Hide('tr_Category');
                    Hide('tr_tradedate');
                    Hide('tr_closepricedate');
                    Hide('tr_varmargin');
                    Hide('tr_Collateralholdingdatre');
                    Hide('tr_TradingAccount');
                    Hide('tr_MarginAccount');
                    Hide('tr_Product');
                    Hide('tr_generatedisplay');
                    Show('tr_show');
//                  New Work 04/08/2022
                    Show('tr_GenerateShow');
                    Show('aBtnShow');
//                  End of New Work 04/08/2022                    
                    Hide('btngenerate');
                    Hide('btndisplay');
                    Show('btn_show');
                    Hide('tr_grd');
                    Hide('tr_chkproduct');
                    Show('tr_exchangeuserid');
                    Show('tr_expirydate');
                    Show('tr_exchangeuserinfo');
                    Show('tr_enabledflag');
                    Hide('tr_rmslimtaging');
                    Hide('tr_unclearban');
                    Hide('tr_iscollateral');
                    Hide('tr_evaluationmethod');
                    Hide('tr_sapn');
                    Hide('tr_considerdpholding');
                    Hide('display');
                    disabelchkrmslimit();
                    Hide('tr_UnApprovedShares');
                    Hide('tr_applyhaircut');
                    //New Work
                    Hide('displayHWCQ');
                    //End of New Work
   if(obj==1)
   {
    alert('No Record Found');
   }
   else if(obj==2)
   {
    alert('Please Insert Exchange User Info!');
   }
  else if(obj==3)
   {
    alert('Please Insert Exchange User Id For NSE!');
   }                
   else if(obj==4)
   {
    alert('Please Insert Exchange User Id For NSEFO!');
   }                
                    height();
                    selecttion();
   }
   function display(obj)
     {
        document.getElementById('spanshow2').innerText=obj;
        Hide('btndisplay');
        Show('btngenerate');
        Show('tr_grd');
        Show('tr_sapn');
        Hide('Tr1');
        Hide('Tr2');
        Hide('tr3');
        Hide('tr_Segment');
        Hide('tr_Group');
        Hide('tr_Clients');
        Hide('tr_ClientRms');
        Hide('tr_UserRoleName');
        Hide('tr_Category');
        Hide('tr_Product');
        Hide('tr_tradedate');
        Hide('tr_closepricedate');
        Hide('tr_varmargin');
        Hide('tr_Collateralholdingdatre');
        Hide('tr_MarginAccount');
        Hide('tr_TradingAccount');
        Hide('tr_rmslimtaging');
        Hide('tr_unclearban');
        Hide('tr_considerdpholding');
        Hide('display');
        Hide('tr_UnApprovedShares');
        Hide('tr_applyhaircut');
        //New Work
        Hide('displayHWCQ');
        //End of New Work
        
        height();
        selecttion();
     }
   function fn_checkdate(obj)
   {
        if(obj=='all')
        {
            Hide('dtfor');
        }
        else
        {
            Show('dtfor');
        }
   selecttion();
   }
  function Fn_DDLformat(obj)
  {
        //Reset Hidden Value For TAW Type----Only Used For TAW
        document.getElementById("HiddenField_WhichTAWType").value="";
        if(obj=='ODIN')
        {
           Hide('Tr2');
           Hide('Tr3');
           Hide('tr_ClientRms');
           Hide('tr_UserRoleName');
           Show('tr_Segment')
           
        }
       if(obj=='ODIN')
        {
                
           insert();
           Show('Tr2');
           Show('Tr3');
           Show('lblFor');
           Show('lblForValue');
           Show('tr_ClientRms');
           Show('tr_UserRoleName');
           Hide('tr_Segment');
           Hide('showFilter');
           document.getElementById('rdbranchAll').checked=true;
           document.getElementById('rdbClientALL').checked=true;
           document.getElementById('rdbSegmentAll').checked=true;
           document.getElementById('rdddlgrouptypeAll').checked=true;
           document.getElementById('HiddenField_Group').value='';
           document.getElementById('HiddenField_Segment').value='';
           document.getElementById('HiddenField_Client').value='';
        
        }
       if(obj=='Odinfront')
        {       

                 Hide('tr_filter');
                 remove();
                 Show ('Tr2');
                 Hide('tr3');
                 Show('tr_Segment');
                 Hide('tr_iscollateral');
                 Hide('tr_evaluationmethod');
                 Hide('tr_ClientRms');
                 Hide('tr_UserRoleName');
                 Hide('tr_Category');
                 Show('tr_tradedate');
                 Hide('tr_closepricedate');
                 Hide('tr_varmargin');
                 Hide('tr_Collateralholdingdatre');
                 Hide('tr_TradingAccount');
                 Hide('tr_MarginAccount');
                 Hide('tr_Product');
                 Hide('tr_generatedisplay');
                 Show('tr_show');
//               New Work 04/08/2022
                 Show('tr_GenerateShow');
                 Show('aBtnShow');
//               End of New Work 04/08/2022                 
                 Hide('btngenerate');
                 Hide('btndisplay');
                 Show('btn_show');
                 Hide('tr_grd');
                 Hide('tr_chkproduct');
                 Hide('tr_rmslimtaging');
                 Hide('tr_unclearban');
                 Hide('tr_exchangeuserid');
                 Hide('tr_expirydate');
                 Hide('tr_exchangeuserinfo');
                 Hide('tr_enabledflag');
                 Hide('tr_considerdpholding');
                 Hide('display');
                 disabelchkrmslimit();
                 Hide('tr_UnApprovedShares');
                 Hide('tr_applyhaircut');
                 height();
        
        }
        if(obj=='NCM')
        {
           Hide('Tr2');
           Show('Tr3');
           Show('lblFor');
           Show('lblForValue');
           Hide('tr_ClientRms');
           Hide('tr_UserRoleName');
           Hide('tr_Segment');
           Hide('showFilter');
           document.getElementById('rdbranchAll').checked=true;
           document.getElementById('rdbClientALL').checked=true;
           document.getElementById('rdbSegmentAll').checked=true;
           document.getElementById('rdddlgrouptypeAll').checked=true;
           document.getElementById('HiddenField_Group').value='';
           document.getElementById('HiddenField_Segment').value='';
           document.getElementById('HiddenField_Client').value='';
    
    
        }
        if(obj=='TAW')
        {
           DDL_RemoveItem("DDLexport");
           DDL_AddItem("DDLexport","RMS LIMIT","TAW_RMS");
           DDL_AddItem("DDLexport","Open Position","TAW_POS");
           document.getElementById("HiddenField_WhichTAWType").value="TAW_RMS";
           TWA_InterfaceSetting("TAW_RMS");
        }
  }
    function dateassign(s)
         {
            //Check If Its Not Trade Any Where Export.. Then No Need To Use this Kinda Assignment
            var IsTAW=document.getElementById("HiddenField_WhichTAWType").value;
            
            if(IsTAW!="TAW_POS")
            {
                 var date1 = dtdate.GetDate();
                 if(date1 != null) 
                 {
                   var date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
                   var prevdate2=parseInt(date1.getMonth()+1)+'-'+(date1.getDate()-1)+'-'+ date1.getFullYear();
                  
                   dtcdate.SetDate(new Date(date2));
                   dthdate.SetDate(new Date(date2));
        //         dttbdate.SetDate(new Date(date2));
                   dtmcdate.SetDate(new Date(date2));
                   dtvmargindate.SetDate(new Date(date2));
                   //document.getElementById('Button1').click();
                   cCbpdttbdate.PerformCallback();
                 } 
             }
            selecttion();
         } 

     function Filter()
     {
         Show('tr3');
         Show('lblFor');
         Show('lblForValue');
         Show('tr_ClientRms');
         Show('tr_UserRoleName');
         Show('tr_Category');
         Show('tr_tradedate');
         Show('tr_closepricedate');
         Show('tr_varmargin');
         Show('tr_Collateralholdingdatre');
         Show('tr_TradingAccount');
         Show('tr_MarginAccount');
         Show('tr_Segment');
         Show('tr_Product');
         Show('tr_generatedisplay');
         Show('tr_show');
//       New Work 04/08/2022
         Show('tr_GenerateShow');
         Show('aBtnShow');
//       End of New Work 04/08/2022         
         Show('btngenerate');
         Show('btndisplay');
         Show('btn_show');
         Show('tr_grd');
         Show('tr_chkproduct');
         Show('tr_rmslimtaging');
         Show('tr_unclearban');
         Show('tr_exchangeuserid');
         Show('tr_expirydate');
         Show('tr_exchangeuserinfo');
         Show('tr_enabledflag');
         Show('tr_iscollateral');
         Show('tr_evaluationmethod');
         Show('tr_considerdpholding');
         Show('display');
         Show('tr_UnApprovedShares');
         Show('tr_applyhaircut');
         //New Work
         Show('displayHWCQ');
         //End of New Work
         
        var ddlExportValue=document.getElementById("ddlExport").value;
        Fn_DDLexport(ddlExportValue);
        
     }  
      function ChangeRowColor(rowID) 
        {
            var gridview = document.getElementById('grdrmslimit'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1; 
            for (rowIndex; rowIndex<=rCount-1; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if(color != '#ffe1ac') 
            {
                oldColor = color;
            }
            if(color == '#ffe1ac') 
            {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else 
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac'; 

            
        }   
       function isNumberKey(e)      
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
      function fnchkUnApprovedShares(obj)
      {
        if(obj.checked==true)
        {
       
            document.getElementById('txtUnApprovedShares_I').disabled=false;
        }
        else
        {
       
            document.getElementById('txtUnApprovedShares_I').disabled=true;
        }
        selecttion();
      }
     function fnChkunclearban(obj)
      {
        if(obj.checked==true)
        {
       
            document.getElementById('txtrmslimtunclrd_I').disabled=false;
        }
        else
        {
       
            document.getElementById('txtrmslimtunclrd_I').disabled=true;
        }
        selecttion();
      }
     function fnchkrmslimtaging(obj)
      {
        if(obj.checked==true)
        {
            document.getElementById('txtrmslimtaging1_I').disabled=false;
            document.getElementById('txtrmslimtaging2_I').disabled=false;
            document.getElementById('txtrmslimtaging3_I').disabled=false;
        }
        else
        {
            document.getElementById('txtrmslimtaging1_I').disabled=true;
            document.getElementById('txtrmslimtaging2_I').disabled=true;
            document.getElementById('txtrmslimtaging3_I').disabled=true;
        }
        selecttion();
      }
      
       
       $(function () {

        $('#<%= chkdpholdvalue.ClientID  %>').click(function (e) {

            var RadioButton1 = $('#<%= rdbPOAAll.ClientID %>');
            var RadioButton2 = $('#<%= rdbPOASelected.ClientID %>');

            if (this.checked) {
                RadioButton1.removeAttr('disabled');
                RadioButton2.removeAttr('disabled');   
            }
            else {
                RadioButton1.attr('disabled', true);
                RadioButton2.attr('disabled', true);
            }
           });
        });
      
      function disabelchkrmslimit()
      {
        document.getElementById('txtUnApprovedShares_I').disabled=true;
        document.getElementById('txtrmslimtunclrd_I').disabled=true;
        document.getElementById('txtrmslimtaging1_I').disabled=true;
        document.getElementById('txtrmslimtaging2_I').disabled=true;
        document.getElementById('txtrmslimtaging3_I').disabled=true;
        selecttion();
      }
    function fnchktxtchk(obj)
     {
       if(obj>100.00)
       {
            txtUnApprovedShares.SetValue('100.00');
       }
       selecttion();
     }
    function selecttion()
    {
        var combo=document.getElementById('cmbExport');
        combo.value='Ex';
    } 
    function DDL_RemoveItem(DDL)
    {
        var DDL_Remove  = document.getElementById(DDL);
        DDL_Remove.options.length = 0;
    }
    function DDL_AddItem(DDL,ItemText,ItemValue)
    {
        var DDL_Insert  = document.getElementById('DDLexport');
        var DDL_Option = document.createElement("OPTION"); 
        DDL_Option.text = ItemText;
        DDL_Option.value = ItemValue;
        DDL_Insert.add(DDL_Option);
    }
    
    //    New Work 04/08/2022
    function GnrcCallBackPanel_Methods(WhichCall)
    {
        Show("divLoading");
        cBtnShow.SetEnabled(false);
        cGnrcCallBackPanel.PerformCallback(WhichCall+'~');
    }
    function GnrcCallBackPanel_EndCallBack()
    {
        if(cGnrcCallBackPanel.cpIsSpData!=undefined)
        {
            if(cGnrcCallBackPanel.cpIsSpData=="GenerateShow")
                GetObjectID('btnGenerateShow').click();
        }
        Hide("divLoading");
        cBtnShow.SetEnabled(true);
        Height('350','350'); 
    }
//    End of New Work 04/08/2022
    function Cbpdttbdate_EndCallBack()
    {
    }
//    function DDL_RemoveItemAt(var DDL,var RIndex)
//    {
//        var select=document.getElementById(DDL);
//        select.remove(RIndex);
//    }
//    function DDL_RemoveItemByValue(var DDL,var RValue)
//    {
//        var select=document.getElementById(DDL);
//        for (i=0;i<select.length;  i++) 
//        {
//            if (select.options[i].value==RValue) 
//                select.remove(i);
//        }
//    } 
    FieldName='lstSlection';
    </script>

    <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                var j=rValue.split('~');
                var btn = document.getElementById('btnhide');
              
                if(j[0]=='Branch')
                {
                    document.getElementById('HiddenField_Branch').value = j[1];
                }
                if(j[0]=='Group')
                {
                    document.getElementById('HiddenField_Group').value = j[1];
                    btn.click();
                }  
                if(j[0]=='Clients')
                {
                    document.getElementById('HiddenField_Client').value = j[1];
                } 
                if(j[0]=='BranchGroup')
                {
                    document.getElementById('HiddenField_BranchGroup').value = j[1];
                }
                if(j[0]=='Segment')
                {
                    document.getElementById('HiddenField_Segment').value = j[1];
                } 
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>

            <script language="javascript" type="text/javascript"> 
   var prm = Sys.WebForms.PageRequestManager.getInstance(); 
   prm.add_initializeRequest(InitializeRequest); 
   prm.add_endRequest(EndRequest); 
   var postBackElement; 
   function InitializeRequest(sender, args) 
   { 
      if (prm.get_isInAsyncPostBack()) 
         args.set_cancel(true); 
            postBackElement = args.get_postBackElement(); 
         $get('UpdateProgress1').style.display = 'block'; 
   } 
   function EndRequest(sender, args) 
   { 
          $get('UpdateProgress1').style.display = 'none'; 
 
   } 
            </script>

            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 22px;">
                        <strong><span id="SpanHeader" style="color: #000099">Front-End Exports For ODIN</span></strong>
                    </td>
                    <td class="EHEADER" width="15%" id="tr_filter" style="height: 22px">
                       <%-- <a href="javascript:void(0);" onclick="Filter();"><span style="color: Blue; text-decoration: underline;
                            font-size: 8pt; font-weight: bold">Filter</span></a>--%>
                                         <asp:DropDownList ID="cmbExport" runat="server" AutoPostBack="True"  Font-Size="10px" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged">
                                                    <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                                                    <asp:ListItem Value="E">Excel</asp:ListItem>
                                                    <asp:ListItem Value="P">PDF</asp:ListItem>
                                                </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table border="1">
                <tr valign="top" id="Tr1">
                    <td class="gridcellleft" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                        Format :
                    </td>
                    <td>
                        <asp:DropDownList ID="DDLformat" runat="server" Width="150px" Font-Size="10px" onchange="Fn_DDLformat(this.value)" Enabled="false">
                            <asp:ListItem Value="ODIN">ODIN</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr valign="top" id="Tr2">
                    <td class="gridcellleft" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                        Export Type :
                    </td>
                    <td>
                        <asp:DropDownList ID="DDLexport" runat="server" Width="250px" Font-Size="10px" onchange="Fn_DDLexport(this.value)">
                            <asp:ListItem Value="3">RMS Limit (Deposits Upload)</asp:ListItem>
                            <asp:ListItem Value="1">User Upload</asp:ListItem>
                            <asp:ListItem Value="2">DP Beneficiary ID Upload</asp:ListItem>
                            <asp:ListItem Value="4">DP / POOL  HOLDING UPLOAD</asp:ListItem>
                            <asp:ListItem Value="8">Dealer-Client Mapping (Addition/Removal)</asp:ListItem>
                            <asp:ListItem Value="9">Client Products Enabled</asp:ListItem>
                            <asp:ListItem Value="10">Default Dealer Upload</asp:ListItem>
                            <asp:ListItem Value="11">Manual position</asp:ListItem>
                            <asp:ListItem Value="12">Open position</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <table id="tab2" border="1">
                <tr>
                    <td align="left">
                        <table border="1">
                            <tr valign="top">
                                <td>
                                    <table border="1" bordercolor="#1">
                                        <tr id="tr3">
                                            <td id="lblFor" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                For :</td>
                                            <td id="lblForValue">
                                                <asp:RadioButton ID="rdbDateAll" Checked="true" runat="server" GroupName="ef" onclick="fn_checkdate('all')" />All
                                                Dates
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbDateSpecific" runat="server" GroupName="ef" onclick="fn_checkdate('spec')" />Specific
                                                Date
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                                    <dropdownbutton text="For"></dropdownbutton>
                                                </dxe:ASPxDateEdit>
                                                
                                            </td>
                                            <td colspan="2">
                                            </td>
                                        </tr>
                                        <tr id="tr_Segment">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Segment :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentAll" runat="server" GroupName="b" onclick="Segment('a')" />All
                                            </td>
                                            <td>
                                                <asp:RadioButton ID="rdbSegmentSelected" runat="server" Checked="True" GroupName="b"
                                                    onclick="Segment('b')" />Selected <span id="litSegmentMain" runat="server" style="color: Maroon">
                                                    </span>
                                            </td>
                                            <td colspan="3">
                                            </td>
                                        </tr>
                                        <tr id="tr_Group">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Group By</td>
                                            <td>
                                                <asp:DropDownList ID="ddlGroup" runat="server" Width="120px" Font-Size="10px" onchange="fnddlGroup(this.value)">
                                                    <asp:ListItem Value="0">Branch</asp:ListItem>
                                                    <asp:ListItem Value="1">Group</asp:ListItem>
                                                     <asp:ListItem Value="2">Branch Group</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td colspan="2" id="td_branch">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:RadioButton ID="rdbranchAll" runat="server" Checked="True" GroupName="c" onclick="Branch('a')" />
                                                            All
                                                        </td>
                                                        <td>
                                                            <asp:RadioButton ID="rdbranchSelected" runat="server" GroupName="c" onclick="Branch('b')" />Selected
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td id="td_group" style="display: none;" colspan="2">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:DropDownList ID="ddlgrouptype" runat="server" Font-Size="10px" onchange="fngrouptype(this.value)">
                                                                    </asp:DropDownList>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnhide" EventName="Click"></asp:AsyncPostBackTrigger>
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                        <td id="td_allselect" style="display: none;">
                                                            <asp:RadioButton ID="rdddlgrouptypeAll" runat="server" Checked="True" GroupName="e"
                                                                onclick="Group('a')" />
                                                            All
                                                            <asp:RadioButton ID="rdddlgrouptypeSelected" runat="server" GroupName="e" onclick="Group('b')" />Selected
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr id="tr_Clients">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Clients :</td>
                                            <td>
                                                <asp:RadioButton ID="rdbClientALL" runat="server" Checked="True" GroupName="d" onclick="Clients('a')" />
                                                All Client
                                            </td>
                                            <td>
                                                    <asp:RadioButton ID="radPOAClient" runat="server" GroupName="d" onclick="Clients('a')" />POA Client
                                                </td>
                                               
                                            
                                            <td>
                                                <asp:RadioButton ID="rdbClientSelected" runat="server" GroupName="d" onclick="Clients('b')" />
                                                Selected Client
                                            </td>
                                            <%--New Work--%>
                                            <td>
                                                <asp:RadioButton ID="rdbClientAllButSelected" runat="server" GroupName="d" onclick="Clients('b')" />
                                                AllButSelected Client
                                            </td>
                                            <%--End of New Work--%>
                                            <td colspan="2">
                                            </td>
                                        </tr>
                                        <tr id="tr_ClientRms">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Client RMS Category :</td>
                                            <td colspan="5">
                                                <asp:TextBox ID="TxtRms" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr id="tr_UserRoleName">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                User Role Name :</td>
                                            <td colspan="5">
                                                <asp:TextBox ID="TxtUserRoleName" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr id="tr_Category">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Category :</td>
                                            <td colspan="5">
                                                <asp:TextBox ID="TxtCategory" runat="server"></asp:TextBox><span style="color:red">Use '|' to define two categary like "NrmlCat|SpecCat"</span>
                                            </td>
                                            
                                        </tr>
                                        <tr id="tr_Product">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Product :</td>
                                            <td>
                                                <asp:DropDownList ID="DDLProduct" runat="server" Width="100px" Font-Size="10px">
                                                    <asp:ListItem Value="All Products">All Products</asp:ListItem>
                                                    <asp:ListItem Value="NRML">NRML</asp:ListItem>
                                                    <asp:ListItem Value="CNC">CNC</asp:ListItem>
                                                    <asp:ListItem Value=" MIS"> MIS</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr id="tr_tradedate">
                                            <td valign="top" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Trade Date :</td>
                                            <td colspan="5"><asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                <dxe:ASPxDateEdit ID="dtdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtdate">
                                                    <dropdownbutton text="For">
                                                    </dropdownbutton>
                                                    <clientsideevents valuechanged="function(s, e) {dateassign(s);}" />
                                                </dxe:ASPxDateEdit></ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click"></asp:AsyncPostBackTrigger>
                                                </Triggers>
                                            </asp:UpdatePanel></td>
                                        </tr>
                                        <tr id="tr_closepricedate">
                                            <td valign="top" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Collateral Valuation Date :</td>
                                            <td colspan="5">
                                                <dxe:ASPxDateEdit ID="dtcdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtcdate">
                                                    <dropdownbutton text="For">
                                        </dropdownbutton>
                                                </dxe:ASPxDateEdit></td>
                                        </tr>
                                        <tr id="tr_varmargin">
                                            <td valign="top" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Var Margin Date :</td>
                                            <td colspan="5">
                                                <dxe:ASPxDateEdit ID="dtvmargindate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtvmargindate">
                                                    <dropdownbutton text="For">
                                        </dropdownbutton>
                                                </dxe:ASPxDateEdit></td>
                                        </tr>
                                        <tr id="tr_Collateralholdingdatre">
                                            <td valign="top" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Collateral Holding Date :</td>
                                            <td colspan="5">
                                                <dxe:ASPxDateEdit ID="dthdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dthdate">
                                                    <dropdownbutton text="For">
                                        </dropdownbutton>
                                                </dxe:ASPxDateEdit></td>
                                        </tr>
                                        <tr id="tr_TradingAccount">
                                            <td valign="top" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Trading Account Balance Date :</td>
                                            <td colspan="5">
                                            <dxcp:ASPxCallbackPanel ID="Cbpdttbdate" runat="server" ClientInstanceName="cCbpdttbdate"
                                                OnCallback="Cbpdttbdate_Callback" BackColor="Transparent" Width="100%">
                                                <PanelCollection>
                                                    <dxp:panelcontent runat="server">
                                                <dxe:ASPxDateEdit ID="dttbdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dttbdate" >
                                                    <dropdownbutton text="For">
                                                    </dropdownbutton>
                                                </dxe:ASPxDateEdit>
                                                </dxp:panelcontent>
                                                </PanelCollection>
                                                <ClientSideEvents EndCallback="function (s, e) {Cbpdttbdate_EndCallBack();}" />
                                              </dxcp:ASPxCallbackPanel>
                                           </td>
                                        </tr>
                                        <tr id="tr_MarginAccount">
                                            <td valign="top" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Margin Account Balance Date :</td>
                                            <td colspan="5">
                                                <dxe:ASPxDateEdit ID="dtmcdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtmcdate">
                                                    <dropdownbutton text="For">
                                        </dropdownbutton>
                                                </dxe:ASPxDateEdit></td>
                                        </tr>
                                        <tr id="tr_iscollateral">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Is Collateral :</td>
                                            <td>
                                                <asp:DropDownList ID="DDlISCollateral" runat="server" Width="100px" Font-Size="10px">
                                                    <asp:ListItem Value="0">NO</asp:ListItem>
                                                    <asp:ListItem Value="1">YES</asp:ListItem>
                                                    
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr id="tr_evaluationmethod">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                CFS Haircut Rate :</td>
                                            <td>
                                                <asp:DropDownList ID="DDLMethod" runat="server" Width="100px" Font-Size="10px">
                                                    <asp:ListItem Value="1">20</asp:ListItem>
                                                    <asp:ListItem Value="2">25</asp:ListItem>
                                                    <asp:ListItem Value="3">30</asp:ListItem>
                                                    <asp:ListItem Value="4">40</asp:ListItem>
                                                    <asp:ListItem Value="5">50</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr id="tr_chkproduct">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Products :</td>
                                            <td colspan="5">
                                                <asp:CheckBox ID="chknrml" Checked="true" runat="server" />NRML
                                                <asp:CheckBox ID="chkmis" runat="server" />MIS
                                                <asp:CheckBox ID="chkcnc" runat="server" />CNC
                                            </td>
                                        </tr>
                                         <tr id="tr_exchangeuserid">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Exchange User Id :</td>
                                            <td colspan="5" style="height: 22px">
                                              NSE-CM 
                                                <asp:TextBox ID="txtNsecm" runat="server" MaxLength="10" Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                                              NSE-FO <asp:TextBox ID="txtNsefo" runat="server" MaxLength="10"  Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                                            </td>
                                        </tr>
                                         <tr id="tr_expirydate" valign="top">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Expiry Date :</td>
                                            <td colspan="5">
                                              <dxe:ASPxDateEdit ID="dtexpirydate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="108px" ClientInstanceName="dtexpirydate">
                                                    <dropdownbutton text="For">
                                        </dropdownbutton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                         <tr id="tr_exchangeuserinfo">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Exchange User Info :</td>
                                            <td colspan="5">
                                              <asp:TextBox ID="txtExchangeUserInfo" runat="server" MaxLength="12" Onkeypress="javascript:return isNumberKey(event);"></asp:TextBox>
                                            </td>
                                        </tr>
                                         <tr id="tr_enabledflag">
                                            <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                                Enabled Flag :</td>
                                            <td colspan="5">
                                              <asp:DropDownList ID="ddlenabledflag" runat="server" Width="40px" Font-Size="10px">
                                                    <asp:ListItem Value="Y">Y</asp:ListItem>
                                                    <asp:ListItem Value="N">N</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table width="100%" id="showFilter" border="1">
                                        <tr>
                                            <td style="text-align: right; vertical-align: top; height: 134px;">
                                                <table cellpadding="0" cellspacing="0" border="1">
                                                    <tr>
                                                        <td class="gridcellleft" style="vertical-align: top; text-align: right; height: 21px;"
                                                            id="TdFilter">
                                                            <span id="spanunder"></span><span id="spanclient">
                                                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event)"></asp:TextBox>
                                                                <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                                    Enabled="false">
                                                                    <asp:ListItem>Segment</asp:ListItem>
                                                                    <asp:ListItem>Clients</asp:ListItem>
                                                                    <asp:ListItem>Branch</asp:ListItem>
                                                                    <asp:ListItem>Group</asp:ListItem>
                                                                    <asp:ListItem>BranchGroup</asp:ListItem>
                                                                </asp:DropDownList>
                                                                <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                                        style="color: #009900; font-size: 8pt;"> </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="90px" Width="290px">
                                                            </asp:ListBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td>
                                                                        <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                                                            text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                                                            <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <div id="display" style="border: solid 1px black;">
            <table border="1">
             
                <tr id="tr_unclearban"">
                    <td >
                      1. <asp:CheckBox ID="Chkunclearban" runat="server" onclick="fnChkunclearban(this)"/>
                    </td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                        Do not Deduct Uncleared Balance of lesser than
                    </td>
                    <td>
                        <dxe:ASPxTextBox ID="txtrmslimtunclrd" runat="server" HorizontalAlign="Right" Width="20px">
                            <masksettings mask="&lt;0..9999999999g&gt;" includeliterals="DecimalSymbol" />
                            <validationsettings errordisplaymode="None"></validationsettings>
                        </dxe:ASPxTextBox></td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                        Days</td>
                    <td colspan="4">
                    </td>
                </tr>
                <tr id="tr_rmslimtaging">
                    <td >
                       2. <asp:CheckBox ID="chkrmslimtaging" runat="server" onclick="fnchkrmslimtaging(this)"/></td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                        Set Available Capital to :</td>
                    <td>
                        <dxe:ASPxTextBox ID="txtrmslimtaging1" runat="server" HorizontalAlign="Right" Width="50px">
                            <masksettings mask="<-9999999999..9999999999g>.<00..99>" />
                            <validationsettings errordisplaymode="None"></validationsettings>
                        </dxe:ASPxTextBox></td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                        For Clients Having running debit balance of amount >=</td>
                    <td>
                        <dxe:ASPxTextBox ID="txtrmslimtaging2" runat="server" HorizontalAlign="Right" Width="100px">
                            <masksettings mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                            <validationsettings errordisplaymode="None"></validationsettings>
                        </dxe:ASPxTextBox></td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                        for more than</td>
                    <td>
                        <dxe:ASPxTextBox ID="txtrmslimtaging3" runat="server" HorizontalAlign="Right" Width="20px">
                            <masksettings mask="&lt;0..9999999999g&gt;" includeliterals="DecimalSymbol" />
                            <validationsettings errordisplaymode="None"></validationsettings>
                        </dxe:ASPxTextBox></td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                        Days
                    </td>
                </tr>
                <tr id="tr_considerdpholding">
                    <td>
                        3. <asp:CheckBox ID="chkdpholdvalue" runat="server"/>
                    </td>
                    <td colspan="2" style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left" >
                        Consider Dp holding Value for Available Capital :</td>
                    <td colspan="5" >
                        <asp:RadioButton ID="rdbPOAAll" runat="server" GroupName="db" />
                        All Dp Clients
                        <asp:RadioButton ID="rdbPOASelected" runat="server" GroupName="db" Checked="True" />Only
                        POA Account Clients
                    </td>
                </tr>
                <tr id="tr_UnApprovedShares">
                      <td >
                       4. <asp:CheckBox ID="chkUnApprovedShares" runat="server" onclick="fnchkUnApprovedShares(this)"/></td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                        Haircut for Unapproved Shares</td>
                   
                    <td colspan="5" >
                      <dxe:ASPxTextBox ID="txtUnApprovedShares" runat="server" HorizontalAlign="Right" Width="100px">
                            <masksettings mask="&lt;0..199g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                            <validationsettings errordisplaymode="None"></validationsettings>
                             <ClientSideEvents LostFocus="function(s, e) {
	                            fnchktxtchk(s.GetValue())
                            }" />
                        </dxe:ASPxTextBox>
                    </td>
                </tr>
                <tr id="tr4">
                    <td >
                       5. <asp:CheckBox ID="chkPndngPurchase" runat="server"/>
                    </td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                       Do Not consider Pending Purchases
                    </td>
                    <td>
                        </td>
                    <td>
                        </td>
                    <td colspan="4">
                    </td>
                </tr>
                <tr id="tr_applyhaircut">
                    <td >
                       6. <asp:CheckBox ID="chkapplyhaircut" runat="server"/>
                    </td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                       Apply Haircut on Pendg. Purchase/Sales
                    </td>
                    <td>
                        </td>
                    <td>
                        </td>
                    <td colspan="4">
                    </td>
                </tr>
                </table>
            </div>
            <%--New Work--%>
            <div id="displayHWCQ" style="border: solid 1px black;">
            <table border="1">
                <tr id="tr_ConsPendingPurcSales">
                    <td >
                       1. <asp:CheckBox ID="chkConsPendingPurcSales" runat="server"/>
                    </td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                       Consider Pending Purchase/Sales
                    </td>
                    <td colspan="4">
                    </td>
                </tr>
                <tr id="tr_ConsHoldbackCUSA">
                    <td >
                       2. <asp:CheckBox ID="chkConsHoldbackCUSA" runat="server" Checked="true"/>
                    </td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                       Consider Holdback/CUSA Holdings
                    </td>
                    <td colspan="4">
                    </td>
                </tr>
                <tr id="tr_ConsPOADPHold">
                    <td >
                       3. <asp:CheckBox ID="chkConsPOADPHold" runat="server" Checked="true"/>
                    </td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                       Consider POA DP Holdings
                    </td>
                    <td colspan="4">
                    </td>
                </tr>
                <tr id="tr_ConsMargPledgeStk">
                    <td >
                       4. <asp:CheckBox ID="chkConsMargPledgeStk" runat="server"/>
                    </td>
                    <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                       Consider Margin/Pledge Stocks
                    </td>
                    <td colspan="4">
                    </td>
                </tr>
            </table>
            </div>
            <%--End of New Work--%>
             <table>
                <tr id="tr_show">
                    <%--New Work 04/08/2022--%>
                    <%--<td colspan="8" style="height: 22px">--%>
                    <td colspan="8" style="height: 22px; DISPLAY: none">
                    <%--End of New Work 04/08/2022--%>
                        <asp:Button ID="btn_show" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                            Width="101px" OnClick="btn_show_Click" />
                    </td>
                </tr>
                <%--New Work 04/08/2022  BackColor="White" ForeColor="Black" EnableTheming="False"--%>
                <tr id="tr_GenerateShow">
                    <td colspan="8" style="height: 22px">                        
                        <dxe:ASPxButton ID="aBtnShow" runat="server" AutoPostBack="False" ClientInstanceName="cBtnShow" CssClass="btn" Height="20px" Font-Bold="true"
                            Width="101px" Text="Generate">
                            <ClientSideEvents Click="function(s,e){GnrcCallBackPanel_Methods('GenerateShow');}" />
                            <%--<BackgroundImage ImageUrl="empty.png" />--%>
                        </dxe:ASPxButton>
                    </td>
                </tr>
                <%--End of New Work 04/08/2022--%>
                <tr id="tr_generatedisplay">
                    <td colspan="8">
                        <asp:Button ID="btndisplay" runat="server" CssClass="btnUpdate" Height="20px" Text="Show"
                            Width="101px" OnClientClick="selecttion();" OnClick="btndisplay_Click" />
                    </td>
                </tr>
            </table>
            <table id="tab3" border="1">
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
                        <asp:Button ID="btnhide" runat="server" Text="Button" OnClick="btnhide_Click" />
                    </td>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
            </table>
            <table border="1">
                <tr id="tr_sapn">
                    <td colspan="2">
                        <span id="spanshow1" style="color: Blue; font-weight: bold">RMS LIMIT For :</span>&nbsp;&nbsp;<span
                            id="spanshow2"></span>
                        <asp:Button ID="btngenerate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                            Width="101px" OnClick="btngenerate_Click" /></td>
                </tr>
                <tr id="tr_grd">
                    <td colspan="2">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="grdrmslimit" runat="server" BorderColor="CornflowerBlue" AutoGenerateColumns="false"
                                    BorderStyle="Solid" BorderWidth="2px" CellPadding="4" ForeColor="#0000C0" AllowSorting="true"
                                    OnRowDataBound="grdrmslimit_RowDataBound" OnRowCreated="grdrmslimit_RowCreated">
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                    <Columns>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblfullname" runat="server" Text='<%# Eval("fullname")%>' CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Trd A/C">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbltradeaccount" runat="server" Text='<%# Eval("tradeaccount")%>'
                                                    CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mrgn Dep.">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblmargindep" runat="server" Text='<%# Eval("margindep")%>' CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unclr Balnc.">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblunclearbal" runat="server" Text='<%# Eval("unclearbal")%>' CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mrgn Stocks">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblmarginstocks" runat="server" Text='<%# Eval("marginstocks")%>'
                                                    CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Hldb Stocks">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblholdbackstocks" runat="server" Text='<%# Eval("holdbackstocks")%>'
                                                    CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Pndg Sales/Pur">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblpndg" runat="server" Text='<%# Eval("pndg")%>' CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dp Holding">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lbldp" runat="server" Text='<%# Eval("dp")%>' CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Available Capital">
                                            <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                                            <HeaderStyle Wrap="False" HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblnet" runat="server" Text='<%# Eval("net")%>' CssClass="gridstyleheight1"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                        BorderWidth="1px"></RowStyle>
                                    <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                    <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                    <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                        Font-Bold="False"></HeaderStyle>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btndisplay" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
           
            <table><tr><td style="display:none;">
                <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
                    <asp:HiddenField ID="HiddenField_Group" runat="server" />
                    <asp:HiddenField ID="HiddenField_Branch" runat="server" />
                    <asp:HiddenField ID="HiddenField_Client" runat="server" />
                    <asp:HiddenField ID="HiddenField_Segment" runat="server" />
                    <asp:HiddenField ID="HiddenField_BranchGroup" runat="server" />
                    <asp:HiddenField ID="HiddenField_WhichTAWType" runat="server" />
                </td></tr></table>
        </div>
       <%--  <table width="50%">
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                     <div class="EHEADER" style="float: left; vertical-align: top; height: 1px; text-align: right"
                                        width="70%">
                                        <dxe:ASPxComboBox ID="ASPxComboBox1" runat="server" AutoPostBack="True" BackColor="Navy"
                                            ClientInstanceName="exp" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                            SelectedIndex="0" ValueType="System.Int32" Width="130px" meta:resourcekey="cmbExportResource1">
                                            <Items>
                                                <dxe:ListEditItem Value="0" Text="Select" meta:resourcekey="ListEditItemResource3"></dxe:ListEditItem>
                                                <dxe:ListEditItem Value="1" Text="PDF" meta:resourcekey="ListEditItemResource4"></dxe:ListEditItem>
                                                <dxe:ListEditItem Value="2" Text="XLS" meta:resourcekey="ListEditItemResource5"></dxe:ListEditItem>
                                                <dxe:ListEditItem Value="3" Text="RTF" meta:resourcekey="ListEditItemResource6"></dxe:ListEditItem>
                                                <dxe:ListEditItem Value="4" Text="CSV" meta:resourcekey="ListEditItemResource7"></dxe:ListEditItem>
                                            </Items>
                                            <ClientSideEvents SelectedIndexChanged="OncmbExportSelectedIndexChanged" />
                                            <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                                            </ButtonStyle>
                                            <ItemStyle BackColor="Navy" ForeColor="White">
                                                <HoverStyle BackColor="#8080FF" ForeColor="White">
                                                </HoverStyle>
                                            </ItemStyle>
                                            <Border BorderColor="White" />
                                            <DropDownButton Text="Export">
                                            </DropDownButton>
                                        </dxe:ASPxComboBox>
                                    </div>
                    </td>
                </tr>
                <tr>
                    <td style="height: 16px;" colspan="3" rowspan="2">
                        <dxwgv:ASPxGridView ID="DetailsGrid" runat="server" AutoGenerateColumns="False"
                            ClientInstanceName="cDetailsGrid" Font-Size="10px" KeyFieldName="ClientCode" Width="100%">
                            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True"></SettingsBehavior>
                            <Styles>
                                <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                </Header>
                                <FocusedRow HorizontalAlign="Left" VerticalAlign="Top" CssClass="gridselectrow">
                                </FocusedRow>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <Footer CssClass="gridfooter">
                                </Footer>
                            </Styles>
                            <SettingsPager Mode="ShowAllRecords" NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="ClientCode" Width="25%"
                                    Caption="Client Code">
                                    <CellStyle Wrap="False" CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="ClientName" Width="40%"
                                    Caption="Client Name" >
                                    <CellStyle Wrap="False" HorizontalAlign="Left" CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="SegmentCode" Width="10%"
                                    Caption="Segment Code" >
                                    <CellStyle Wrap="False" HorizontalAlign="Right" CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="SegmentName" Width="10%" 
                                Caption="Segment Name">
                                    <CellStyle Wrap="False" HorizontalAlign="left" CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn  FieldName="NonCashDeposit" Caption="Non CashDep." >
                                <CellStyle Wrap="False" HorizontalAlign="Right" CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="MTMLedger" Caption="MTM Ledger" >
                                <CellStyle Wrap="False" HorizontalAlign="Right" CssClass="gridcellleft">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewCommandColumn VisibleIndex="4" Width="15%">
                                   
                                    <CellStyle ForeColor="White">
                                        <HoverStyle BackColor="#000040">
                                        </HoverStyle>
                                    </CellStyle>
                                  
                                </dxwgv:GridViewCommandColumn>
                            </Columns>
                          
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
         <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                </dxwgv:ASPxGridViewExporter>--%>
                
         <%--New Work 04/08/2022--%>
        <div id="divLoading">
            <dxcp:ASPxCallbackPanel ID="GnrcCallBackPanel" runat="server" ClientInstanceName="cGnrcCallBackPanel"
                BackColor="White" OnCallback="GnrcCallBackPanel_Callback" LoadingPanelText="Generating File...Please Wait..." LoadingPanelStyle-Font-Size="Medium">
                <PanelCollection>
                    <dxp:panelcontent>
                    </dxp:panelcontent>
                </PanelCollection>
                <ClientSideEvents EndCallback="function(s, e) {
                                                            GnrcCallBackPanel_EndCallBack(); }" />
            </dxcp:ASPxCallbackPanel>
        </div>
        <div style="display: none">
            <asp:Button ID="btnGenerateShow" runat="server" BackColor="#DDECFE" BorderStyle="None"
                OnClick="btn_show_Click" />
        </div>
        <%--End of New Work 04/08/2022--%>
    </form>
</body>
</html>
