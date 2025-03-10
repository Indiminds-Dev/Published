<%@ page language="C#" autoeventwireup="true" inherits="management_sales_Stotal, App_Web__y0k_erv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>

    <script language="javascript" type="text/javascript">
        function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        //document.location.href="sales_Stotal.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="sales_Sconveyence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="sales_Stravelling.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="sales_Slodging.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="sales_Sfooding.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="sales_SbusinessP.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="sales_Sother.aspx"; 
        }
        
    }
    function OnCityChanged(cmbState) 
    {
        grid.GetEditor("expnd_TArea1").PerformCallback(cmbState.GetValue().toString());
    }
    function OnCityChanged1(cmbState1) 
    {
        grid.GetEditor("expnd_TArea2").PerformCallback(cmbState1.GetValue().toString());
    }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="width: 100%">
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="page"
                            Font-Size="10px">
                            <TabPages>
                                <dxtc:TabPage Text="Total Expenses" Name="Total">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <dxwgv:ASPxGridView ID="gridTotal" Width="100%" runat="server" >
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Total" Caption="Total" VisibleIndex="0">
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="ConvenExp" Caption="Conveyence" VisibleIndex="1">
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="TravExp" Caption="Travelling" VisibleIndex="2">
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="LodgingExp" Caption="Lodging" VisibleIndex="3">
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="FoodingExp" Caption="Fooding" VisibleIndex="4">
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="BpExp" Caption="Business Promotion" VisibleIndex="5">
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="OtherExp" Caption="Others" VisibleIndex="6">
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                                
                                                <Styles >
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <StylesEditors>
                                                    <ProgressBar Height="25px">
                                                    </ProgressBar>
                                                </StylesEditors>
                                            </dxwgv:ASPxGridView>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="Conveyence" Name="Conveyence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Travelling" Text="Travelling">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Lodging" Text="Lodging">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Fooding" Text="Fooding">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Business Processing" Text="Business Processing">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Others" Text="Others">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                            </TabPages>
                            <ClientSideEvents ActiveTabChanged="function(s, e) {
	                                            var activeTab   = page.GetActiveTab();
	                                            var Tab0 = page.GetTab(0);
	                                            var Tab1 = page.GetTab(1);
	                                            var Tab2 = page.GetTab(2);
	                                            var Tab3 = page.GetTab(3);
	                                            var Tab4 = page.GetTab(4);
	                                            var Tab5 = page.GetTab(5);
	                                            var Tab6 = page.GetTab(6);
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
	                                            else if(activeTab == Tab4)
	                                            {
	                                                disp_prompt('tab4');
	                                            }
	                                            else if(activeTab == Tab5)
	                                            {
	                                                disp_prompt('tab5');
	                                            }
	                                            else if(activeTab == Tab6)
	                                            {
	                                                disp_prompt('tab6');
	                                            }
	                                            }"></ClientSideEvents>
                            <ContentStyle>
                                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                            </ContentStyle>
                            <LoadingPanelStyle ImageSpacing="6px">
                            </LoadingPanelStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
