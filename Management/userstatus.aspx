<%@ page language="C#" autoeventwireup="true" inherits="management_userstatus, App_Web_jdrimxnc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Status</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script language="javascript" type="text/javascript">
        
          function height()
            {
            
                if(document.body.scrollHeight>=500)
                    window.frameElement.height = document.body.scrollHeight;
                else
                    window.frameElement.height = '800px';
                window.frameElement.Width = document.body.scrollWidth;                
            }
            function Page_Load()
            {
                document.getElementById('trMessage').style.display='none';
                height();
            }
            function ForMessage()
            {
                document.getElementById('trMessage').style.display='inline';
            }
            document.body.style.cursor = 'pointer'; 
         var oldColor = '';
	    function ChangeRowColor(rowID,rowNumber) 
        { 
            var gridview = document.getElementById('grdActive'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            if(rCount==28)
                 rowCount=25;
            else    
               rowCount=rCount-2;
            if(rowNumber>25 && rCount<28)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF';
            }
            var color = document.getElementById(rowID).style.backgroundColor;
            if(color != '#ffe1ac') 
            {
                oldColor = color;
            }
            if(color == '#ffe1ac') 
            {
                document.getElementById(rowID).style.backgroundColor = oldColor;
            }
            else 
                document.getElementById(rowID).style.backgroundColor = '#ffe1ac'; 

        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
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
                <td>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                        <ProgressTemplate>
                            <div id='Div2' style='position: absolute; font-family: arial; font-size: 30; background-color: white;
                                layer-background-color: white;'>
                                <table border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
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
            <tr>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <asp:GridView ID="grdActive" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                ShowFooter="True" AllowSorting="true" AutoGenerateColumns="false" BorderStyle="Solid"
                                BorderWidth="2px" CellPadding="4" ForeColor="#0000C0" OnSorting="grdActive_Sorting" OnRowCreated="grdActive_RowCreated">
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                <Columns>
                                    <asp:TemplateField HeaderText="ID" Visible="false">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblID" runat="server" Text='<%# Eval("user_id")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="LogIN ID" SortExpression="user_loginid">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Center" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblLogINID" runat="server" Text='<%# Eval("user_loginid")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name" SortExpression="UserName">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("UserName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Activity" SortExpression="user_activity">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lbluseractivity" runat="server" Text='<%# Eval("user_activity")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Segment" SortExpression="seg_name">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblsegname" runat="server" Text='<%# Eval("seg_name")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Since" SortExpression="Since">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblSince" runat="server" Text='<%# Eval("Since")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Duration(MIN)" SortExpression="Duration">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDuration" runat="server" Text='<%# Eval("Duration")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="IP Address" SortExpression="user_lastIP">
                                        <ItemStyle Font-Size="10px" BorderWidth="1px" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:Label ID="lblLastIP" runat="server" Text='<%# Eval("user_lastIP")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField  HeaderText="Send Message">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ChkDeliveryMsg" runat="server" onclick="ForMessage()" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Reset">
                                        <ItemStyle BorderWidth="1px" Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                        <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="ChkDelivery" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                    BorderWidth="1px"></RowStyle>
                                <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                    Font-Bold="False"></HeaderStyle>
                            </asp:GridView>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnMessage" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="btnRefresh" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="chkAll" EventName="Click" />
                            <asp:AsyncPostBackTrigger ControlID="UnChkAll" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                    <asp:Button ID="chkAll" runat="server" Text="Select All For Message" CssClass="btnUpdate" Height="21px" OnClick="chkAll_Click" Width="144px" />
                    <asp:Button ID="UnChkAll" runat="server" Text="DeSelect All For Message" CssClass="btnUpdate" Height="21px" OnClick="UnChkAll_Click" Width="166px" />
                </td>
            </tr>
            <tr id="trMessage">
                <td>
                    <table width="100%">
                        <tr>
                            <td style="width: 79px">
                                Message :
                            </td>
                            <td>
                                <asp:TextBox ID="txtMessage" runat="server" Height="81px" TextMode="MultiLine" Width="729px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnMessage" runat="server" Text="Send Message" CssClass="btnUpdate"
                                    Height="25px" Width="96px" OnClick="btnMessage_Click" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="height: 27px">
                    <asp:Button ID="btnSave" runat="server" Text="Reset" CssClass="btnUpdate" Height="25px"
                        Width="96px" OnClick="btnSave_Click" />
                    <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="btnUpdate" Height="25px"
                        Width="96px" OnClick="btnRefresh_Click" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
