<%@ page language="C#" autoeventwireup="true" inherits="pLogin, App_Web_ohx3t64c" enableeventvalidation="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%--New Work--%>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxTabControl"
    TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export" Namespace="DevExpress.Web.ASPxGridView.Export"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%--End of New Work--%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login to FitOffice</title>
    <link type="text/css" href="CSS/style.css" rel="Stylesheet" />
    
    <style type="text/css">
        #UpdateProgress1 {
           background-color:#CF4342;
           color:#fff;
           top:0px;
           right:0px;
           position:fixed;
         }
         
         .lblalert {
           position: absolute;
            top: 30px;
            height:27px;            
            color:black;
            text-align:center;
            display: inline;
        }

        #UpdateProgress1 img {
           vertical-align:middle;
           margin:2px;
         }
         .modalBackground
           {
	           background-color: Gray;
	           filter: alpha(opacity=70);
	           opacity: 0.7;
           }
            .modalPopup
           {
	           background-color: #ffffdd;
	           border-width: 3px;
	           border-style: solid;
	           border-color: Gray;
	           padding: 3px;	   
           }
            .over {
                color:black; 
                background: #FF9900; 
                font: bold small 'trebuchet ms',helvetica,sans-serif;
                border:1px solid;   
                border-color: #696 #363 #363 #696;  
                 }
            .out {
                color:black; 
                background: #C8DBEA; 
                font: bold small 'trebuchet ms',helvetica,sans-serif;
                border:1px solid;   
                border-color: #696 #363 #363 #696;  
                 }
        </style>
     
    <script language="javascript" type="text/javascript">
        window.history.forward();  
         function noBack() { window.history.forward(); } 
//        function ResetFun() 
//        {
//             var url='Reset.aspx';
//             //alert(url);
//             editwin=dhtmlmodal.open("Editbox", "iframe", url, "Reset LogIN", "width=350px,height=200px,center=1,resize=0,scrolling=2,top=500", "recal")
//             editwin.onclose=function()
//             {
//                 //window.location='Login.aspx';
//             }
//        }
        //New Work
        function Showpopup()
        {
            cVerification.Show();
            ctxtPANNo.Focus();
        }
                 
        function VerificationPAN()
        {
        var PANNo = ctxtPANNo.GetValue();
        cCallbackPanel.PerformCallback(PANNo);
        }

        function CallbackPanelEndCall(s, e) 
        {
            if(cCallbackPanel.cpMessage=="Y")
            {
            alert("Invalid PAN!!!");
            ctxtPANNo.Focus();
            ctxtPANNo.SetValue('');
            }
        }
        
        function CancelVerificationPAN()
        {
            cVerification.Hide();
        }
        //End of New Work
        function ForNextPage()
        {
            //window.open('management/ProjectMainPage.aspx','windowname1','fullscreen=yes,titlebar=no,toolbar=no,statusbar=no'); 
        }
          function capLock(e)
        {
        
        kc = e.keyCode?e.keyCode:e.which;
        sk = e.shiftKey?e.shiftKey:((kc == 16)?true:false);
        if(((kc >= 65 && kc <= 90) && !sk)||((kc >= 97 && kc <= 122) && sk))
          document.getElementById('divMayus').style.visibility = 'visible';
        else
          document.getElementById('divMayus').style.visibility = 'hidden';
        }
        
        function blinkIt() 
        {
            if (!document.all) return;
            else 
            {
              for(i=0;i<document.all.tags('blink').length;i++)
              {
                s=document.all.tags('blink')[i];
                s.style.visibility=(s.style.visibility=='visible') ?'hidden':'visible';
              }
            }
        }
    </script>
