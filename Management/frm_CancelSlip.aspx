<%@ page language="C#" autoeventwireup="true" inherits="management_frm_CancelSlip, App_Web_lgnajdkn" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
<script language="javascript" type="text/javascript">
  function SignOff()
   {
       window.parent.SignOff();
   } 
    function PageLoad()
    {
        
        document.getElementById('Div1').style.display='none'; 
        
        arrQStr = window.location.search.substring(1).split('&');

        arrDpId = arrQStr[0].split('=');
        arrBenId = arrQStr[1].split('=');
        arrSlipType = arrQStr[2].split('=');
        document.getElementById('<%=txtSlipFrom.ClientID%>').value='';
        document.getElementById('<%=txtSlipTo.ClientID%>').value='';
        document.getElementById('<%=txtReason.ClientID%>').value='';
        
        
        document.getElementById('<%=txtSlipFrom.ClientID%>').focus();
       
   
    }
    function AllowCharacterAndNumber(e)
            {
                var keycode;
                if (window.event) keycode = window.event.keyCode;
                else if (event) keycode = event.keyCode;
                else if (e) keycode = e.which;
                else return true;
                if( (keycode > 64 && keycode <= 90) || (keycode > 96 && keycode <= 122) || (keycode > 47 && keycode <= 57) )
                {
                    return true;
                }
                else
                {
                    return false;
                }
               

            }  
        
            
    function Check()
    {
        
        slipFrom = document.getElementById('<%=txtSlipFrom.ClientID%>').value;
        slipTo = document.getElementById('<%=txtSlipTo.ClientID%>').value;
        reason = document.getElementById('<%=txtReason.ClientID%>').value;
        if ((slipFrom == '') || (slipTo == ''))
            {
            alert('Slip Range Must Be Entered.');
            if (slipFrom == '')
                {
                document.getElementById('<%=txtSlipFrom.ClientID%>').focus();
                }
            else
                {
                document.getElementById('<%=txtSlipTo.ClientID%>').focus();
                }
            
            
            }
            
        else
            {
            param = arrDpId[1]+'~'+arrBenId[1]+'~'+arrSlipType[1]+'~'+slipFrom+'~'+slipTo+'~'+reason;
            document.getElementById('Div1').style.display='inline'; 

            PageMethods.CancelSlip(param, CallSuccess);

            }
            
    }
    function CallSuccess(res)
    {
        document.getElementById('Div1').style.display='none'; 

        if (res == "Negative Range")
        {
            alert('Invalid. Slip Range Must Be Positive.');
        }
        else if(res == "0")
        {
            alert("Specified Slips Have Been Cancelled Successfully.");
            parent.editwin.close();
                parent.document.getElementById('IFRAME_ForAllPages').contentWindow.callback();
            
        }
        else if(res == "-1")
        {
            alert("Invalid Slip Range.");
        }
        else 
        {
            var arrRes = res.split('~');

            var msg = '';
            
            if (arrRes[0]!='')
                {
                msg = msg + "SlipNumbers  "+arrRes[0]+"  have already been used, cannot be cancelled.\n";
                alert(msg);
                
                }
            if (arrRes[1]!='')
                {
                msg = msg + "SlipNumbers  "+arrRes[1]+"  have already been cancelled, cannot be cancelled again.\n";
                alert(msg);
                 
                
                                  
                }
                
            if (arrRes[2]!='')
                {
                msg = msg + "\nSlipNumbers  "+arrRes[2]+" have been successfully cancelled."; 
                alert(msg);
               parent.editwin.close();
                parent.document.getElementById('IFRAME_ForAllPages').contentWindow.callback();
               
                }
                
           

        }
            
        document.getElementById('<%=txtSlipFrom.ClientID%>').value='';
        document.getElementById('<%=txtSlipTo.ClientID%>').value='';
        document.getElementById('<%=txtReason.ClientID%>').value='';
        
        document.getElementById('<%=txtSlipFrom.ClientID%>').focus();
        
    }
    
   </script>
    <form id="form1" runat="server">
    <div align="center">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />
    <table  width="700px" border="1" rules="none" 
            bordercolor="white"  >
            <tr>
        <td colspan="4" >&nbsp;
        </td>
    
    </tr>
    <tr>
        <td  colspan="4" style="vertical-align:middle;
	height: 25px; font-family: Tahoma,Arial, Verdana, sans-serif;
	color:Blue;	font-size:11px; font-weight:bold; padding-left:20px">Enter Slip Range To Be Cancelled :
        </td>
    </tr>
    <tr>
        <td class="gridcellright" width="20%">Slip Number From :
        </td>
        <td class="gridcellleft" width="30%">
            <asp:TextBox ID="txtSlipFrom" runat="server" Width="170px" 
            onKeyPress="return AllowCharacterAndNumber(this);">
            
            </asp:TextBox>
            
        </td>
        <td class="gridcellright" width="20%">Slip Number To :
        </td>
        <td width="30%" class="gridcellleft">
        <asp:TextBox ID="txtSlipTo" runat="server" Width="170px" 
        onKeyPress="return AllowCharacterAndNumber(this);">
           
            </asp:TextBox>
            
            
        </td>
    </tr>
    <tr>
        <td class="gridcellright">Reason For Cancellation :    
        </td>
        <td class="gridcellleft" colspan="3">
            <asp:TextBox ID="txtReason"  TextMode="MultiLine" Rows="3" runat="server"
            Width="168px" ></asp:TextBox>
            
        </td>
    </tr>
    <tr>
        <td colspan="4" align="center">
            <dxe:ASPxButton ID="btnSubmit" runat="server" Text="Submit" AutoPostBack="false">
            <ClientSideEvents Click="function(s,e)
                                            {
                                            Check();
                                            }" />
            </dxe:ASPxButton>
        </td>
    </tr>
    <tr>
        <td colspan="4" >&nbsp;
        </td>
    
    </tr>
    </table>
    </div>
    <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%; top: 20%; height: 80; width: 150;'>
            <table width='150' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td height='25' align='center' bgcolor='#FFFFFF'>
                                    <img src='../images/progress.gif' width='18' height='18'></td>
                                <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                    <font size='2' face='Tahoma'><strong align='center'>Please wait..</strong></font></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
