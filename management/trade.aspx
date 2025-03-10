<%@ page language="C#" autoeventwireup="true" inherits="management_trade, App_Web_kqhq1k1d" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Trade</title>
       <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
      <script language="javascript" type="text/javascript">
        function Disable(obj)
        {
            
            var gridview = document.getElementById('grdTradeProcess'); 
            var rCount = gridview.rows.length;
            
            if(rCount<10)
                rCount='0'+rCount;
            if(obj=='P')
            {
                document.getElementById("grdTradeProcess_ctl08_FirstPage").style.display='none';
                document.getElementById("grdTradeProcess_ctl08_PreviousPage").style.display='none';
                document.getElementById("grdTradeProcess_ctl08_NextPage").style.display='inline';
                document.getElementById("grdTradeProcess_ctl08_LastPage").style.display='inline';
            }
            else
            {
                document.getElementById("grdTradeProcess_ctl"+rCount+"_NextPage").style.display='none';
                document.getElementById("grdTradeProcess_ctl"+rCount+"_LastPage").style.display='none';
            }
        }
        function ForCancel()
        {
        
            var btn=document.getElementById('btncancel');
            btn.click(); 
            parent.document.getElementById("IFRAME_ForAllPages").contentWindow.DhtmlClose();
            
        }
        function ForRemaining()
        {
            
            var btnremaining=document.getElementById('btnremaining');
            btnremaining.click(); 
            parent.document.getElementById("IFRAME_ForAllPages").contentWindow.tradeprocess('remaining');
            parent.document.getElementById("IFRAME_ForAllPages").contentWindow.DhtmlClose();
            
        }
        function ForDefault()
        {
            var btndefault=document.getElementById('btndefault');
            btndefault.click();
            parent.document.getElementById("IFRAME_ForAllPages").contentWindow.tradeprocess('default');
            parent.document.getElementById("IFRAME_ForAllPages").contentWindow.DhtmlClose();
            
        }
       function ChangeRowColorgrid(rowID,rowNumber) 
        {             
            
            var gridview = document.getElementById('grdTradeProcess'); 
            var rCount = gridview.rows.length; 
            var rowIndex=1;
            var rowCount=0;
            if(rCount==18)
                 rowCount=15;
            else    
               rowCount=rCount-2;
            if(rowNumber>15 && rCount<18)
                rowCount=rCount-3;
            for (rowIndex; rowIndex<=rowCount; rowIndex++) 
            { 
                var rowElement = gridview.rows[rowIndex]; 
                rowElement.style.backgroundColor='#FFFFFF'
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
    <div>
       <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr align="left">
            <td colspan="2">
             <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
             
                            <ContentTemplate>
                            
                                <asp:GridView ID="grdTradeProcess" runat="server" Width="100%" BorderColor="CornflowerBlue"
                                    ShowFooter="True" AllowSorting="true"
                                    AutoGenerateColumns="False" BorderStyle="Solid" BorderWidth="2px" 
                                     AllowPaging="True" PageSize="5" ForeColor="#0000C0" OnRowCreated="grdTradeProcess_RowCreated"  >
                                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></FooterStyle>
                                    
                                    <Columns>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemStyle Wrap="false" BorderWidth="1px"   HorizontalAlign="Left"></ItemStyle>
                                            <HeaderStyle    HorizontalAlign="Center" Font-Bold="False" CssClass="gridstyleheight1">
                                            </HeaderStyle>
                                            <ItemTemplate >
                                                <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name")%>'></asp:Label>
                                            </ItemTemplate>
                                            
                                        </asp:TemplateField>
                                        
                                        <asp:TemplateField HeaderText="Code">
                                            <ItemStyle Wrap="false" BorderWidth="1px"    HorizontalAlign="Left"  ></ItemStyle>
                                            <HeaderStyle  HorizontalAlign="Left" Font-Bold="False" CssClass="gridstyleheight1" >
                                            </HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblCode" runat="server" Text='<%# Eval("Code")%>'   ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Group Code">
                                            <ItemStyle Wrap="false" BorderWidth="1px"  HorizontalAlign="Left"  ></ItemStyle>
                                            <HeaderStyle   HorizontalAlign="Left" Font-Bold="False"  CssClass="gridstyleheight1">
                                            </HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSettNo" runat="server" Text='<%# Eval("GroupCode")%>'  ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                         <asp:TemplateField HeaderText="Brkg Setup" >
                                            <ItemStyle Wrap="false" BorderWidth="1px"    HorizontalAlign="Left"  ></ItemStyle>
                                            <HeaderStyle HorizontalAlign="Left" Font-Bold="False"  CssClass="gridstyleheight1">
                                            </HeaderStyle>
                                            <ItemTemplate>
                                                <asp:Label ID="lblOrderNo" runat="server" Text='<%# Eval("BrkgSetUp")%>'  ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        
                                       
                                         
                                    </Columns>
                                  
                                    <PagerTemplate>
                                        <table>
                                            <tr>
                                                <td colspan="10">
                                                    <asp:LinkButton ID="FirstPage" runat="server" Font-Bold="true" CommandName="First"
                                                        OnCommand="NavigationLink_Click" Text="[First Page]"> </asp:LinkButton>
                                                    <asp:LinkButton ID="PreviousPage" runat="server" Font-Bold="true" CommandName="Prev"
                                                        OnCommand="NavigationLink_Click" Text="[Previous Page]">  </asp:LinkButton>
                                                    <asp:LinkButton ID="NextPage" runat="server" Font-Bold="true" CommandName="Next"
                                                        OnCommand="NavigationLink_Click" Text="[Next Page]">
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="LastPage" runat="server" Font-Bold="true" CommandName="Last"
                                                        OnCommand="NavigationLink_Click" Text="[Last Page]">
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </table>
                                    </PagerTemplate>
                                    <RowStyle BackColor="White" ForeColor="#330099" BorderColor="#BFD3EE" BorderStyle="Double"
                                        BorderWidth="1px"></RowStyle>
                                    <EditRowStyle BackColor="#E59930"></EditRowStyle>
                                    <SelectedRowStyle BackColor="#D1DDF1" ForeColor="#333333" Font-Bold="True"></SelectedRowStyle>
                                    <PagerStyle ForeColor="White" HorizontalAlign="Center"></PagerStyle>
                                    <HeaderStyle ForeColor="Black" BorderWidth="1px" CssClass="EHEADER" BorderColor="AliceBlue"
                                        Font-Bold="False"></HeaderStyle>
                                </asp:GridView>
                                <asp:HiddenField ID="CurrentPage" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalPages" runat="server"></asp:HiddenField>
                                <asp:HiddenField ID="TotalClient" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
            </td>
          
        </tr>
        <tr>  <td style="display:none;">
                <asp:Button ID="btncancel" runat="server" Text="btncancel" OnClick="btncancel_Click"/> 
                 <asp:Button ID="btnremaining" runat="server" Text="btnremaining" OnClick="btnremaining_Click" />
                   <asp:Button ID="btndefault" runat="server" Text="btndefault" OnClick="btndefault_Click" />
                         
            </td>
   </tr>
        <tr id="tr_filter">
      
            <td>
            <br />
                <a href="#" style="font-weight: bold; color: Blue" onclick="javascript:ForCancel();">1.&nbsp Cancel Trade Processing</a>
                <br /> <br />
                 <a href="#" style="font-weight: bold; color: Blue" onclick="javascript:ForRemaining();">2.&nbsp Generate For Remaining Clients</a>
                   <br /> <br />
                  <a href="#" style="font-weight: bold; color: Blue" onclick="javascript:ForDefault();" >3.&nbsp Generate as per Default Brokerage Setup</a>
                  </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
