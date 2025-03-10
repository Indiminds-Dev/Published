<%@ page language="C#" autoeventwireup="true" inherits="management_Frm_RiskProfileMember, App_Web_udicbieo" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Risk Profile Member</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=700)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '700px';
        window.frameElement.Width = document.body.scrollWidth;
    }
   function ShowHideFilter(obj)
    {
           grid.PerformCallback(obj);
    } 
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>

            <script language="javascript" type="text/javascript">
                  var prm = Sys.WebForms.PageRequestManager.getInstance(); 
                   prm.add_initializeRequest(InitializeRequest); 
                   prm.add_endRequest(EndRequest); 
                   var postBackElement; 
                   function InitializeRequest(sender, args) 
                   { 
                      if (prm.get_isInAsyncPostBack()) 

                      args.set_cancel(true); 
                      postBackElement = args.get_postBackElement(); 
                      $get('UpdateProgress1').style.display = 'block'; 
                         
                   } 
                   function EndRequest(sender, args) 
                   {
                     $get('UpdateProgress1').style.display = 'none';                         
                   } 
            </script>

            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Risk Profile Member</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td class="gridcellleft">
                                    Type:
                                </td>
                                <td>
                                    <asp:DropDownList ID="cmbType" runat="server" Width="100px" OnSelectedIndexChanged="cmbType_SelectedIndexChanged"
                                        AutoPostBack="true">
                                        <asp:ListItem Text="--All--" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="Risk" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Delivery" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Fund" Value="3"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td class="gridcellleft">
                                    Profile:
                                </td>
                                <td>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:DropDownList ID="cmbProfile" Width="250px" runat="server">
                                                <asp:ListItem Text="--All--" Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="cmbType" EventName="SelectedIndexChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </td>
                                <td>
                                    <asp:Button ID="btnSave" runat="server" TabIndex="3" Text="Show" CssClass="btnUpdate"
                                        OnClick="btnSave_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="btnExport" runat="server" TabIndex="4" Text="Export to Excel" CssClass="btnUpdate"
                                        OnClick="btnExport_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td id="Td1" align="left">
                                    <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                        Show Filter</span></a> || <a href="javascript:ShowHideFilter('All');"><span style="color: #000099;
                                            text-decoration: underline">All Records</span></a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <dxwgv:ASPxGridView ID="gridStatus" ClientInstanceName="grid" Width="100%" KeyFieldName="ProfileMember_ID"
                                    runat="server" AutoGenerateColumns="False" OnCustomCallback="gridStatus_CustomCallback">
                                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                                    <Styles>
                                        <FocusedRow CssClass="gridselectrow" BackColor="#FCA977">
                                        </FocusedRow>
                                        <FocusedGroupRow CssClass="gridselectrow" BackColor="#FCA977">
                                        </FocusedGroupRow>
                                    </Styles>
                                    <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                        <FirstPageButton Visible="True">
                                        </FirstPageButton>
                                        <LastPageButton Visible="True">
                                        </LastPageButton>
                                    </SettingsPager>
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Visible="False" FieldName="ProfileMember_ID" Caption="ID">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Visible="true" FieldName="MEMBER_NAME" Caption="Member"
                                            VisibleIndex="1">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="PROFILE_TYPE" Caption="Type">
                                            <CellStyle CssClass="gridcellleft" Wrap="True">
                                            </CellStyle>
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="PROFILE_NAME" Caption="Profile Name">
                                            <CellStyle CssClass="gridcellleft" Wrap="True">
                                            </CellStyle>
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="ProfileMember_Code" Caption="Profile Code">
                                            <CellStyle CssClass="gridcellleft" Wrap="True">
                                            </CellStyle>
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="ProfileMember_DateFrom"
                                            Caption="From Date">
                                            <CellStyle CssClass="gridcellleft" Wrap="True">
                                            </CellStyle>
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="ProfileMember_DateTo" Caption="Until Date">
                                            <CellStyle CssClass="gridcellleft" Wrap="True">
                                            </CellStyle>
                                            <EditFormSettings Visible="False"></EditFormSettings>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" />
                                    <StylesEditors>
                                        <ProgressBar Height="25px">
                                        </ProgressBar>
                                    </StylesEditors>
                                    <Settings ShowHorizontalScrollBar="True" />
                                </dxwgv:ASPxGridView>
                                <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
                                </dxwgv:ASPxGridViewExporter>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div2' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50px; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
