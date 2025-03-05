<%@ page language="C#" autoeventwireup="true" inherits="frmReport_SalrySlip, App_Web_7htzac9n" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <title>Untitled Page</title>
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
     <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;" colspan="3">
                        <strong><span style="color: #000099">Salary & Reimbursment</span></strong>
                    </td>
                </tr>
                <tr>
                <td align="right" style="height: 37px">
                    &nbsp;<dxe:ASPxDateEdit ID="txtDOB" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                            TabIndex="9" Width="202px" Date="2010-09-01" EditFormatString="MMMM-yyyy">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                        <CalendarProperties DayNameFormat="Shortest">
                        </CalendarProperties>
                                        </dxe:ASPxDateEdit>
                                        </td>
                                        <td style="height: 37px"><asp:Button ID="btnSalarySlip" runat="server" Text="Get SalarySlip" CssClass="btnUpdate" OnClick="btnSalarySlip_Click" />&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnReimbursment" runat="server" Text="Get Reimbursment" CssClass="btnUpdate" OnClick="btnReimbursment_Click"/></td>
                                           
                                            
                
                </tr>
               
                </table>
    </div>
    </form>
</body>
</html>
