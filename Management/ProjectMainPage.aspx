<%@ page language="C#" autoeventwireup="true" inherits="management_ProjectMainPage, App_Web_psdiigfa" %>
    
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Welcome to FitOffice</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.min.js"></script>
    
    <%--New Work 04/09/2022--%>
    <style type="text/css">
        #RecentMenuGrid tr.rowHover:hover
    {
        background-color:#A1DCF2;
    }
    </style>
    <%--End of New Work 04/09/2022--%>
    
    <script type="text/javascript" language="javascript">
        //Global Var
        ActiveCurrencyIdentifier;
        
        function ConfirmLeave() {
        return confirm("Do you really want to close?"); 
        }
        var prevKey="";
        $(document).keydown(function (e) {            
            if (e.key=="F5") {
                window.onbeforeunload = ConfirmLeave;
            }
            else if (e.key.toUpperCase() == "W" && prevKey == "CONTROL") {                
                window.onbeforeunload = ConfirmLeave;   
            }
            else if (e.key.toUpperCase() == "R" && prevKey == "CONTROL") {
                window.onbeforeunload = ConfirmLeave;
            }
            else if (e.key.toUpperCase() == "F4" && (prevKey == "ALT" || prevKey == "CONTROL")) {
                window.onbeforeunload = ConfirmLeave;
            }
            prevKey = e.key.toUpperCase();
        });
        
        window.history.forward();  
         function noBack() { window.history.forward(); } 
        
        function SignOff()
        {
            window.parent.SignOff();
        }
         function onpageload()
        {
            document.getElementById("TrAddFav").style.display='none';
            document.getElementById("showheader").style.display='none';
//            New Work 04/09/2022
            document.getElementById("SRecentMenu").style.display='inline';
            document.getElementById("HRecentMenu").style.display='none';
            document.getElementById("TrRecentMenuGrid").style.display='none';
//            End of New Work 04/09/2022
            
            ///To Set Currency Feature
            ActiveCurrency=document.getElementById("hdn_ActiveCurrency").value;
            ActiveCurrencyIdentifier="Local";
            CurrencySetting();
            
        }
        function CurrencySetting()
        {
            if (ActiveCurrency != '')
            {
                //Insert Local Currency Detail
                 var LocalCurrencyValue=ActiveCurrency;
                 var LocalCurrency_ID=LocalCurrencyValue.split('~')[0];
                 var LocalCurrency_ShortName=LocalCurrencyValue.split('~')[1];
                 var LocalCurrency_Symbol=LocalCurrencyValue.split('~')[2];
                 clblCurrencyNameSymbol.SetText(LocalCurrency_ShortName+'['+LocalCurrency_Symbol+']');
            }
        }
        function ShowHideCurrencyChangeImage(obj)
        {
            var CurrencyText=document.getElementById("Cbp_Currency_AChangeCurrency").innerHTML;
            if(ActiveCurrencyIdentifier=="Local")
            {
                cCbp_Currency.PerformCallback('ChangeToLocalCurrency~');
            }
            else 
            {
                cCbp_Currency.PerformCallback('ChangeToTradeCurrency~');
            }
        }
        function Cbp_Currency_EndCallBack()
        {
            if(cCbp_Currency.cpCurrencyChanged!=null)
            {
                var WhichCall=cCbp_Currency.cpCurrencyChanged.split('~')[0];
                var AddCurrency=cCbp_Currency.cpCurrencyChanged.split('~')[1];
                if(WhichCall=="Local")
                {
                    document.getElementById("Cbp_Currency_AChangeCurrency").innerHTML="Switch To "+AddCurrency;
                    ActiveCurrencyIdentifier="Local";
                }
                if(WhichCall=="Trade")
                { 
                   document.getElementById("Cbp_Currency_AChangeCurrency").innerHTML="Switch To "+AddCurrency;
                   ActiveCurrencyIdentifier="Trade";
                }
            }
        }
        function menuCall(obj)
        {
            document.getElementById('HiddenField1').value=obj;
            document.getElementById('btnActivity').click();
//            New Work 04/09/2022
            document.getElementById("SRecentMenu").style.display='inline';
            document.getElementById("HRecentMenu").style.display='none';
            document.getElementById("TrRecentMenuGrid").style.display='none';
//            End of New Work 04/09/2022
            //IFRAME_ForAllPages.location=obj;
        }
        function CallMenuPage(obj)
        {
            IFRAME_ForAllPages.location=obj;
        }
        function SignOff()
        {
            window.location="../SignOff.aspx";
        }
        function AddFavourite()
        {
            document.getElementById('BtnFavourite').click();
        }
