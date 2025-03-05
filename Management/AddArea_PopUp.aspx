<%@ page language="C#" autoeventwireup="true" inherits="management_AddArea_PopUp, App_Web_6yanuau_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Add Area</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
</head>
<script language="ecmascript" type="text/javascript">
function fnCLose()
{
    //window.opener.OnCityChanged(cmbCity);
}
</script>
<body style="background-color:#DDECFE;">
    <form id="form1" runat="server">
    <div>
        <table border="0" class="TableMain100">
          <tr>
            <td class="grdcellright">City &nbsp;Name</td>
            <td class="grdcellleft">
                <asp:Label ID="lblCity" runat="server" Width="155px"></asp:Label></td>
          </tr>
          <tr>
            <td class="grdcellright">Area &nbsp;Name</td>
            <td class="grdcellleft">&nbsp;<asp:TextBox ID="txtArea" runat="server" Width="150px"></asp:TextBox></td>
          </tr>
          <tr>
            <td></td>
            <td>&nbsp;
                <dxe:ASPxButton ID="btnSave" ClientInstanceName="btnSave" runat="server"  Text="Save" OnClick="btnSave_Click">
                    <ClientSideEvents Click="function(s, e) {
	fnCLose();
}" />
                </dxe:ASPxButton>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                    SelectCommand="SELECT [city_id], [city_name] FROM [tbl_master_city] ORDER BY [city_name]">
                </asp:SqlDataSource>
            </td>
          </tr>
       </table>
    </div>
    </form>
</body>
</html>
