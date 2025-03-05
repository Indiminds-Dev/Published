
<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_RegionwiseBranch, App_Web_krnt_rtp" %>


<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" language="javascript">
        function height()
        {
            if(document.body.scrollHeight>300)
                window.frameElement.height = document.body.scrollHeight;
            else
                window.frameElement.height = '300px';
            window.frameElement.widht = document.body.scrollWidht;
        }
        function SignOff()
        {
            parent.window.SignOff();
        }
        function LastCall(obj)
        {
            height();
        }
  
    </script>
    <title>Untitled Page</title>
</head><body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
<table class="TableMain">
        <tr>
            <td class="EHEADER" colspan="4">
                <strong><span style="color: #000099">Regionwise Branch Distribution Report</span></strong>
            </td>
        </tr>
        <tr>
            <td>
                                        <dxwtl:ASPxTreeList ID="TVRegionBranchHir" ClientInstanceName="List" runat="server" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                                            CssPostfix="Office2003_Blue" KeyFieldName="ID" ParentFieldName="ParentID" Width="100%">
                                            <Styles CssPostfix="Office2003_Blue" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css">
                                                <FooterCell HorizontalAlign="Right"></FooterCell>
                                            </Styles>

                                            <Settings SuppressOuterGridLines="True"  GridLines="Both"></Settings>

                                            <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                            <ExpandedButton Height="11px" Width="11px" Url="~/App_Themes/Office2003 Blue/TreeList/ExpandedButton.png"></ExpandedButton>

                                            <CustomizationWindowClose Height="12px" Width="13px"></CustomizationWindowClose>

                                            <CollapsedButton Height="11px" Width="11px" Url="~/App_Themes/Office2003 Blue/TreeList/CollapsedButton.png"></CollapsedButton>
                                            </Images>
                                            <Columns>
                                                <dxwtl:TreeListTextColumn Caption="Country" FieldName="Name" VisibleIndex="0">
                                                    <CellStyle HorizontalAlign="Left">
                                                    </CellStyle>
                                                </dxwtl:TreeListTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedNode="True" />
                                       </dxwtl:ASPxTreeList>
                
            </td>
        </tr>
    </table>
    
    </form>
</body>
</html>

