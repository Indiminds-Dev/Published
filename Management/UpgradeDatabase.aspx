<%@ page language="C#" autoeventwireup="true" inherits="management_UpgradeDatabase, App_Web_1tsvl7g6" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
function PageLoad()
    {
       document.getElementById('Div1').style.display="none";
    }

function DBVersion()
 {   
    document.getElementById('Div1').style.display="inline";
    cmb.PerformCallback('1');
 }

function showResult(s)
{
    document.getElementById('Div1').style.display="none";
    if(s.substring(0,2) == '99')
     {
        var arrVersion = s.split('~');
        if (confirm('Your Current DB Version is '+arrVersion[1]+'\nLatest available DB Version is '+arrVersion[2]+'.\nDo you want to Upgrade your DB Version to '+arrVersion[2]+' ? (Recommended)'))
        {
            document.getElementById('Div1').style.display="inline";
            cmb.PerformCallback('2');
        }
     }
     else if (s.substring(0,2) == '88')
         {
             var arrVersion = s.split('~');
             alert('Current Database Version is '+arrVersion[1]+'.\nYour Database is updated.');
         }
         
     else
        alert(s);
         
}

</script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <table class = "TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Upgrade Database</span></strong>
                    </td>
                </tr>
</table>
    <div align="center">
    <div id='Div1' style='position:absolute; font-family:arial; font-size:30; left:40%; top:40%;background-color:white; layer-background-color:white; height:80; width:150;'>
                    <table width='150' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'> 
                      <tr><td><table><tr> 
                         <td height='25' align='center' bgcolor='#FFFFFF'> 
                           <img src='../images/progress.gif' width='18' height='18'></td>  
                            <td height='10' width='100%' align='center' bgcolor='#FFFFFF'><font size='2' face='Tahoma'> 
 	                        <strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait..</strong></font></td> 
                            </tr>  </table></td></tr>
                            </table> 
</div> 

<table class = "TableMain100">
    <tr>
        <td>
            <dxe:ASPxButton ID="ASPxButton1" runat="server" 
                       Text="Send Message To Users Before Upgrading Database" ValidationGroup="a" AutoPostBack="False">
                     <clientsideevents click="function(s, e) {}">
                      </clientsideevents>
                                    
            </dxe:ASPxButton>
        </td>
    </tr>
    <tr>
        <td>
            <dxe:ASPxButton ID="ASPxButton2" runat="server" 
                      Text="Upgrade Database" ValidationGroup="a" AutoPostBack="False">
                     <clientsideevents click="function(s, e) {DBVersion();}">
                      </clientsideevents>
                                    
            </dxe:ASPxButton>
        </td>
    </tr>
    <tr style="visibility:hidden">
        <td>
            <dxe:ASPxComboBox ID="ASPxComboBox2"  ClientInstanceName="cmb" runat="server" 
            OnCallback="cmb_CallBack" OnCustomJSProperties="cmb_CustomJSProperties">
            
            <ClientSideEvents EndCallback="function(s,e){showResult(s.cpretValue);}" />
            
            </dxe:ASPxComboBox>
        </td>
    </tr>
</table>
</div>
    </form>
</body>
</html>


<%--

<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UpgradeDatabase.aspx.cs" Inherits="management_UpgradeDatabase" Title="Untitled Page" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Src="Headermain.ascx" TagName="Headermain" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<uc1:Headermain ID="Headermain1" runat="server" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
<script language="javascript" type="text/javascript">
function PageLoad()
    {
       document.getElementById('Div1').style.display="none";
    }

function DBVersion()
 {   
    document.getElementById('Div1').style.display="inline";
    cmb.PerformCallback('1');
 }

function showResult(s)
{
    document.getElementById('Div1').style.display="none";
    if(s.substring(0,2) == '99')
     {
        var arrVersion = s.split('~');
        if (confirm('Your Current DB Version is '+arrVersion[1]+'\nLatest available DB Version is '+arrVersion[2]+'.\nDo you want to Upgrade your DB Version to '+arrVersion[2]+' ? (Recommended)'))
        {
            document.getElementById('Div1').style.display="inline";
            cmb.PerformCallback('2');
        }
     }
     else if (s.substring(0,2) == '88')
         {
             var arrVersion = s.split('~');
             alert('Current Database Version is '+arrVersion[1]+'.\nYour Database is updated.');
         }
         
     else
        alert(s);
         
}

</script>
<br />
<br />
<div id='Div1' style='position:absolute; font-family:arial; font-size:30; left:40%; top:40%;= background-color:white; layer-background-color:white; height:80; width:150;'>
                    <table width='150' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'> 
                      <tr><td><table><tr> 
                         <td height='25' align='center' bgcolor='#FFFFFF'> 
                           <img src='../images/progress.gif' width='18' height='18'></td>  
                            <td height='10' width='100%' align='center' bgcolor='#FFFFFF'><font size='2' face='Tahoma'> 
 	                        <strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait..</strong></font></td> 
                            </tr>  </table></td></tr>
                            </table> 
</div> 

<table class = "TableMain100">
    <tr>
        <td>
            <dxe:ASPxButton ID="btnSendMessage" runat="server" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                      CssPostfix="Office2003_Blue" Text="Send Message To Users Before Upgrading Database" ValidationGroup="a" AutoPostBack="False">
                     <clientsideevents click="function(s, e) {}">
                      </clientsideevents>
                                    
            </dxe:ASPxButton>
        </td>
    </tr>
    <tr>
        <td>
            <dxe:ASPxButton ID="btnDBVersion" runat="server" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                      CssPostfix="Office2003_Blue" Text="Upgrade Database" ValidationGroup="a" AutoPostBack="False">
                     <clientsideevents click="function(s, e) {DBVersion();}">
                      </clientsideevents>
                                    
            </dxe:ASPxButton>
        </td>
    </tr>
    <tr style="visibility:hidden">
        <td>
            <dxe:ASPxComboBox ID="ASPxComboBox1"  ClientInstanceName="cmb" runat="server" 
            OnCallback="cmb_CallBack" OnCustomJSProperties="cmb_CustomJSProperties">
            
            <ClientSideEvents EndCallback="function(s,e){showResult(s.cpretValue);}" />
            
            </dxe:ASPxComboBox>
        </td>
    </tr>
</table>
</asp:Content>

--%>