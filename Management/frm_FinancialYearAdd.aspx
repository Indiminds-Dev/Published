<%@ page language="C#" autoeventwireup="true" inherits="management_frm_FinancialYearAdd, App_Web_nhjs8cfd" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Financial Year</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
     function ValidatePage()
    {
   
   
      if(document.getElementById("txtFinYear").value=='')
      {
      alert('Please Type Financial Year.');
      return false;
      }
   
      else if(txtStart.GetText() =='01-01-0100' || txtStart.GetText() =='01-01-1900')
      {
       alert('Start Date Of Financial is Required!!!');
       return false;
      }
     
       else if(txtEnd.GetText() =='01-01-0100' || txtEnd.GetText() =='01-01-1900')
      {
       alert('End Date Of Financial is Required!!!');
       return false;
      }
      
      
    }
    function Close()
    {
    parent.editwin.close();
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div align="center">
            <table width="500px">
                <tr>
                    <td class="gridcellleft">
                        <span class="Ecoheadtxt">Financial Year:</span>
                    </td>
                    <td class="gridcellleft">
                        <asp:TextBox ID="txtFinYear" runat="server" Width="200px" Font-Size="11px" MaxLength="9" TabIndex="4"></asp:TextBox>&nbsp;(Ex.2001-2002)
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        <span class="Ecoheadtxt">Start Date:</span>
                    </td>
                    <td class="gridcellleft">
                        <dxe:ASPxDateEdit ID="txtStart" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            TabIndex="9" Width="204px">
                            <buttonstyle width="13px">
                                            </buttonstyle>
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        <span class="Ecoheadtxt">End Date:</span>
                    </td>
                    <td class="gridcellleft">
                        <dxe:ASPxDateEdit ID="txtEnd" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                            TabIndex="9" Width="204px">
                            <buttonstyle width="13px">
                                            </buttonstyle>
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="gridcellleft">
                        <span class="Ecoheadtxt">Remarks:</span>
                    </td>
                    <td class="gridcellleft">
                        <asp:TextBox TextMode="MultiLine" ID="txtRemarks" runat="server" Width="200px" Font-Size="11px" TabIndex="4"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td colspan="2" class="gridcellleft">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click"
                            TabIndex="31" ValidationGroup="a" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" OnClientClick="Close()"
                            TabIndex="32" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
