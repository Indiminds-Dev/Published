<%@ page language="C#" autoeventwireup="true" inherits="management_frm_SlipsRegisterDetails, App_Web_xu-hjjp9" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:label ID="lblCompany" runat="server"></asp:label>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="gridSlips" runat="server" Width="100%" ClientInstanceName="grid"
                            AutoGenerateColumns="False" KeyFieldName="srlno" OnCustomCallback="gridSlips_CustomCallback" >
                            <SettingsBehavior AllowFocusedRow="True"></SettingsBehavior>
<Styles>
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<FocusedGroupRow BackColor="#FCA977"></FocusedGroupRow>

<FocusedRow BackColor="#FCA977"></FocusedRow>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>
                            <SettingsPager PageSize="10" visible="true"></SettingsPager>
                                
                                <columns>
<dxwgv:GridViewDataTextColumn  FieldName="DpSlipsIssued_SlipType"  Caption="Slip Type" VisibleIndex="0">

<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn FieldName="DpSlipsIssued_Slipfrom" Width="200px" Caption="Slip From" VisibleIndex="1">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

<dxwgv:GridViewDataTextColumn  FieldName="DpSlipsIssued_SlipTo" Caption="Slip To" VisibleIndex="2">


<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>


<CellStyle HorizontalAlign="Right" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>

</columns>
                                <settings showfooter="True" showstatusbar="Visible" showtitlepanel="True"></settings>
                                <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
                            </dxwgv:ASPxGridView>    
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
