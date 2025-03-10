<%@ page language="C#" autoeventwireup="true" inherits="Reports_ShowTransactionCommCurrency, App_Web_xpx38is4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Transaction</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    
        <div><div id="display" runat="server">
                            </div>
        <br />
            <asp:GridView ID="grdTransaction" runat="server" Width="100%" BorderColor="CornflowerBlue"
                AutoGenerateColumns="False" BorderStyle="Solid"
                BorderWidth="2px" CellPadding="4" ForeColor="#0000C0">
               
                <Columns>
                    <asp:TemplateField HeaderText="Tran ID">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblTranID" runat="server" Text='<%# Eval("TranId")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Type">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblType" runat="server" Text='<%# Eval("TranType")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblDate" runat="server" Text='<%# Eval("TranDate")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivered From">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblDeliveredFrom" runat="server" Text='<%# Eval("DeliveredFrom")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Settl.From ">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblSettNo" runat="server" Text='<%# Eval("SettlementNumberS")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delivered To">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblDeliveredTo" runat="server" Text='<%# Eval("DeliveredTo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Settl.To">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblSettTarget" runat="server" Text='<%# Eval("SettlementNumberT")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Slip Number">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblSlipNumber" runat="server" Text='<%# Eval("SlipNo")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remarks">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblRemarks" runat="server" Text='<%# Eval("Remarks")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                 
                </Columns>
               
               
               
               
                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                    Font-Bold="False"></HeaderStyle>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
