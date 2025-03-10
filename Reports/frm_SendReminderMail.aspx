<%@ page language="C#" autoeventwireup="true" inherits="Reports_frm_SendReminderMail, App_Web_x3w6ygwt" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
      function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
          function SelectAll(id) 
        {
            var frm = document.forms[0];
            var val;
            for (i=0;i<frm.elements.length;i++) 
            {
                if (frm.elements[i].type == "checkbox") 
                {  
                    if(val!='')
                        frm.elements[i].checked = document.getElementById(id).checked;
                }
            }
        } 
        function SelectAllCheckboxes(spanChk){

   // Added as ASPX uses SPAN for checkbox
   var oItem = spanChk.children;
   var theBox= (spanChk.type=="checkbox") ? 
        spanChk : spanChk.children.item[0];
   xState=theBox.checked;
   elm=theBox.form.elements;

   for(i=0;i<elm.length;i++)
     if(elm[i].type=="checkbox" && 
              elm[i].id!=theBox.id)
     {
       //elm[i].click();
       if(elm[i].checked!=xState)
         elm[i].click();
       //elm[i].checked=xState;
     }
 } 
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
        </asp:ScriptManager>
        <table class="TableMain100">
            <tr>
                <td>
                    <table>
                        <tr>
                            <td style="width: 10%">
                                <asp:Label ID="Label1" runat="server" Text="From:" CssClass="mylabel1"></asp:Label>
                            </td>
                            <td>
                                <dxe:ASPxDateEdit ID="AspxFromdate" runat="server" EditFormat="custom" UseMaskBehavior="True">
                                    <buttonstyle width="13px">
                        </buttonstyle>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="To:" CssClass="mylabel1"></asp:Label>
                            </td>
                            <td>
                                <dxe:ASPxDateEdit ID="AspxTodate" runat="server" EditFormat="custom" UseMaskBehavior="True">
                                    <buttonstyle width="13px">
                        </buttonstyle>
                                </dxe:ASPxDateEdit>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="right">
                    <asp:Button ID="btnSubmit" runat="server" Text="Show" CssClass="btnUpdate" OnClick="btnSubmit_Click" />
                </td>
                <td>
                    <asp:Button ID="btnSendMail" runat="server" Text="Set Email" CssClass="btnUpdate"
                        OnClick="btnSendMail_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:Panel ID="Panel1" runat="server" Height="450px" ScrollBars="Vertical">
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <asp:GridView ID="grdMainGrid" runat="server" CssClass="gridcellleft" Width="100%"
                                                ForeColor="#333333" PageSize="20" AllowPaging="True" BorderColor="#507CD1" BorderWidth="1px"
                                                GridLines="None" CellPadding="4" AutoGenerateColumns="false" OnPageIndexChanging="grdMainGrid_PageIndexChanging">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                                                <EditRowStyle BackColor="#2461BF" />
                                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                <AlternatingRowStyle BackColor="White" />
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Sel">
                                                        <HeaderTemplate>
                                                            <input id="chkAll" runat="server" type="checkbox" onclick="javascript:SelectAllCheckboxes(this);" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkSel" runat="Server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Product">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProduct" runat="server" Text='<%# Eval("product") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Issue Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblIdate" runat="server" Text='<%# Eval("IssueDate") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Payment Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPdate" runat="server" Text='<%# Eval("PaymentDate") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Policy No">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPolicyNo" runat="server" Text='<%# Eval("trn_policyno") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Policy Amt">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPolicyAmt" runat="server" Text='<%# Eval("trn_premiumamt") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Refered By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRBy" runat="server" Text='<%# Eval("referedby") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="SPOC">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblspoc" runat="server" Text='<%# Eval("spoc") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                       <asp:TemplateField HeaderText="ProductId" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPID" runat="server" Text='<%# Eval("trn_scheme") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField Visible="False">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblId" runat="Server" Text='<%# Eval("Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                                <HeaderStyle CssClass="EHEADER" BorderColor="AliceBlue" BorderWidth="1px" Font-Bold="False"
                                                    ForeColor="Black" />
                                                <PagerSettings FirstPageText="First Page" NextPageText="Next Page" />
                                            </asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSubmit" EventName="Click"></asp:AsyncPostBackTrigger>
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
            </tr>
        </table>
    </form>
</body>
</html>
