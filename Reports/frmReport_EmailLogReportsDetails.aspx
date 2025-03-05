<%@ page language="C#" autoeventwireup="true" inherits="Reports_frmReport_EmailLogReportsDetails, App_Web_yvy99of_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100" style="border: solid 1px white;" cellpadding="2" cellspacing="3">
                <tr>
                    <td align="center">
                        <table width="100%" style="border: solid 1px white;">
                            <tr>
                                <td style="font-size: 12px; font-weight: bold;" width="20px">
                                    <asp:Label ID="lblType" runat="server"></asp:Label>:</td>
                                <td align="left">
                                    <asp:Label ID="lblName" runat="server"></asp:Label><asp:Label ID="lblEmail" runat="server"></asp:Label><br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table width="100%" style="border: solid 1px white;">
                            <tr>
                                <td style="font-size: 12px; font-weight: bold;" width="20px">
                                    Subject:</td>
                                <td align="left" >
                                    <asp:Label ID="lblSub" runat="server"></asp:Label><br />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table width="100%" style="border: solid 1px white;">
                            <tr>
                                <td style="font-size: 12px; font-weight: bold;" width="20px" valign="top">
                                    Content:</td>
                                <td align="left" style="background-color:White;">
                                    <asp:Label ID="lblContent" runat="server"></asp:Label></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="font-size: 12px; font-weight: bold;" valign="top">
                        Attachments:
                    </td>
                </tr>
                <tr>
                    <tr>
                        <td align="center">
                            <dxwgv:ASPxGridView ID="AttachGrid" runat="server" AutoGenerateColumns="False" KeyFieldName="EmailAttachment_ID"
                                Width="100%" ClientInstanceName="grid">
                                <Settings />
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="EmailAttachment_Path" Caption="Attachments"
                                        ReadOnly="True" VisibleIndex="0">
                                        <CellStyle HorizontalAlign="Left">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="ADD/Modify " FieldName="formID" ReadOnly="True"
                                        VisibleIndex="1">
                                        <DataItemTemplate>
                                            <a href='ViewAttachment.aspx?id=<%#Eval("EmailAttachment_Path") %>' target="_blank">
                                                View</a>
                                        </DataItemTemplate>
                                        <EditFormSettings Visible="False" />
                                        <CellStyle HorizontalAlign="Left">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <HeaderTemplate>
                                            View
                                        </HeaderTemplate>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                                <Styles>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                    <FocusedGroupRow CssClass="gridselectrow">
                                    </FocusedGroupRow>
                                    <FocusedRow CssClass="gridselectrow">
                                    </FocusedRow>
                                </Styles>
                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                            </dxwgv:ASPxGridView>
                            <%-- <asp:Label ID="lblAtt" runat="server"></asp:Label>--%>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: 12px; font-weight: bold;" valign="top">
                            Email Delivery Log:
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="height: 20px">
                            <dxwgv:ASPxGridView ID="logGrid" runat="server" AutoGenerateColumns="False" KeyFieldName="EmailLog_ID"
                                Width="100%" ClientInstanceName="grid">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn FieldName="EmailLog_SentDateTime" Caption="Sent DateTime"
                                        ReadOnly="True" Width="110px" VisibleIndex="0">
                                        <CellStyle HorizontalAlign="Left">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="EmailLog_DeliveryStatus" Caption="Status"
                                        Width="60px" ReadOnly="True" VisibleIndex="1">
                                        <CellStyle HorizontalAlign="Left">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="EmailLog_Reason" Caption="Reason" VisibleIndex="2">
                                        <CellStyle HorizontalAlign="Left" Wrap="true">
                                        </CellStyle>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />
                                <Styles>
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                    <FocusedGroupRow CssClass="gridselectrow">
                                    </FocusedGroupRow>
                                    <FocusedRow CssClass="gridselectrow">
                                    </FocusedRow>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                </Styles>
                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <Settings />
                            </dxwgv:ASPxGridView>
                            <%-- <asp:Label ID="lblLog" runat="server"></asp:Label>--%>
                        </td>
                    </tr>
            </table>
        </div>
    </form>
</body>
</html>
