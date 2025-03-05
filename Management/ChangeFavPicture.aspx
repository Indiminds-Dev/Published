<%@ page language="C#" autoeventwireup="true" inherits="management_ChangeFavPicture, App_Web_njtlujlb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Change Favourite Picture</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
        function PicChange(obj)
        {
            var URL;
            URL='../management/ShowPicture.aspx?id='+obj;
            parent.OnMoreInfoClick(URL,"Change Picture",'480px','300px',"Y");
            //editwin=dhtmlmodal.open("Editbox", "iframe", URL,"Change Picture" , "width=480px,height=300px,center=1,resize=1,scrolling=2,top=500", "recal")                     
        }  
        function callback()
        {
            document.getElementById('btnChangePic').click();
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

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="True" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Manage Favourite Menu</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:GridView ID="grdUpdateFavMenu" runat="server" DataKeyNames="FavouriteMenu_ID"
                                    CssClass="gridcellleft" CellPadding="4" ForeColor="#333333" GridLines="None"
                                    BorderWidth="1px" BorderColor="#507CD1" Width="100%" AutoGenerateColumns="False"
                                    ShowFooter="True" OnRowDeleting="grdUpdateFavMenu_RowDeleting">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <RowStyle BackColor="#EFF3FB" BorderWidth="1px" />
                                    <EditRowStyle BackColor="#E59930" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <HeaderStyle Font-Bold="False" ForeColor="Black" CssClass="EHEADER" BorderColor="AliceBlue"
                                        BorderWidth="1px" />
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="RowID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRowID" runat="server" Text='<%# Eval("FavouriteMenu_ID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Menu Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblMainAccount" runat="server" Text='<%# Eval("mnu_menuname") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Image">
                                            <ItemTemplate>
                                                <asp:Image ID="lblImage" runat="server" ImageUrl='<%# Eval("FavouriteMenu_Image") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Change Picture">
                                            <ItemTemplate>
                                                <a href="javascript:PicChange('<%# Eval("FavouriteMenu_ID")%>')">Change Picture</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remove">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete"
                                                    OnClientClick='javascript:return confirm("Do You Want To Remove This Favourite Menu ??");'
                                                    Text="Remove"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnChangePic" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr style="display: none">
                    <td>
                        <asp:Button ID="btnChangePic" runat="server" Text="Button" OnClick="btnChangePic_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
