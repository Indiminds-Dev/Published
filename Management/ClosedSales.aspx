<%@ page language="C#" autoeventwireup="true" inherits="management_ClosedSales, App_Web_yq8u0p-o" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript">
     function SignOff()
    {
    window.parent.SignOff()
    }
        function height()
        {
                if(document.body.scrollHeight<=500)
                    window.frameElement.height = '500px';
                else
                    window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
        }
function ShowDetails(ProductType) 
{
  document.getElementById('GridDiv').style.display='none';
  document.getElementById('FrameDiv').style.display='';
  document.getElementById("ctl00_ContentPlaceHolder3_ASPxPageControl1_ShowDetails_").src=ProductType;

}

function ShowHistory(LeadId) 
{
    url="ShowHistory_Phonecall.aspx?id1="+LeadId;
    parent.OnMoreInfoClick(url,'History','900px','450px','N');
}
function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        document.location.href="crm_sales.aspx"; 
        }
        if ( name == "tab1")
        {
        document.location.href="frmDocument.aspx"; 
        }
        else if ( name == "tab2")
        {
        document.location.href="futuresale.aspx"; 
        }
        else if ( name == "tab3")
        {
        //document.location.href="ClosedSales.aspx"; 
        }
    }
    function All_CheckedChanged()
        {
            grid.PerformCallback()
        }
        function Specific_CheckedChanged()
        {
            grid.PerformCallback()
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="3" ClientInstanceName="page"
                            Width="100%">
                            <tabpages>
                <dxtc:TabPage Text="New Sales" Name="New Sales"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                 </dxtc:TabPage>
                 <dxtc:TabPage Text="Document Collection" Name="Document Collection"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Text="Future Sales" Name="Future Sales"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                 </dxtc:TabPage>
                 <dxtc:TabPage Text="Closed Sales" Name="Closed Sales"><ContentCollection>
                        <dxw:ContentControl runat="server">
        <div id="GridDiv" >
        <table width="100%">
            <tr>
                <td colspan="2" style="text-align:left">
                                <table >
                                       <tr>
                                            <td>
                                                <asp:RadioButton ID="Lrd" runat="server" GroupName="a" visible ="false"/>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label4" runat="server" Text="From Lead Data" Font-Size="X-Small" ForeColor="Blue" visible ="false"></asp:Label>
                                            </td>
                                            <td >
                                                <asp:RadioButton ID="Erd" runat="server" GroupName="a" Checked="True" visible ="false"/>
                                            </td>
                                            <td visible ="false">
                                                <asp:Label ID="Label5" runat="server" Text="From Existing Customer Data" Font-Size="X-Small" ForeColor="Blue" visible ="false"></asp:Label>
                                            </td>
                                       </tr>
                                    </table>
                     </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="ClosedSalesGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid"
                       
                        DataSourceID="ClosedSalesDataSource" Width="100%" OnCustomCallback="ClosedSalesGrid_CustomCallback">
                        <Columns>
                        
                            <dxwgv:GridViewDataTextColumn FieldName="Status" Visible="False" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="LeadId" VisibleIndex="1" Width="18%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Name" ReadOnly="True" VisibleIndex="2" Width="18%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Address" ReadOnly="True" VisibleIndex="3"
                                Width="18%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Phone" ReadOnly="True" VisibleIndex="4"
                                Width="18%">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ProductType" ReadOnly="True" Visible="false"
                                VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" Visible="False" VisibleIndex="4">
                                <EditFormSettings Visible="False" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Amount" Visible="False" VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Product" ReadOnly="True" Visible="True" Width ="30%"
                                VisibleIndex="4">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="NextVisit" VisibleIndex="5" Width="18%">
                            </dxwgv:GridViewDataTextColumn>
                           <%-- <dxwgv:GridViewDataTextColumn  VisibleIndex="6">
                                <DataItemTemplate>
                                    <a href="#" onclick="ShowDetails('<%#Eval("ProductType") %>')">Show</a>
                                </DataItemTemplate>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>--%>
                            <dxwgv:GridViewDataTextColumn  VisibleIndex="7" Caption="History">
                                <DataItemTemplate>
                                    <a href="#" onclick="ShowHistory('<%#Eval("LeadId") %>')">History</a>
                                   
                                </DataItemTemplate>
                            <EditFormSettings Visible="False" />
                        </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <Cell CssClass="gridcellleft">
                            </Cell>
                        </Styles>
                        <SettingsPager NumericButtonCount="20" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                           <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        
        </div>
        <div id="FrameDiv" style="display:none;" >
         <iframe width="100%" id="ShowDetails_" runat="server" height="800px" scrolling="no"></iframe>
        </div>
                        </dxw:ContentControl>
                        </ContentCollection>
                 </dxtc:TabPage> 
                  </tabpages>
                            <clientsideevents activetabchanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            
	                                            if(activeTab == Tab0)
	                                            {
	                                                disp_prompt('tab0');
	                                            }
	                                            if(activeTab == Tab1)
	                                            {
	                                                disp_prompt('tab1');
	                                            }
	                                            else if(activeTab == Tab2)
	                                            {
	                                                disp_prompt('tab2');
	                                            }
	                                            else if(activeTab == Tab3)
	                                            {
	                                                disp_prompt('tab3');
	                                            }
	                                            }">
                    </clientsideevents>
                            <contentstyle>
                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                    </contentstyle>
                            <loadingpanelstyle imagespacing="6px">
                    </loadingpanelstyle>
                            <tabstyle font-size="10px">
                    </tabstyle>
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="ClosedSalesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>">
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
