<%@ page language="C#" autoeventwireup="true" inherits="management_Trade_Processing, App_Web_fxnvzv_8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
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
        if(document.body.scrollHeight>=200)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '200px';
        window.frameElement.Width = document.body.scrollWidth;
    }
     function PageLoad()
    {
        FieldName='btnShow';
        document.getElementById('Div1').style.display="none";
        document.getElementById('txtset_hidden').style.display='none';
    }
 

    function Generate_Trade()
    {
//        alert('a');
        document.getElementById('Div1').style.display="inline";
        cmb.PerformCallback();
    }
   function GenerateTradeProcessing(s)
    {
      document.getElementById('Div1').style.display="none";

     alert(s);
    }


</script>
 <div id='Div1' style='position:absolute; font-family:arial; font-size:30; left:40%; top:40%;background-color:white;layer-background-color:white; height:80; width:150;'>
                    <table width='150' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'> 
                      <tr><td><table><tr> 
                         <td height='25' align='center' bgcolor='#FFFFFF'> 
                           <img src='../images/progress.gif' width='18' height='18'></td>  
                            <td height='10' width='100%' align='center' bgcolor='#FFFFFF'><font size='2' face='Tahoma'> 
 	                        <strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Please Wait..</strong></font></td> 
                            </tr>  </table></td></tr>
                            </table> 
                    </div> 
    <table align="center" border="0" cellpadding="0" cellspacing="0" id="TABLE1" onclick="return TABLE1_onclick()">
        <tr>
           <%-- <td id="td1">
                <span class="Ecoheadtxt" style="color:White"><strong>Settelment No: </strong></span>
            </td>
            <td id="tdset" class="gridcellleft">
                <asp:TextBox ID="txtset" runat="server" Font-Size="10px"></asp:TextBox>
                <asp:TextBox ID="txtset_hidden" runat="server" Width="2px"></asp:TextBox>
            </td>--%>
            <td id="td_generate" style="text-align:center;">
                <dxe:ASPxButton ID="btnGenerate" runat="server" 
                     Text="Generate" ValidationGroup="a" AutoPostBack="false"
                    >
                                     <clientsideevents click="function(s, e) {
	                                    Generate_Trade();
                                    }"></clientsideevents>
                </dxe:ASPxButton>
            </td>
            <td style="visibility:hidden">
                <dxe:ASPxComboBox ID="cmb" Width="160px" runat="server" 
                     Font-Size="10px" 
                    ValueType="System.String" Font-Bold="False" SelectedIndex="0" ClientInstanceName="cmb"
                    OnCallback="cmb_Callback" OnCustomJSProperties="cmb_CustomJSProperties">
                    <Items>
                        <dxe:ListEditItem Text="cmbvalidation" Value="validation"></dxe:ListEditItem>
                    </Items>
                    <ButtonStyle Width="60px">
                    </ButtonStyle>
                    <DropDownButton Text="validation">
                    </DropDownButton>
                    <ClientSideEvents EndCallback="function(s, e) {
	                    GenerateTradeProcessing(s.cpretValue);
                    }"></ClientSideEvents>
                    <Paddings PaddingBottom="0px"></Paddings>
                </dxe:ASPxComboBox>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
