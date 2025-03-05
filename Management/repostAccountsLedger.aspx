<%@ page language="C#" autoeventwireup="true" inherits="management_repostAccountsLedger, App_Web_mzqu16me" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
   <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function Page_Load()
    {
        document.getElementById('Div1').style.display="none";
    }
    function btn_Click()
    {
         document.getElementById('Div1').style.display="inline";
        combo.PerformCallback();
    }
    function ShowError(obj)
    {
        document.getElementById('Div1').style.display="none";
        if(obj=="b")
        {
            alert('Accounts Ledger Repost !!');
        }
        else
        {
            alert('No Data In This Company And Segment !!');
        }
         
    }
</script>
<table class="TableMain100">
<tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Reposts Accounts Ledger</span></strong>
                    </td>
                </tr></table>
  <div id='Div1' style='position:absolute; font-family:arial; font-size:30; left:40%; top:25%; background-color:white; layer-background-color:white; height:80; width:150;'>
                    <table class="TableMain100"> 
                      <tr><td><table><tr> 
                         <td height='25' align='center' bgcolor='#FFFFFF'> 
                           <img src='../images/progress.gif' width='18' height='18'></td>  
                            <td height='10' width='100%' align='center' bgcolor='#FFFFFF'><font size='2' face='Tahoma'> 
 	                        <strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait..</strong></font></td> 
                            </tr>  </table></td></tr>
                            </table> 
                    </div>
<table class="TableMain100">
    <tr>
        <td align="center">
            <input id="Button1" type="button" value="Repost Accounts Ledger" onclick="btn_Click()" class="btnUpdate" style="width: 385px" />
        </td>
    </tr>
    <tr style="display:none">
        <td>
            <dxe:ASPxComboBox ID="ASPxComboBox1" ClientInstanceName="combo" runat="server" OnCallback="ASPxComboBox1_Callback" OnCustomJSProperties="ASPxComboBox1_CustomJSProperties">
              <ClientSideEvents EndCallback="function(s,e) { ShowError(s.cpInsertError); }" />
            </dxe:ASPxComboBox>
        </td>
    </tr>
</table>
    </form>
</body>
</html>