//        New Work 04/09/2022
        function ShowHideMenuButton()
        {
            document.getElementById("SRecentMenu").style.display='none';
            document.getElementById("HRecentMenu").style.display='inline';
            document.getElementById("TrRecentMenuGrid").style.display='inline';
        }
        function ShowMenuButton()
        {
            document.getElementById("SRecentMenu").style.display='inline';
            document.getElementById("HRecentMenu").style.display='none';
            document.getElementById("TrRecentMenuGrid").style.display='none';
        }
        function ShowRecentMenu()
        {
            document.getElementById("SRecentMenu").style.display='none';
            document.getElementById("HRecentMenu").style.display='inline';
            document.getElementById('BtnSRecentMenu').click();
        }
        function HideRecentMenu()
        {
            document.getElementById("SRecentMenu").style.display='inline';
            document.getElementById("HRecentMenu").style.display='none';
            document.getElementById("TrRecentMenuGrid").style.display='none';
        }
        function ShowMenuClick(obj)
        {
            document.getElementById("SRecentMenu").style.display='inline';
            document.getElementById("HRecentMenu").style.display='none';
            document.getElementById("TrRecentMenuGrid").style.display='none';
            IFRAME_ForAllPages.location=obj;
        }
//        End of New Work 04/09/2022
        function OnSegmentChange(keyValue) 
        {
             var url='frm_selectCompFinYrSett.aspx?id='+keyValue;
//             alert(url);
             editwinS=dhtmlmodal.open("Editbox", "iframe", url, "Segment Details", "width=415px,height=255px,center=1,resize=0,scrolling=2,top=500", "recal")
             editwinS.onclose=function()
             {
                 window.location='../management/ProjectMainPage.aspx';
             }
        }
        
        function showpage(obj)
        {
            OnSegmentChange(obj);
        }
        function CallPage(URL)
        {
            if(URL=='')
                alert('Please Select Any SubMenu');
            else if (URL=='../management/frmwip.aspx')
                alert('Still Working On Page.Sry for Inconvenience');
            else
            {   
                if(URL=='../management/frm_homePage.aspx')
                   document.getElementById("TrAddFav").style.display='none';
                else
                    document.getElementById("TrAddFav").style.display='inline'; 
                menuCall(URL);
            }
        }
        function OnMoreInfoClick(url,HeaderText,Width,Height,anyKey) //AnyKey will help to call back event to child page, if u have to fire more that one function 
        {
             editwin=dhtmlmodal.open("Editbox", "iframe", url,HeaderText , "width="+Width+",height="+Height+",center=1,resize=1,scrolling=2,top=500", "recal")
             editwin.onclose=function()
             {
                 if(anyKey=='Y')
                 {
                    document.getElementById('IFRAME_ForAllPages').contentWindow.callback();
                 }
             }
        }
        function ShowHideHeader(obj)
        {
            if(obj=='h')
            {
                document.getElementById("header").style.display='none';
                document.getElementById("showheader").style.display='inline';
                document.getElementById("hideheader").style.display='none';
            }
            if(obj=='s')
            {
                document.getElementById("header").style.display='inline';
                document.getElementById("hideheader").style.display='inline';
                document.getElementById("showheader").style.display='none';
            }
        }
        function CallMessage()
        {
            Iframe1.location='../management/frmnewmessage.aspx';
        }       
        function MarketTracker(ProductName,ExchangeID,TickerCode)
        {
            var URL;
            URL='../management/MarketTracker.aspx?PName='+ProductName+'&ExchID='+ExchangeID+'&TCode='+TickerCode  
            editwin=dhtmlmodal.open("Editbox", "iframe", URL,"Product Name : - "+ProductName+"" , "width=1000px,height=500px,center=1,resize=1,scrolling=2,top=500", "recal")         
        }
        
        function ForCloseButtonClick()
        {
//            if(window.closed)
//            {
//                document.getElementById('btnBrowserClose').click();
//            }
        }
        function PicChange(obj)
        {
            var URL;
            URL='../management/ShowPicture.aspx?id='+obj;
            editwin=dhtmlmodal.open("Editbox", "iframe", URL,"Change Picture" , "width=480px,height=300px,center=1,resize=1,scrolling=2,top=500", "recal")                     
        }
        
    function refreshiframe()
    {
    
        parent.Iframe1.location.href="../management/frmnewmessage.aspx"
        ////setTimeout("refreshiframe()",3000000);
    } 
    </script>

    <%--Start Expiry Related--%>

    <script type="text/javascript" language="javascript">
    function string_contains(containerString, matchBySubString)
    {
        if(containerString.indexOf(matchBySubString) == -1)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
    function fn_ExpiryOverlay(expiryMessage) 
    {
        if(string_contains(expiryMessage,'Corrupted'))
        {
            el = document.getElementById("Expiry_Overlay");
            document.getElementById('pExpiryMsg').innerHTML=expiryMessage;
            el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
            el1=document.getElementById("btnExpiry_Continue");
            el1.style.visibility = (el.style.visibility == "hidden") ? "visible" : "hidden";                               
        }
        else if(string_contains(expiryMessage,'Invalid'))
        {
            el = document.getElementById("Expiry_Overlay");
            document.getElementById('pExpiryMsg').innerHTML=expiryMessage+" Please Contact Your Administrator.";
            el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
            el1=document.getElementById("btnExpiry_Continue");
            el1.style.visibility = (el.style.visibility == "hidden") ? "visible" : "hidden";                        
        }
        else
        {            
            el = document.getElementById("Expiry_Overlay");
            document.getElementById('pExpiryMsg').innerHTML=expiryMessage;
            el.style.visibility = (el.style.visibility == "visible") ? "hidden" : "visible";
            
            el1=document.getElementById("btnExpiry_SignOff");
            el1.style.visibility = (el1.style.visibility == "hidden") ? "visible" : "hidden";
        }        
    }  
    function btnAfterExpiry(obj)
    {
        if(obj=='SignOff')
            SignOff();
        else
        {
            el = document.getElementById("Expiry_Overlay");
            el.style.visibility="hidden"; 
        }       
    }
    function OpenURLByBrowser(browser,link)
    {
       var shell = new ActiveXObject("WScript.Shell");           
       if(browser=="Chrome")
       {
           shell.run(browser+" "+link);
       }
   }


   //    --------------------- Multi Currency -----------------

   function GetMultiCurrencyPage(keyValue) {


       var url = 'Frm_SelectMultiCurrency.aspx?id=' + keyValue;

       editwinS = dhtmlmodal.open("Editbox", "iframe", url, " Currency", "width=415px,height=255px,center=1,resize=0,scrolling=2,top=500", "recal")
       editwinS.onclose = function() {
           window.location = '../management/ProjectMainPage.aspx';
       }
   }


   //-------------------------------------------------------
    
    
    
    </script>

    <style type="text/css">
        #Expiry_Overlay {visibility: hidden;position: absolute;left: 0px;top: 0px;width:100%;height:100%;text-align:center;
        z-index: 1000;background-image: url('../CentralData/Images/Transbg_ExpiryMsg.png');opacity: 0.9; filter: alpha(opacity=90);}
        #Expiry_Overlay div {width:500px;background-color: #eee;border:5px solid #fff; font-size:12px;
                             margin-top:160px;padding:15px;text-align:center; color:maroon;font-family:Arial;}
        #Expiry_Overlay a{padding: 5px; color: #222;background-color: #ccc; border: 2px solid #ccc;font-size:14px;
                          font-weight:bold; border-right: 2px solid #aaa;border-bottom: 2px solid #aaa; text-decoration:none;}
    </style>
    <%--End Expiry Related--%>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage();noBack();refreshiframe();"
    onpageshow="if (event.persisted) noBack();" onunload="" onbeforeunload="ForCloseButtonClick();">

    <script type="text/javascript">

