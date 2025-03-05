<%@ page language="C#" autoeventwireup="true" inherits="management_MarginHoldback, App_Web_leuczwkw" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Margin/HoldBack</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="grdMarginHoldBack" runat="server" Width="100%" BorderColor="CornflowerBlue"
                ShowFooter="True" AllowSorting="true" AutoGenerateColumns="false" BorderStyle="Solid"
                BorderWidth="2px" CellPadding="4" ForeColor="#0000C0" >
                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                <Columns>
                    <asp:TemplateField HeaderText="Account Name">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblClient" runat="server" Text='<%# Eval("accname")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Scrip">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblScrip" runat="server" Text='<%# Eval("Scrip")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ISIN">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblisinno" runat="server" Text='<%# Eval("isinno")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Segment Name">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblsegmentname" runat="server" Text='<%# Eval("segmentname")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Right"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Qty")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle BackColor="#FFFFFF" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                    BorderWidth="1px"></RowStyle>
                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                    Font-Bold="False"></HeaderStyle>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
