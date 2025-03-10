<%@ page language="C#" autoeventwireup="true" inherits="management_frmLeadGenerationReport, App_Web_-k9nslwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="CrystalDecisions.Web, Version=10.2.3600.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dxm" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dxwtl" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList.Export" TagPrefix="dxwtl" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
      <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
      <script language="javascript" type="text/javascript">
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
</script>

    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
    <link href="/aspnet_client/System_Web/2_0_50727/CrystalReportWebFormViewer3/css/default.css"
        rel="stylesheet" type="text/css" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <script type="text/javascript" language="javascript">
    function AtTheTimePageLoad()
    {
        FieldName='cmbBranch';
    }
</script>
    <table class="TableMain100">
        <tr>
            <td class="EHEADER" colspan="4" style="text-align:center;">
                <strong><span style="color: #000099">Lead Generation Report</span></strong>
            </td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">From Date:</span>
            </td>
            <td class="gridcellleft">
            <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <DropDownButton Text="From">
                                            </DropDownButton>
                <ValidationSettings ErrorText="Required." Display="Dynamic" ValidationGroup="A">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
                                        </dxe:ASPxDateEdit>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtFromDate"
                    Display="Dynamic" ErrorMessage="Required!" ValidationGroup="A"></asp:RequiredFieldValidator><%-- <asp:TextBox id="txtFromDate" tabIndex="19" runat="server" Width="229px" Font-Size="10px"></asp:TextBox>&nbsp;<asp:Image id="imgFromDate" runat="server" ImageUrl="~/images/calendar.jpg"></asp:Image>--%></td>
            <td class="gridcellright">
                <span style="color: #000099">To Date:</span>
            </td>
            <td class="gridcellleft">
            <dxe:ASPxDateEdit ID="txtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" OnDateChanged="txtToDate_DateChanged">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                            <DropDownButton Text="To">
                                            </DropDownButton>
                <ValidationSettings ErrorText="Required." Display="Dynamic" ValidationGroup="A">
                    <RequiredField IsRequired="True" />
                </ValidationSettings>
                                        </dxe:ASPxDateEdit>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtToDate"
                    Display="Dynamic" ErrorMessage="Required!" ValidationGroup="A"></asp:RequiredFieldValidator><%-- <asp:TextBox id="txtToDate" tabIndex="19" runat="server" Width="229px" Font-Size="10px"></asp:TextBox>&nbsp;<asp:Image id="imgToDate" runat="server" ImageUrl="~/images/calendar.jpg"></asp:Image>--%></td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">Select Branch:</span>
            </td>
            <td class="gridcellleft">
                <asp:ListBox ID="lst_branch" runat="server" BackColor="Transparent" 
                    SelectionMode="Multiple" Width="250px" Font-Size="10px" ValidationGroup="A"></asp:ListBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="lst_branch"
                    ErrorMessage="Required!" ValidationGroup="A"></asp:RequiredFieldValidator></td>
            <td class="gridcellright" style="width: 99px">
                <span style="color: #000099">Select Department:</span>
            </td>
            <td class="gridcellleft">
                <asp:ListBox ID="lst_department" runat="server" BackColor="Transparent" 
                    SelectionMode="Multiple" Width="250px" Font-Size="10px" ValidationGroup="A"></asp:ListBox></td>
        </tr>
        <tr>
            <td class="gridcellright">
                <span style="color: #000099">Select User:</span>
            </td>
            <td class="gridcellleft">
                <asp:ListBox ID="lst_user" runat="server" BackColor="Transparent" 
                    SelectionMode="Multiple" Width="250px" Font-Size="10px" ValidationGroup="A"></asp:ListBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lst_user"
                    ErrorMessage="Required!" ValidationGroup="A"></asp:RequiredFieldValidator></td>
            <td class="gridcellright">
                
            </td>
            <td class="gridcellleft" style="vertical-align:bottom">
                <asp:Button ID="btnGetReport" runat="server" Text="Get Report"  CssClass="btnUpdate" Height="19px" OnClick="btnGetReport_Click" Font-Size="10px" ValidationGroup="A"/></td>
        </tr>
        
        <tr>
            <td colspan="4" align="center">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true"
                    DisplayGroupTree="False"  />
            </td>
        </tr>
        <tr>
             <td colspan="4">
                <asp:GridView ID="GridLeadReport" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" BorderWidth="1px" ShowFooter="True" BorderColor="#507CD1"  PageSize="350" Width="100%" AutoGenerateColumns="false" OnRowDataBound="GridLeadReport_RowDataBound" CssClass="gridcellleft" Visible="False">
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                    <EditRowStyle BackColor="#2461BF" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <HeaderStyle  Font-Bold="False" ForeColor="Black" CssClass="EHEADER" BorderColor="AliceBlue" BorderWidth="1px"  />
                    <AlternatingRowStyle BackColor="White" />
                    <EmptyDataRowStyle Wrap="True" />
                    <Columns>
                        <asp:BoundField DataField="Branch" HeaderText="Branch" />
                        <asp:BoundField DataField="Department" HeaderText="Department" />
                        <asp:BoundField DataField="user_name" HeaderText="UserName" />
                        <asp:TemplateField HeaderText="No" >
                            <ItemTemplate >
                                    <%#Eval("No")%>
                            </ItemTemplate>
                            <FooterTemplate >
                            <asp:Label ID="Label1" Text ="Total Leads    "  runat ="server" ></asp:Label>
                                <%#getTotalOfLead().ToString() + " "%>
                            </FooterTemplate>
                            <FooterStyle Font-Bold="True" /> 
                        </asp:TemplateField>
                                  
                    </Columns>
                </asp:GridView>
             </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
