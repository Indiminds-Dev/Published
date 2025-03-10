<%@ page language="C#" autoeventwireup="true" inherits="Reports_CustomerEmailList, App_Web_wt4jql-z" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
       function Pageload()
        {
           document.getElementById('ShowFilter').style.display="none";
           document.getElementById('tdsb').style.display="none";
           document.getElementById('tdName').style.display="none";
            document.getElementById('HideS').style.display="none";
           
        }
       function height()
        {
            if(document.body.scrollHeight>=650)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '650px';
            }
            window.frameElement.widht = document.body.scrollWidht;
        }
        
        function SearchEmail()
        {
         document.getElementById('ShowFilter').style.display="inline";
         document.getElementById('HideS').style.display="inline";
         document.getElementById('ShowS').style.display="none";
         ShowEmployeeFilterForm(' ');
        }
        
       function ShowEmployeeFilterForm(obj)
        {
          
        if(obj=='A')
        {
        
        
            document.getElementById('fromDate').style.display="inline";
            document.getElementById('toDate').style.display="inline";
            document.getElementById('tdName').style.display="none";
            document.getElementById('tdsb').style.display="none";
             document.getElementById('HideS').style.display="inline";
            document.getElementById('ShowS').style.display="none";
                   
        }
        if(obj=='S')
        {   
            
            document.getElementById('tdsb').style.display="inline";
            document.getElementById('tdName').style.display="inline";
            document.getElementById('fromDate').style.display="none";
            document.getElementById('toDate').style.display="none";
             document.getElementById('HideS').style.display="inline";
            document.getElementById('ShowS').style.display="none";
        }
    }
     function OnMoreInfoClick(keyValue) {
        
       var url='CustomerEmailDetails.aspx?id='+keyValue;
        parent.OnMoreInfoClick(url,"Email Details",'980px','520px',"Y");
   
    }

    </script>

</head>
<body style="font-family:Verdana;font-size:8pt;background-color:#DDECFE;">
    <form id="form1" runat="server">
        <div>
            <table width="100%">
                <tr id="ShowS">
                    <td>
                    <%--<asp:LinkButton ID="btnShow" runat="server"  Font-Bold="True" Font-Underline="True" ForeColor="Blue" OnClientClick="SearchEmail()">Show Search</asp:LinkButton>--%>
                      
                        <a href="javascript:void(0);" onclick="SearchEmail()">
                           Show Search</a>
                    </td>
                </tr>
                 <tr id="HideS">
                    <td>
                    <asp:LinkButton ID="btnHide" runat="server"   Font-Underline="True" ForeColor="Blue" OnClick="btnHide_Click">Hide Search</asp:LinkButton>
                      <%-- <asp:LinkButton ID="LinkButton1" runat="server"  Font-Bold="True" Font-Underline="True" ForeColor="Blue" OnClientClick="SearchEmail()">Show Search</asp:LinkButton>
                      <asp:LinkButton ID="LinkButton2" runat="server"  Font-Bold="True" Font-Underline="True" ForeColor="Blue" OnClick="btnHide_Click">Hide Search</asp:LinkButton>
                     <a href="javascript:void(0);" onclick="SearchEmail()">
                            Search Email</a>--%>
                    </td>
                </tr>
                <tr id="ShowFilter">
                    <td>
                         <table>
                            <tr>
                                                            
                                <td valign="bottom">
                                    
                                   <dxe:ASPxRadioButtonList ID="rbUser" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                        RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px">
                                        <Items>
                                            <dxe:ListEditItem Text="Date Wise" Value="A" />
                                            <dxe:ListEditItem Text="Subject Wise" Value="S" />
                                        </Items>
                                        <ClientSideEvents ValueChanged="function(s, e) {ShowEmployeeFilterForm(s.GetValue());}" />
                                        <Border BorderWidth="0px" />
                                    </dxe:ASPxRadioButtonList>
                                </td>
                                 <td id="fromDate">
                                    <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                        <DropDownButton Text="From Date">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td id="toDate">
                                    <dxe:ASPxDateEdit ID="txtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                        <DropDownButton Text="To Date">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td id="tdName">
                                    &nbsp;Subject:
                                </td>
                                <td id="tdsb">
                                    <asp:TextBox ID="txtSubject" runat="server" Width="220px" Font-Size="11px" Height="20px"></asp:TextBox>
                                </td>
                                 <td class="gridcellleft">
                                    <asp:Button ID="btnGetReport" runat="server" Text="Get Report" CssClass="btnUpdate"
                                        Height="19px" Font-Size="10px" OnClick="btnGetReport_Click" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                    <asp:Label ID="lbltxt" Text="" Visible="false" runat="server"></asp:Label>
                        <asp:GridView ID="grdGeneralTrial" runat="server" Width="100%" AllowPaging="true"
                            AutoGenerateColumns="false" BorderStyle="Solid" BorderWidth="2px" CellPadding="4"
                            PageSize="15" OnPageIndexChanging="grdGeneralTrial_PageIndexChanging">
                            <FooterStyle></FooterStyle>
                            <Columns>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                    <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("Emails_ID")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                  <asp:TemplateField HeaderText="Recipient Email" Visible="true">
                                    <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                    <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Eval("RecipientsEmailID")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject">
                                    <ItemStyle Wrap="False" HorizontalAlign="Left"></ItemStyle>
                                    <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblSubAccount" runat="server" Text='<%# Eval("Subject")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sent Date">
                                    <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                    <HeaderStyle Wrap="False" HorizontalAlign="left" Font-Bold="False"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblDebit" runat="server" Text='<%# Eval("SentDate")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                    <HeaderStyle Wrap="False" HorizontalAlign="left" Font-Bold="False"></HeaderStyle>
                                    <ItemTemplate>
                                        <asp:Label ID="lblCredit" runat="server" Text='<%# Eval("Status")%>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="More Info" Visible="true">
                                    <ItemStyle Wrap="False" HorizontalAlign="left"></ItemStyle>
                                    <HeaderStyle Wrap="False" HorizontalAlign="Left" Font-Bold="False"></HeaderStyle>
                                    <ItemTemplate>
                                       <%-- <asp:Label ID="lblID" runat="server" Text='<%# Eval("Emails_ID")%>'></asp:Label>--%>
                                     <a href="javascript:void(0);" onclick="OnMoreInfoClick('<%# Eval("Emails_ID")%>')">
                           More info..</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle></RowStyle>
                            <EditRowStyle></EditRowStyle>
                            <SelectedRowStyle></SelectedRowStyle>
                            <PagerStyle></PagerStyle>
                            <HeaderStyle></HeaderStyle>
                            <%--<AlternatingRowStyle BackColor="White"></AlternatingRowStyle>--%>
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
