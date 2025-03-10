<%@ page language="C#" autoeventwireup="true" inherits="management_cdsl_NotAllocaed, App_Web_yf04ozfw" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    
        <script language="javascript" type="text/javascript">

    function closeWin() 
    {
        parent.editwin.close();
    }
        </script>
</head>
<body style="background-color: #DDECFE;">
    <form id="form1" runat="server">
        <div align="center">
          
            <table class="TableMain100" >
                <tr>
                    <td class="EHEADER" colspan="2">
                        <strong><span style="color: #000099">Following Clients not allocated in any Charge Basket</span></strong>
                    </td>
                </tr>
                <tr>
                    <td align="right" colspan="2" style="padding-right: 35px" valign="baseline">
                        <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                            ClientInstanceName="exp" Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                            SelectedIndex="0" ValueType="System.Int32" Width="130px">
                            <Items>
                                <dxe:ListEditItem Text="Select" Value="0" />
                                <dxe:ListEditItem Text="PDF" Value="1" />
                                <dxe:ListEditItem Text="XLS" Value="2" />
                                <dxe:ListEditItem Text="RTF" Value="3" />
                                <dxe:ListEditItem Text="CSV" Value="4" />
                            </Items>
                            <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                            </ButtonStyle>
                            <ItemStyle BackColor="Navy" ForeColor="White">
                                <HoverStyle BackColor="#8080FF" ForeColor="White">
                                </HoverStyle>
                            </ItemStyle>
                            <Border BorderColor="White" />
                            <DropDownButton Text="Export">
                            </DropDownButton>
                        </dxe:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="padding-left:15px" align="left">
                        <dxwgv:ASPxGridView ID="gridUnAllocated" runat="server" AutoGenerateColumns="False"
                            ClientInstanceName="grid" KeyFieldName="BenAccountNumber" Width="480px">
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <Settings ShowFooter="True" ShowStatusBar="Visible" ShowTitlePanel="True" />
                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="4" ShowSeparators="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="BenAccount" FieldName="BenAccountNumber" VisibleIndex="0">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="name" VisibleIndex="1">
                                    <CellStyle CssClass="gridcellleft" Wrap="False">
                                    </CellStyle>
                                    <Settings AutoFilterCondition="Contains" FilterMode="DisplayText" />
                                </dxwgv:GridViewDataTextColumn>
                               
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2" style="padding-left: 15px">
                        <asp:Button ID="btnClose" runat="server" CssClass="btnUpdate" Height="23px" OnClientClick="javascript:closeWin();"
                            TabIndex="13" Text="Close" Width="101px" />
                        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                        </dxwgv:ASPxGridViewExporter>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
