<%@ page language="C#" autoeventwireup="true" inherits="management_frmupdateMeeting, App_Web_n3rnr3dz" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PostPond Meetings</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
   
   function closeWin()
   {
     parent.editwin.close();
   }
    function close()
    {
    
      parent.editwin.close();
     
    }
  
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td colspan="3" align="center">
                        <asp:Label ID="lblName" runat="Server" ForeColor="Navy" Font-Bold="True" CssClass="Ecoheadtxt"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="mylabel1" style="width: 18%" align="left">
                        Next Visit DateTime:</td>
                    <td class="lt">
                        &nbsp;&nbsp;<dxe:ASPxDateEdit ID="VisitDate" runat="server" 
                             EditFormat="Custom" 
                            UseMaskBehavior="True" Width="180px">
                            <ButtonStyle Width="13px" />
                        </dxe:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td class="mylabel1" style="width: 18%">
                        Note:</td>
                    <td class="lt">
                        <asp:TextBox ID="txtNote" runat="Server" TextMode="multiLine" Width="739px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="3" align="Center">
                        <asp:Button ID="btnSave" runat="Server" Text="Save" CssClass="btnUpdate" OnClick="btnSave_Click" />
                        <input type="button" id="btnClose" name="btnClose" class="btnUpdate"
                            value="Close" onclick="closeWin();" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
