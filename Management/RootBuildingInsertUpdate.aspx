<%@ page language="C#" autoeventwireup="true" inherits="management_RootBuildingInsertUpdate, App_Web_njtlujlb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">

            
   function Show() 
           {

                var url = "frmAddDocuments.aspx";

                popup.SetContentUrl(url);

                popup.Show();
           }

       
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table style="width: 492px" class="TableMain100">
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label2" runat="server" Text="Building Name "></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtBuilding" runat="server" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label3" runat="server" Text="Care Taker/Contact Person" Width="170px"></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="DDLCareTaker" runat="server" Width="236px">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label4" runat="server" Text="Address1"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtAdd1" runat="server" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label5" runat="server" Text="Address2"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtAdd2" runat="server" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label6" runat="server" Text="Address3 "></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtAdd3" runat="server" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label7" runat="server" Text="LandMark"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtLand" runat="server" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label8" runat="server" Text="Country "></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="DDLCountry" runat="server" Width="236px" AutoPostBack="True"
                                    OnSelectedIndexChanged="DDLCountry_SelectedIndexChanged">
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                <asp:Label ID="Label9" runat="server" Text="State "></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="DDLState" runat="server" Width="236px" AutoPostBack="True"
                                    OnSelectedIndexChanged="DDLState_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:TextBox ID="TxtState" runat="server" Visible="False" Width="230px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label10" runat="server" Text="City "></asp:Label></td>
                            <td>
                                <asp:DropDownList ID="DDLCity" runat="server" Width="236px">
                                </asp:DropDownList>
                                <asp:TextBox ID="TxtCity" runat="server" Visible="False" Width="230px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:Label ID="Label11" runat="server" Text="PIN"></asp:Label></td>
                            <td>
                                <asp:TextBox ID="TxtPin" runat="server" Width="230px"></asp:TextBox></td>
                        </tr>
                        <tr>
                        <td>
                        </td>
                        <td>
                                                <asp:Button ID="BtnSave" runat="server" Text="Save" CssClass="btnUpdate" OnClick="BtnSave_Click" />
                        <asp:Button ID="BtnAdd" runat="server" Text="Add Files" Visible="false" OnClientClick="Show()" />
                        </td>
                        </tr>
                    </table>
                 <%--   <dxpc:ASPxPopupControl runat="server" ClientInstanceName="popup" CloseAction="CloseButton"
                        ContentUrl="frmAddDocuments.aspx" HeaderText="Add Document" Left="150" Top="10"
                        Width="700px" Height="400px" ID="ASPXPopupControl">
                        <ContentCollection>
                            <dxpc:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                            </dxpc:PopupControlContentControl>
                        </ContentCollection>
                    </dxpc:ASPxPopupControl>--%>
                </ContentTemplate>
         </asp:UpdatePanel>
               <%--<table>
                <tr>
                    <td >
                    </td>
                    <td>

                    </td>
                </tr>
            </table>--%>
        </div>
    </form>
</body>
</html>