$(document).ready(function(){
	
  //hide toolbar and make visible the 'show' button
	$("span.downarr a").click(function() {
    $("#toolbar").slideToggle("fast");
    $("#toolbarbut").fadeIn("slow");    
  });
  
  //show toolbar and hide the 'show' button
  $("span.showbar a").click(function() {
    $("#toolbar").slideToggle("fast");
    $("#toolbarbut").fadeOut();    
  });
  
  //show tooltip when the mouse is moved over a list element 
  $("ul#social li").hover(function() {
		$(this).find("div").fadeIn("fast").show(); //add 'show()'' for IE
    $(this).mouseleave(function () { //hide tooltip when the mouse moves off of the element
        $(this).find("div").hide();
    });
  });
  
  //don't jump to #id link anchor 
  $(".toplink, .menutit, span.downarr a, span.showbar a").click(function() {
   return false;                                         
	});
	
  //show quick menu on click 
	$("span.menu_title a").click(function() {
		if($(".quickmenu").is(':hidden')){ //if quick menu isn't visible 
			$(".quickmenu").fadeIn("fast"); //show menu on click
		}
		else if ($(".quickmenu").is(':visible')) { //if quick menu is visible 
      $(".quickmenu").fadeOut("fast"); //hide menu on click
    }
	});
	
	//hide menu on casual click on the page
	$(document).click(function() {
			$(".quickmenu").fadeOut("fast");
			$(".quickmenu").css({'vivibility': 'hidden'});
	});
	$('.quickmenu').click(function(event) { 
		event.stopPropagation(); //use .stopPropagation() method to avoid the closing of quick menu panel clicking on its elements 
	});

		
});
	
    </script>

    <form id="form1" runat="server" style="background-color: Transparent;">
        <div id="Expiry_Overlay">
            <div>
                <p id="pExpiryMsg">
                </p>
                <br />
                <br />
                <a href="#" id="btnExpiry_SignOff" onclick="javascript:btnAfterExpiry('SignOff');"
                    title="Ok">OK</a> <a href="#" id="btnExpiry_Continue" onclick="javascript:btnAfterExpiry('Continue');"
                        title="Click To Continue">Continue...</a>
            </div>
        </div>
        <table class="TableMain100" style="background-color: #DDECFE;" cellpadding="0px"
            cellspacing="0px">
            <tr id="header">
                <td>
                    <table style="width: 100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="vertical-align: top;">
                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                    <tr style="background-color: white">
                                        <td colspan="2" style="height: 50px; padding-bottom: 5; padding-left: 5; padding-bottom: 5;
                                            padding-right: 5; padding-top: 5;">
                                            <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td style="width: 15%; background-color: #FFFFFF;" valign="top">
                                                        <img src="../images/logo.jpg" width="261" height="61" alt="A" />
                                                    </td>
                                                    <td style="vertical-align: top; width: 30%;" valign="top">
                                                        <table cellpadding="0" cellspacing="0" width="98%">
                                                            <tr>
                                                                <td style="text-align: left">
                                                                    <%--  <iframe id="Iframe1" src="../management/frmnewmessage.aspx" width="40" height="30"
                                                                        frameborder="0" scrolling="no" style="width: 60px; height: 57px"></iframe>--%>
                                                                    <%--  <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                                                        <ContentTemplate>--%>
                                                                    <iframe id="Iframe1" src="../management/frmnewmessage.aspx" width="40" height="30"
                                                                        frameborder="0" scrolling="no" style="width: 60px; height: 57px"></iframe>
                                                                    <%-- <asp:Timer  ID="Timer1" Interval="100"></asp:Timer>     
                                                                        </ContentTemplate>                                                                        
                                                                        </asp:UpdatePanel>  --%>
                                                                </td>
                                                                <td style="padding: 5px 5px 5px 5px">
                                                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                                    </asp:ScriptManager>
                                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                                        <ContentTemplate>
                                                                            <div style="border: solid 1px #F8B187;">
                                                                                <table id="tblSegment" runat="server" style="width: 400px">
                                                                                    <tr>
                                                                                        <td style="width: 75%">
                                                                                            <table cellpadding="0" cellspacing="0">
                                                                                                <tr>
                                                                                                    <td class="gridcelleft" style="text-align: left" colspan="2">
                                                                                                        <asp:Label ID="lblSCompName" runat="server" Font-Size="10px" ForeColor="Navy" Font-Bold="True"></asp:Label>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="gridcelleft" style="text-align: left" colspan="2">
                                                                                                        <table cellspacing="0" cellpadding="0" style="border: solid 0px blue;">
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Label ID="lblSettNo" runat="server" Font-Size="10px" ForeColor="Navy" Font-Bold="True"></asp:Label>&nbsp;
                                                                                                                </td>
                                                                                                                <td id="SettBtnPart" runat="server">
                                                                                                                    <table cellspacing="0" cellpadding="0" style="border: solid 0px blue;">
                                                                                                                        <tr>
                                                                                                                            <td>
                                                                                                                                <asp:ImageButton ID="btnSettUP" runat="server" ImageUrl="~/images/sup.JPG" OnClick="btnSettUP_Click"
                                                                                                                                    ToolTip="Next settlement number" />
                                                                                                                            </td>
                                                                                                                            <td rowspan="2" style="vertical-align: middle; text-align: left; width: 9px;">
                                                                                                                                <asp:ImageButton ID="btnsetNext" runat="server" ImageUrl="~/images/snext1.JPG" ToolTip="Next settlement Type"
                                                                                                                                    OnClick="btnsetNext_Click" />
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                        <tr>
                                                                                                                            <td style="vertical-align: top">
                                                                                                                                <a></a>
                                                                                                                                <asp:ImageButton ID="btnSettDown" runat="server" ImageUrl="~/images/Sdown.JPG" OnClick="btnSettDown_Click"
                                                                                                                                    ToolTip="Previous settlement number" />
                                                                                                                            </td>
                                                                                                                        </tr>
                                                                                                                    </table>
                                                                                                                </td>
                                                                                                                <td>
                                                                                                                    <span style="color: #ff9966">|</span>
                                                                                                                    <asp:Label ID="lblFinYear" runat="server" Font-Size="10px" ForeColor="Navy" Font-Bold="True"></asp:Label>
                                                                                                                    &nbsp;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="gridcelleft" style="text-align: left;">
                                                                                                        <asp:Label ID="lblStartDate" runat="server" Font-Size="10px" ForeColor="Navy" Font-Bold="True"></asp:Label>
                                                                                                        <span style="color: #ff9966">|</span>
                                                                                                        <asp:Label ID="lblfundPayeeDate" runat="server" Font-Size="10px" ForeColor="Navy"
                                                                                                            Font-Bold="True"></asp:Label>
                                                                                                    </td>
                                                                                                    <td>
                                                                                                        &nbsp;</td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="gridcelleft" style="text-align: left">
                                                                                                        <a href="#" id="lnkSelectCompanySettFinYear" class="Headlink" runat="server"><strong>
                                                                                                            <span style="font-size: x-small; color: Blue; text-decoration: underline"><em>Change
                                                                                                                Company/FinYear/Settlement</em></span></strong></a></td>
                                                                                                    <td>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td id="TdCurrency" style="width: 25%; border-left: #f8b187 thin solid; text-align: center;">
                                                                                            <a href="http://www.freedigitalphotos.net" target="_blank" title="freedigitalphotos">
                                                                                                <asp:Image ID="Image1" runat="server" Height="50px" ImageUrl="~/images/CurrencyImage1.jpg"
                                                                                                    Width="130px" /></a>
                                                                                            <dxcp:ASPxCallbackPanel ID="Cbp_Currency" runat="server" ClientInstanceName="cCbp_Currency"
                                                                                                OnCallback="Cbp_Currency_Callback">
                                                                                                <PanelCollection>
                                                                                                    <dxp:panelcontent runat="server">
                                                                                                        <dxe:ASPxLabel ID="lblCurrencyNameSymbol" Font-Size="Large" ForeColor="Goldenrod"
                                                                                                            ClientInstanceName="clblCurrencyNameSymbol" runat="server" Font-Bold="True" />
                                                                                                        <a href="#" onclick="ShowHideCurrencyChangeImage()" id="AChangeCurrency" class="Headlink"
                                                                                                            runat="server" style="font-size: smaller; color: Blue; font-style: italic; font-weight: bold;
                                                                                                            text-decoration: underline"></a>
                                                                                                            
                                                                                                            
                                                                                                            <%------------- For Multi Currency ------------------%>
                                                                                                            
                                                                                                             <a href="#"  id="AMultiCurrency" class="Headlink"
                                                                                                            runat="server" style="font-size: smaller; color: Blue; font-style: italic; font-weight: bold;
                                                                                                            text-decoration: underline"></a>
                                                                                                            
                                                                                                            
                                                                                                            <%---------------------------------------------------------%>
                                                                                                            
                                                                                                            
                                                                                                            
                                                                                                    </dxp:panelcontent>
                                                                                                </PanelCollection>
                                                                                                <ClientSideEvents EndCallback="function(s, e) {Cbp_Currency_EndCallBack();}" />
                                                                                            </dxcp:ASPxCallbackPanel>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </div>
                                                                        </ContentTemplate>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td style="text-align: right; vertical-align: top; width: 35%;" valign="top">
                                                        <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td class="coheadtxt" style="text-align: right;">
                                                                    &nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td style="text-align: left; width: 40%; vertical-align: top" align="center">
                                                                                <table style="width: 100%">
                                                                                    <tr>
                                                                                        <td class="mt" style="width: 10%; height: 18px; text-align: right;">
                                                                                            <!-- Time dispaly file will be here -->
                                                                                            <asp:DropDownList ID="cmbSegment" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cmbSegment_SelectedIndexChanged"
                                                                                                Width="100px" BackColor="SandyBrown" Font-Bold="False">
                                                                                            </asp:DropDownList>
                                                                                        </td>
                                                                                        <td style="width: 3%; height: 18px; text-align: right;" id="td1" class="mt">
                                                                                            <a href="#" id="link1" class="Headlink">Settings</a>
                                                                                        </td>
                                                                                        <td style="width: 3%; height: 18px; text-align: left; padding-left: 7px" id="td2"
                                                                                            class="mt">
                                                                                            <a href="javascript:SignOff();" id="link2" class="Headlink">Sign off</a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:Label ID="Label2" runat="server" Text="Welcome, " ForeColor="Navy"></asp:Label><asp:Label
                                                                                    ID="lblName" runat="server" ForeColor="Navy"></asp:Label>
                                                                                <a href="#" class="WhiteLink">
                                                                                    <asp:Label ID="Label1" runat="server" Text="| Last Logged On: " ForeColor="Navy"></asp:Label>
                                                                                    <asp:Label ID="lblLastTime" runat="server" ForeColor="Navy"></asp:Label>
                                                                                </a>
                                                                            </td>
                                                                        </tr>
                                                                        <%--New Work 04/09/2022--%>
                                                                        <tr id="TrRecentMenu">
                                                                            <td id="TdShowHideRecentMenu" style="width: 3%; height: 18px; text-align: left;" class="mt">
                                                                                <a href="javascript:ShowRecentMenu();" id="SRecentMenu" title="Click to Show Recent Used Menu List" class="Headlink" style="color: Blue; font-weight:bold;">
                                                                                    Show Recent Places</a>
                                                                                    
                                                                                <a href="javascript:HideRecentMenu();" id="HRecentMenu" title="Click to Hide Recent Used Menu List" class="Headlink" style="color: Red; font-weight:bold;">
                                                                                    Hide Recent Places</a>
                                                                            </td>
                                                                        </tr>
                                                                        <%--End of New Work 04/09/2022--%>
                                                                        <tr id="TrAddFav">
                                                                            <td>
                                                                                <a href="javascript:AddFavourite();" id="HFavourite" class="Headlink" style="color: Red;">
                                                                                    Add To Favourite</a>
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
                        <tr>
                            <td>
                                <iframe id="iFrmReminder" style="vertical-align: top;" src="../management/frmShowReminder.aspx"
                                    width="100%" height="20" marginheight="0" marginwidth="0" frameborder="0" scrolling="no">
                                </iframe>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table class="width100per" cellpadding="0" cellspacing="0" style="width: 100%">
                                    <tr style="width: 100%; background-image: url(../images/menu_strip_bg.jpg); background-repeat: repeat-x;">
                                        <td style="width: 100%;">
                                            <asp:Menu ID="Menumain" runat="server" Orientation="Horizontal" StaticEnableDefaultPopOutImage="true"
                                                StaticTopSeparatorImageUrl="../images/menu_strip_bg1.JPG">
                                                <StaticMenuStyle VerticalPadding="2px" HorizontalPadding="1px" />
                                                <StaticMenuItemStyle HorizontalPadding="2px" ItemSpacing="2px" VerticalPadding="1px"
                                                    Width="80px" />
                                                <DynamicHoverStyle BackColor="#FFE0C0" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                <StaticHoverStyle BackColor="#FFE0C0" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                                <DynamicMenuStyle HorizontalPadding="0px" VerticalPadding="0px" BorderColor="Black"
                                                    BorderStyle="Solid" BorderWidth="1px" />
                                                <DynamicMenuItemStyle Width="200px" VerticalPadding="0px" CssClass="SubMenu" />
                                            </asp:Menu>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="text-align: center; padding: 0px 0px 0px 0px;">
                    <table cellpadding="0px" cellspacing="0px" class="TableMain100">
                        <tr>
                            <td id="showheader" style="vertical-align: top; cursor: pointer;" class="gridcellcenter"
                                onclick="ShowHideHeader('s')">
                                <img src="../images/arrow_down.gif" alt="Show Header" onclick="ShowHideHeader('s')"
                                    style="cursor: pointer" />
                            </td>
                            <td id="hideheader" style="vertical-align: top; cursor: pointer;" class="gridcellcenter"
                                onclick="ShowHideHeader('h')">
                                <img src="../images/arrow_up.gif" alt="Hide Header" onclick="ShowHideHeader('h')"
                                    style="cursor: pointer" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <%--New Work 04/09/2022--%>
            <tr id="TrRecentMenuGrid">
                <td>
                    <asp:GridView ID="RecentMenuGrid" runat="server" Width="30%" BorderColor="CornflowerBlue" DataKeyNames="MenuLink" GridLines="None" RowStyle-CssClass="rowHover"
                        ShowFooter="False" AutoGenerateColumns="false" AllowPaging="true" BorderStyle="None" CssClass="rowHover"
                        AllowSorting="true" BorderWidth="2px" CellPadding="4" ForeColor="#0000C0" PageSize="20000">
                        <Columns>
                            <asp:TemplateField HeaderText="My Recent Places" HeaderStyle-Font-Bold="true">
                                <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="left" ForeColor="Blue" BorderStyle="none"></ItemStyle>
                                <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="true" ForeColor="Maroon" Font-Italic="true" Font-Size="Large" Font-Underline="true"></HeaderStyle>
                                <ItemTemplate>
                                    <a title="Click here for go to Menu" id="MColumn" href="javascript:void(0);" onclick="ShowMenuClick('<%# Eval("MenuLink") %>')" 
                                    style="color:Blue; font-style:italic; text-align:center; font-size:medium; border-style:none;">
                                         <%#Eval("MenuName")%></a>
                                </ItemTemplate>
                            </asp:TemplateField>                                        
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <%--End of New Work 04/09/2022--%>
            <tr>
                <td>
                    <iframe id="IFRAME_ForAllPages" scrolling="no" src="" name="IFRAME_ForAllPages" frameborder="0"
                        width="100%"></iframe>
                </td>
            </tr>
            <tr>
                <td align="center" class="footertab" style="vertical-align: top; background-color: #DDECFE">
                    <table class="TableMain100" cellpadding="0" cellspacing="0" style="background-color: Transparent;">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="5" style="background-image: url(../images/footerbg.jpg);
                                    height: 60px">
                                    <tr>
                                        <td colspan="3" style="height: 32px">
                                            <div class="left">
                                                <%--New Work 08/09/2022--%>
                                                <%--<img src="../CentralData/Images/logo_Influx.png" width="114px" height="30px" alt=""
                                                    style="border: none; cursor:pointer;" onclick="javascript:OpenURLByBrowser('Chrome','http://www.influxerp.com');" />--%>
                                                    <img src="../CentralData/Images/color_logo.png" width="200px" height="65px" alt=""
                                                    style="border: none; cursor:pointer;" onclick="javascript:OpenURLByBrowser('Chrome','http://www.influxerp.com');" />
                                                <%--End of New Work 08/09/2022--%>
                                                <%--<asp:Label ID="lblSoft" runat="server" Text=""></asp:Label>--%>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div align="center">
                                                <asp:Label ID="lblComp" runat="server" Text=""></asp:Label></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="tdCopyRight" runat="Server" style="text-align: left" width="40%">
                                            Copyright &copy; 2009 Influx Technologies</td>
                                        <td id="tdPowerBy" runat="Server" style="text-align: center" width="20%">
                                            Powered By INFLUX
                                        </td>
                                        <td id="tdTechnialBy" runat="Server" style="text-align: right" width="40%">
                                            Technicals by : <a href="http://www.influxerp.com" target="_blank">Influx Technologies</a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="display: none">
                    <asp:Button ID="btnBrowserClose" runat="server" Text="Button" OnClick="btnBrowserClose_Click" />
                </td>
            </tr>
            <%--New Work 04/09/2022--%>
            <tr>
                <td style="display: none">
                    <asp:Button ID="BtnSRecentMenu" runat="server" Text="Show Recent Used Menu" OnClick="BtnSRecentMenu_Click" />
                    <%--<asp:Button ID="BtnHRecentMenu" runat="server" Text="Hide Recent Used Menu" OnClick="BtnHRecentMenu_Click" />--%>
                </td>
            </tr>
            <%--End of New Work 04/09/2022--%>
            <tr>
                <td style="display: none">
                    <asp:Button ID="btnActivity" runat="server" Text="Activity" OnClick="btnActivity_Click" />
                    <asp:Button ID="BtnFavourite" runat="server" Text="Favourite" OnClick="BtnFavourite_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnActivity" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="BtnFavourite" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    <div id="toolbarbut">
                        <!-- hide button -->
                        <span class="showbar"><a href="#">Show Fav</a></span>
                    </div>
                    <div id="toolbar" runat="server">
                        <!-- toolbar container -->
                        <div class="leftside" id="MainToolBarLink" runat="server">
                            <!-- all things in floating left side -->
                        </div>
                        <div class="rightside">
                            <!-- all things in floating left side -->
                            <span class="downarr">
                                <!-- hide button -->
                                <a href="#"></a></span><span class="menu_title" id="SubToolBarLinkMain" runat="server">
                                    <a class="menutit" href="#">quick menu</a>
                                    <!-- quick menu title -->
                                </span>
                            <div class="quickmenu" id="SubToolBarLink" runat="server">
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <!-- For Currency Setting -->
        <asp:HiddenField ID="hdn_ActiveCurrency" runat="server" />
    </form>
</body>
</html>
