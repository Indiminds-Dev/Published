<%@ page language="C#" autoeventwireup="true" inherits="management_frm_UserRecruitmentEmployee_Detail_popup, App_Web_kqhq1k1d" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Interview details</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE; text-align: center;" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <asp:GridView ID="GridCandi1" runat="server" CellPadding="4" ForeColor="#333333"
            GridLines="None" AutoGenerateColumns="false" BorderWidth="1px" BorderColor="#507CD1"
            PageSize="20" EmptyDataText="No Data Found!">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <EditRowStyle BackColor="#2461BF" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle Font-Bold="False" ForeColor="Black" CssClass="EHEADER" BorderColor="AliceBlue" />
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Interview Date">
                    <ItemTemplate>
                        <asp:Label ID="lblLastInterview" runat="server" Text='<%# Eval("InterviewDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Interviewer">
                    <ItemTemplate>
                        <asp:Label ID="lblInterviewId1" runat="server" Text='<%# Eval("Interviewer") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Result">
                    <ItemTemplate>
                        <asp:Label ID="lblResult" runat="server" Text='<%# Eval("Result") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Next Interview Date">
                    <ItemTemplate>
                        <asp:Label ID="lblNextInterview" runat="server" Text='<%# Eval("NextInterviewDate") %> '></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Next Interviewer">
                    <ItemTemplate>
                        <asp:Label ID="lblInterviewId2" runat="server" Text='<%# Eval("NextInterviewer") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Next Interview Place">
                    <ItemTemplate>
                        <asp:Label ID="lblInterviewId3" runat="server" Text='<%# Eval("NextInterviewPlace") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <input id="Submit1" type="submit" value="Close" onclick="window.close();" />
    </form>
</body>
</html>
