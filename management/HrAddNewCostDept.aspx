<%@ page language="C#" autoeventwireup="true" inherits="management_HrAddNewCostDept, App_Web_co654op-" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
   

     <!--External Styles-->
    <link type="text/css" href="../CSS/GenericCss.css" rel="Stylesheet" />
    
    <!--External Scripts file-->
    <!-- Ajax List Requierd-->
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <!--Other Script-->
    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/GenericJScript.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <!--JS Inline Method-->
    <script language="javascript" type="text/javascript">
        FieldName="DontKnow";
        function SignOff()
        {
            window.parent.SignOff();
        }
        function height()
        {        
           if(document.body.scrollHeight>=350)
            window.frameElement.height = document.body.scrollHeight;
           else
            window.frameElement.height = '350px';
            window.frameElement.Width = document.body.scrollWidth;
        }
        function Message(obj)
        {
            if(obj==1)
            {
                alert("Successfully Inserted");
                parent.editwin.close();
            }
            else
                alert("There is Any Problem To Save Data!!!\n Please Try Again");
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="height: 277px">
                        <table width="100%" border="1">
                            <tr>
                                <td style="text-align: left; vertical-align: top; height: 11px; background-color: #b7ceec;">
                                    Cost Name Center
                                </td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="TxtCenter" runat="server" Width="250px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align: left; height: 11px; vertical-align: top; background-color: #b7ceec;">
                                    Cost Center Type</td>
                                <td style="height: 24px; width: 406px;">
                                    <asp:DropDownList ID="DDLType" runat="server" Width="254px">
                                        <asp:ListItem>Department</asp:ListItem>
                                        <asp:ListItem>Employee</asp:ListItem>
                                        <asp:ListItem>Branch</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="text-align: left; vertical-align: top; height: 11px; background-color: #b7ceec;">
                                    Perent Cost Center/Dept</td>
                                <td style="width: 406px">
                                    <asp:DropDownList ID="DDLCostDept" runat="server" Width="254px">
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td style="text-align: left; vertical-align: top; height: 11px; background-color: #b7ceec;">
                                    Head Of Department</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="txtDptHead" runat="server" Width="250px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="text-align: left; vertical-align: top; height: 11px; background-color: #b7ceec;">
                                    Email-ID</td>
                                <td style="width: 406px">
                                    <asp:TextBox ID="TxtEmail" runat="server" Width="250px"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                </td>
                                <td style="width: 406px">
                                    <table style="width: 200px">
                                        <tr>
                                            <td style="width: 100px">
                                                <asp:CheckBox ID="ChkFund" runat="server" Text="Mutual Funds" Width="124px" />
                                            </td>
                                            <td style="width: 100px">
                                                <asp:CheckBox ID="ChkBrok" runat="server" Text="Broking " />
                                            </td>
                                            <td style="width: 100px">
                                                <asp:CheckBox ID="ChkInsu" runat="server" Text="Insurance"/></td>
                                            <td style="width: 100px">
                                                <asp:CheckBox ID="ChkDepos" runat="server" Text="Depository" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left; vertical-align: top; height: 11px; background-color: #b7ceec;">
                                    &nbsp;</td>
                                <td style="width: 406px">
                                    <asp:Label ID="lblmessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></td>
                            </tr>
                            <tr>
                                <td style="vertical-align: top; height: 11px; background-color: #b7ceec; text-align: left">
                                    &nbsp;</td>
                                <td style="width: 406px; text-align: right">
                                    &nbsp;<asp:Button ID="BtnSave" runat="server" Text="Save" OnClick="BtnSave_Click" Width="100px" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <asp:HiddenField ID="txtDptHead_hidden" runat="Server" />
    </form>
</body>
</html>
