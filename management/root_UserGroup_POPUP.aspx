<%@ page language="C#" autoeventwireup="true" inherits="management_root_UserGroup_POPUP, App_Web_snhbal_j" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>CRM</title>
</head>
<body >

    <form id="form1" runat="server" >
    <div >
    <table style="padding-left:0px; padding-top:0px;">
        <tr>
            <td colspan="2">
                <strong><span style="font-size: 10pt; color: #3300cc">
            Please Don`t Uncheck Any check Box. For No Access Use 'Non' Option!</span></strong>
            </td>
        </tr>
        <tr>
            <td>
                <dxwtl:ASPxTreeList ID="TLgrid" runat="server" AutoGenerateColumns="False" KeyFieldName="smu_id" ParentFieldName="menuParentID" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" OnHtmlRowPrepared="TLgrid_HtmlRowPrepared" >
                                    <Columns>
                                        
                                        <dxwtl:TreeListTextColumn Caption="name" FieldName="smu_name" VisibleIndex="1">
                                        </dxwtl:TreeListTextColumn>
                                        <dxwtl:TreeListTextColumn Caption="Option" VisibleIndex="2">
                                        <DataCellTemplate>
                                                    <dxe:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="77px" Text='<%# Eval("Mode") %>'><MaskSettings ShowHints="True" Mask="&lt;All|Add|*View|DelAdd|Modify|Delete|Non&gt;" /></dxe:ASPxTextBox>
                                        </DataCellTemplate>
                                            <HeaderStyle Wrap="False" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dxwtl:TreeListTextColumn>
                                        
                                    </Columns>
                                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue">
                                    </Styles>
                                    <Settings GridLines="Both" />
                                    <SettingsBehavior AllowSort="False" AutoExpandAllNodes="True" />
                                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                        <ExpandedButton Height="11px" Url="~/App_Themes/Office2003 Blue/TreeList/ExpandedButton.png"
                                            Width="11px" />
                                        <CustomizationWindowClose Height="12px" Width="13px" />
                                        <CollapsedButton Height="11px" Url="~/App_Themes/Office2003 Blue/TreeList/CollapsedButton.png"
                                            Width="11px" />
                                    </Images>
                                    <SettingsSelection Enabled="True" />
                                </dxwtl:ASPxTreeList>
            </td>
            <td style="text-align:left; vertical-align:top;">
                <dxe:ASPxButton ID="btnSave" runat="server" Text="Save" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" OnClick="btnSave_Click">
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
