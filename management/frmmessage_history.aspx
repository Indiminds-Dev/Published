<%@ page language="C#" autoeventwireup="true" inherits="management_frmmessage_history, App_Web_6_wayyot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>:: Export ::</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">
    // <!CDATA[

    function CloseWin() 
    
    {
    parent.editwin.close();
    }

    // ]]>
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
    <div>
        <table class="TableMain100">
            <tr>
                <td>
                    <table class="TableMain100">
                        <tr>
                            <td colspan="4">
                                <asp:Label ID="Label2" runat="server" Text="Select File Type For Export  Data :" CssClass="mylabel1" Width="199px" Height="18px"></asp:Label>
                                <asp:DropDownList ID="DropDownList2" runat="server" Width="132px">
                                    <asp:ListItem Value="0">select File Type</asp:ListItem>
                                    <asp:ListItem Value="1">Excel</asp:ListItem>
                                    <asp:ListItem Value="2">Word File</asp:ListItem>
                                    <asp:ListItem Value="3">Text File</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="Button4" runat="server" Text="Save It" Width="65px" CssClass="btnUpdate" OnClick="Button4_Click" />
                                <asp:Button ID="Button2" runat="server" Text="Print" Width="50px" CssClass="btnUpdate" OnClick="Button2_Click"/>
                                <input id="Button1" style="width: 65px" type="button" value="Close" class="btnUpdate" onclick="CloseWin();" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <asp:Panel ID="pnl" runat="Server">
                                <asp:Label ID="lbl" runat="Server" ForeColor="Navy" Font-Bold="true"></asp:Label>
                                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" BorderWidth="1px" BorderColor="#507CD1" OnRowDataBound="GridView1_RowDataBound">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <HeaderStyle  Font-Bold="false" ForeColor="black" CssClass="EHEADER" BorderColor="AliceBlue" BorderWidth="1px"  />
                                        <AlternatingRowStyle BackColor="White" />
                                </asp:GridView></asp:Panel>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
