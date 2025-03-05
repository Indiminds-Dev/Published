<%@ page language="C#" autoeventwireup="true" inherits="Reports_ShowStocksCommCurrency, App_Web_yvy99of_" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Stock</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div><div id="display" runat="server">
                            </div>
        <br />
            <asp:GridView ID="grdStocks" runat="server" Width="100%" BorderColor="CornflowerBlue"
                AutoGenerateColumns="false" BorderStyle="Solid"
                BorderWidth="2px" CellPadding="4" ForeColor="#0000C0">
               
                <Columns>
                    <asp:TemplateField HeaderText="A/c Number">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblACName" runat="server" Text='<%# Eval("ACName")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Settlement">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblSettlement" runat="server" Text='<%# Eval("Settlement")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ISIN">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblICIN" runat="server" Text='<%# Eval("ICIN")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="right"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblQty" runat="server" Text='<%# Eval("Qty")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Pledge/Lock In">
                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="right"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblPledge" runat="server" Text='<%# Eval("Pledge")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Free Balance">
                        <ItemStyle BorderWidth="1px" HorizontalAlign="right"></ItemStyle>
                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                        <ItemTemplate>
                            <asp:Label ID="lblFreeBalance" runat="server" Text='<%# Eval("FreeBalance")%>'></asp:Label>
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