</head>
<body onload="noBack();setInterval('blinkIt()',500);" onpageshow="if (event.persisted) noBack();" onunload="">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptMgr" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <table>
            <tr>
                <td colspan="6">
                    <table class="width100per" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="vertical-align: bottom">
                                <table class="width100per" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="50%" class="headtxt">
                                            &nbsp;</td>
                                        <td width="50%" class="timeclass">
                                        </td>
                                    </tr>
                                    <tr style="background-image: url(images/topheadbg.jpg); background-repeat: repeat-x;
                                        padding-top: 5">
                                        <td colspan="2" style="padding-bottom: 5; padding-left: 5; padding-bottom: 5; padding-right: 5;
                                            padding-top: 5; vertical-align: bottom">
                                            <table class="width100per" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td style="width: 10px">
                                                        &nbsp;</td>
                                                    <td style="width: 150px; background-color: #FFFFFF; border-top: solid 1px #4B6CA1;
                                                        border-bottom: solid 1px #4b6ca1;">
                                                        <img src="images/logo.jpg" width="261" height="61" alt="A" />
                                                        <%--<img src="images/logo.jpg" width="255" height="50" />--%>
                                                    </td>
                                                    <td style="vertical-align: bottom; padding-top: 10px">
                                                        <table class="width100per" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td class="coheadtxt">
                                                                    <asp:Label ID="lblCompHead" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="coheadtxt">
                                                                    &nbsp;&nbsp;<a href="#" class="WhiteLink"> </a>
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
                <td style="height: 20px;">
                </td>
                <td style="height: 20px;">
                </td>
                <td style="height: 20px;" class="masterback">
                    <br />
                    <table width="100%" border="0" cellspacing="0" cellpadding="20">
                        <tr>
                            <td width="15%">
                                <div align="center">
                                </div>
                            </td>
                            <td width="70%" align="center" valign="middle">
                                <div align="center">
                                    <asp:Panel ID="Panelmain" runat="server" Visible="true">
                                        <table id="tbl_main" class="login" cellspacing="0" cellpadding="0" width="380">
                                            <tbody>
                                                <tr>
                                                    <td class="lt">
                                                        <h5>
                                                            Enter your User Id and Password
                                                        </h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt brdr">
                                                        <table cellspacing="0" cellpadding="0" align="center">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="lt">
                                                                        <form action="">
                                                                            <table class="width100per" cellspacing="12" cellpadding="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td colspan="2" style="width: auto; height: auto;">
                                                                                            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                                                                            <blink><b id="lblExpire" runat="server" style="width:78%;font-weight:bold;color:Red; font-size: 20px; text-decoration: underline overline;"></b></blink>
                                                                                             <SPAN><div id="divMayus" style="visibility:hidden"><b><font face="verdana" color="red">Caps Lock is on.</font></b></div>    
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="lt" width="25%" style="height: 22px">
                                                                                            User Id:
                                                                                        </td>
                                                                                        <td class="lt" style="width: 75%; height: 22px;">
                                                                                            <asp:TextBox ID="txtUserName" runat="server" TabIndex="1"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="lt">
                                                                                            Password:
                                                                                        </td>
                                                                                        <td class="lt" style="width: 75%;">
                                                                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Style="width: 149px"
                                                                                                TabIndex="2"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="lt" colspan="2">
                                                                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" TabIndex="4"
                                                                                                OnClick="LinkButton1_Click1">Forgot  Password ? Click here</asp:LinkButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="center" valign="middle" colspan="2">
                                                                                            <table cellspacing="0" cellpadding="0">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td valign="top">
                                                                                                            <asp:Button ID="Submit1" runat="server" CssClass="btn" Text="Submit" OnClick="Login_User"
                                                                                                                TabIndex="3" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td valign="top">
                                                                                                              <%--<a id="A4" href="#" style="font-weight: bold; color: Blue" onclick="javascript:ResetFun();">Reset</a> --%>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </form>
                                                                    </td>
                                                                    <td class="lt width1">
                                                                        <img height="130" alt="" src="images/login.gif" width="130" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </asp:Panel>
                                    <%--New Work--%>                                    
                                    <div id="dvPopup">
                                    <%--CloseAction="CloseButton" ShowCloseButton="false"--%>
                                        <dxpc:ASPxPopupControl ID="Verification" runat="server" ClientInstanceName="cVerification" CloseAction="None" ShowCloseButton="false"
                                            HeaderText="Additional Login Authentication Required!" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
                                            ShowSizeGrip="False" ShowOnPageLoad="False" Width="1000px" Height="200px" Modal="True">
                                            <ContentCollection>
                                                <dxpc:PopupControlContentControl runat="server">
                                                    <div style="width: 100%">
                                                        <div class="left" style="width: 49%">
                                                            <div class="" style="width: 100%">                                                                
                                                                <asp:Label ID="lblCaption" runat="server" Text="Enter The Missing 4-Digits Of Your PAN For Authentication :" ForeColor="Black" Font-Bold="true" Font-Size="Medium" CssClass="lblalert"/>
                                                            </div>
                                                            <div class="clear"></div>
                                                            <%--<div class="left" style="margin-top: 2px">
                                                                <asp:Label ID="lblpan1" runat="server" Text="PAN1" ForeColor="red"/>
                                                                <asp:TextBox ID="txtPANNo" runat="server" Width="50px" MaxLength="4"></asp:TextBox>
                                                                 <dxe:ASPxTextBox ID="txtPANNo" runat="server" Width="50px" MaxLength="4" CssClass="upper" ClientInstanceName="ctxtPANNo">
                                                                </dxe:ASPxTextBox>
                                                                <asp:Label id="lblpan2" runat="server" Text="PAN2" ForeColor="red"/>
                                                                <asp:TextBox ID="txtPANNo_hidden" runat="server" Width="14px" Style="display: none"></asp:TextBox>
                                                            </div>--%>
                                                             <div style="padding-top:30px; padding-left:420px">
                                                                <table class="padTableR">
                                                                    <tr>
                                                                        <td><b><asp:Label ID="lblpan1" runat="server" Text="PAN1" ForeColor="green" Font-Bold="true" Font-Size="Medium"/></b></td>
                                                                        <td>
                                                                            <dxe:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="50px" MaxLength="4" CssClass="upper" ClientInstanceName="ctxtPANNo" Font-Size="Medium" Font-Bold="true" ForeColor="green">
                                                                            </dxe:ASPxTextBox>
                                                                        </td>
                                                                        <td><b><asp:Label id="lblpan2" runat="server" Text="PAN2" ForeColor="green" Font-Bold="true" Font-Size="Medium"/></b></td>
                                                                    </tr>
                                                                </table>
                                                            </div>
                                                            <%--<div>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorasset" runat="server" ControlToValidate="txtPANNo"
                                                                ErrorMessage="Please Insert PAN" ValidationGroup="a">*</asp:RequiredFieldValidator>
                                                            </div>--%>
                                                        </div>
                                                    </div>
                                                    <span class="clear"></span>
                                                    <div style="padding-top: 6px; margin-right: 17px; width: 200px;" class="center">
                                                        <div class="left">
                                                            <div style="padding-top:10px;">
                                                                <asp:Button ID="btnVerify" runat="server" OnClientClick="VerificationPAN()" CssClass="btn" Text="Verify & Continue" Width="200px" Height="26px" Font-Bold="true" Font-Size="Medium"></asp:Button>
                                                            </div>
                                                            <div class="hide" style="padding-top: 16px; display: none">
                                                                <asp:Button ID="btnCancel" runat="server" OnClientClick="CancelVerificationPAN()" CssClass="btn" Text="Cancel Verification" Width="120px"></asp:Button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </dxpc:PopupControlContentControl>
                                            </ContentCollection>
                                            <HeaderStyle BackColor="lightgray" ForeColor="Black" Font-Bold="true" Font-Size="Medium"/>
                                        </dxpc:ASPxPopupControl>
                                    </div>
                                    <dxcp:ASPxCallbackPanel runat="server" ID="CallbackPanel" ClientInstanceName="cCallbackPanel" OnCallback="CallbackPanel_Callback">
                                        <ClientSideEvents EndCallback="CallbackPanelEndCall" />
                                    </dxcp:ASPxCallbackPanel>
                                    <%--End of New Work--%>
                                    <!-- forgot password table -->
                                    <asp:Panel ID="PanelForgetPass" runat="server" Visible="false">
                                        <table id="tbl_forgetpassword" class="login" cellspacing="0" cellpadding="0" width="380">
                                            <tbody>
                                                <tr>
                                                    <td class="lt">
                                                        <h5>
                                                            Enter your User Id
                                                        </h5>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="lt brdr">
                                                        <table cellspacing="0" cellpadding="0" align="center">
                                                            <tbody>
                                                                <tr>
                                                                    <td class="lt">
                                                                        <form action="">
                                                                            <table class="width100per" cellspacing="12" cellpadding="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td colspan="2" style="width: auto; height: auto;">
                                                                                            <asp:Label ID="LabelFrogetMessage" runat="server" ForeColor="Red"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="lt" width="25%" style="height: 22px">
                                                                                            User Id:
                                                                                        </td>
                                                                                        <td class="lt" style="width: 75%; height: 22px;">
                                                                                            <asp:TextBox ID="txtForgetPass" runat="server"></asp:TextBox>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="right" valign="middle" colspan="2">
                                                                                            <table cellspacing="0" cellpadding="0">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td valign="top">
                                                                                                            <asp:Button ID="Button1" runat="server" CssClass="btn" Text="get Password" OnClick="get_password"
                                                                                                                Width="84px" />
                                                                                                            <asp:Button ID="Button2" runat="server" CssClass="btn" Text="back" OnClick="get_back" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </form>
                                                                    </td>
                                                                    <td class="lt width1">
                                                                        <img height="130" alt="" src="images/login.gif" width="130" />
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </asp:Panel>
                                    &nbsp;
                                </div>
                            </td>
                            <td width="15%">
                                <div align="center">
                                </div>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                </td>
                <td style="height: 20px;">
                </td>
                <td style="height: 20px;">
                </td>
                <td style="height: 20px;">
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top;" class="footertab" colspan="6">
                    <table class="width100per" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="height: 95px; vertical-align: top">
                                <table width="100%" border="0" cellspacing="0" cellpadding="5" style="background-image: url(images/footerbg.jpg);
                                    height: 60px">
                                    <tr>
                                        <td colspan="3">
                                            <div align="center">
                                                <asp:Label ID="lblSoft" runat="server" Text=""></asp:Label></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <div align="center">
                                                <asp:Label ID="lblComp" runat="server" Text=""></asp:Label></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td id="tdCopyRight" runat="Server" style="text-align: left">
                                            Copyright &copy; 2020 @FitMinds</td>
                                        <td id="tdPowerBy" runat="Server" style="text-align: center">
                                            Powered By FitMinds
                                        </td>
                                        <td id="tdTechnialBy" runat="Server" style="text-align: right">
                                            Technicals by : <a href="http://www.fitminds.in" target="_blank">@FitMinds</a></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
