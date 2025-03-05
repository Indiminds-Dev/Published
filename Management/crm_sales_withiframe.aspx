<%@ page language="C#" autoeventwireup="true" inherits="management_crm_sales_withiframe, App_Web_1tsvl7g6" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Src="Headermain.ascx" TagName="Headermain" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" language ="Javascript">
function ShowDetails(ProductTypePath) 
{
  
  document.getElementById('GridDiv').style.display='none';
  document.getElementById('FrameDiv').style.display='inline';
  document.getElementById("ASPxPageControl1_ShowDetails_").style.display ='inline';
  document.getElementById("ASPxPageControl1_ShowDetails_").src=ProductTypePath;
  
  
}
function AfterSave()
{
     
     document.getElementById('GridDiv').style.display='inline';
     document.getElementById('FrameDiv').style.display='none';
     document.getElementById("ASPxPageControl1_ShowDetails_").style.display ='none';
     height();
}

//function ShowHistory(LeadId) 
//{
//  var width=800;
//  var height=300;
//  var x=(screen.availHeight-height)/2;
//  var y=(screen.availWidth-width)/2;
//  window.open("ShowHistory_Phonecall.aspx?id1="+LeadId,'welcome','width='+ width +',height=' + height + ',top='+x+',left='+y+',menubar=no,status=no,location=no,toolbar=no,scrollbars=yes');
//}
function disp_prompt(name)
    {
        
        if ( name == "tab0")
        {
        //document.location.href="crm_sales.aspx"; 
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
        document.location.href="ClosedSales.aspx"; 
        }
    }
    function All_CheckedChanged()
        {
            grid.PerformCallback();
        }
        function Specific_CheckedChanged()
        {
            grid.PerformCallback();
        }
    function height()
    {
        window.frameElement.height = document.body.scrollHeight;
        window.frameElement.Width = document.body.scrollWidth;
     }
 function CallForms(val)
    {
       
       parent.CallForms1(val);
      
    }
    function ClosingDHTML()
    {
       
        document.getElementById("ASPxPageControl1_ShowDetails_").contentWindow.ClosingDHTML();
    }
    </script>

     <!-- THis code will help us to open the pages in the Modal DHTML window -->
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

    <!-- ------------------------------------------------------------->
</head>
<body>
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td>
                    <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="100%"
                        ClientInstanceName="page" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css"
                        CssPostfix="Office2003_Blue" ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                        <loadingpanelstyle imagespacing="6px"></loadingpanelstyle>
                        <contentstyle>
<Border BorderWidth="1px" BorderStyle="Solid" BorderColor="#002D96"></Border>
</contentstyle>
                        <tabstyle font-size="10px"></tabstyle>
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
	                                            }"></clientsideevents>
                        <tabpages>
<dxtc:TabPage Name="New Sales" Text="New Sales"><ContentCollection>
<dxw:ContentControl runat="server"><DIV id="GridDiv"><TABLE class="TableMain100"><TBODY><TR><TD style="TEXT-ALIGN: left" colSpan=2><TABLE><TBODY><TR><TD><asp:RadioButton runat="server" GroupName="a" Visible="False" ID="Lrd" __designer:wfdid="w3"></asp:RadioButton>
 </TD><TD><asp:Label runat="server" Text="From Lead Data" Font-Size="X-Small" ForeColor="Blue" ID="Label4" Visible="False" __designer:wfdid="w4"></asp:Label>
 </TD><TD><asp:RadioButton runat="server" GroupName="a" Visible="False" ID="Erd" Checked="True" __designer:wfdid="w5"></asp:RadioButton>
 </TD><TD><asp:Label runat="server" Text="From Existing Customer Data" Font-Size="X-Small" ForeColor="Blue" ID="Label5" Visible="False" __designer:wfdid="w6"></asp:Label>
 </TD></TR></TBODY></TABLE></TD></TR><TR><TD><dxwgv:ASPxGridView runat="server" CssPostfix="Office2003_Blue" Width="99%" ID="SalesGrid" DataSourceID="SalesDataSource" AutoGenerateColumns="False" ClientInstanceName="grid" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" __designer:wfdid="w7" OnCustomCallback="SalesGrid_CustomCallback">
<Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
<ExpandedButton Height="12px" Width="11px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"></ExpandedButton>

<CollapsedButton Height="12px" Width="11px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"></CollapsedButton>

<DetailCollapsedButton Height="12px" Width="11px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png"></DetailCollapsedButton>

<DetailExpandedButton Height="12px" Width="11px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png"></DetailExpandedButton>

<FilterRowButton Height="13px" Width="13px"></FilterRowButton>
</Images>

<Styles CssPostfix="Office2003_Blue" CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css">
<Header SortingImageSpacing="5px" ImageSpacing="5px"></Header>

<Cell CssClass="gridcellleft"></Cell>

<LoadingPanel ImageSpacing="10px"></LoadingPanel>
</Styles>

<Settings ShowGroupPanel="True" ShowFooter="True" ShowStatusBar="Visible"></Settings>

<SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</SettingsPager>
<Columns>
<dxwgv:GridViewCommandColumn Visible="False" VisibleIndex="0"></dxwgv:GridViewCommandColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="0" FieldName="Status"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="LeadId" Width="18%"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="1" FieldName="Name" Width="18%"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="2" FieldName="Address" Width="18%"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="3" FieldName="Phone" Width="18%"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="4" FieldName="ProductType" Width="14%"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="4" FieldName="ProductTypePath"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="4" FieldName="Id">
<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="5" FieldName="Amount"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="4" FieldName="Product"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="5" FieldName="NextVisit" Width="18%"></dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="7"><DataItemTemplate>
                                    <a href="#" onclick="ShowDetails('<%#Eval("ProductTypePath") %>')">Show</a>
                                
</DataItemTemplate>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewDataTextColumn VisibleIndex="6" Caption="History"><DataItemTemplate>
                                    <a href="#" onclick="CallForms('History')">History</a>
                                
</DataItemTemplate>

<EditFormSettings Visible="False"></EditFormSettings>
</dxwgv:GridViewDataTextColumn>
</Columns>
</dxwgv:ASPxGridView>
 </TD></TR></TBODY></TABLE></DIV><DIV style="DISPLAY: none" id="FrameDiv"><IFRAME runat="server" ID="ShowDetails_" frameBorder="0" width="100%" scrolling="no"></IFRAME>
</DIV></dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Document Collection" Text="Document Collection"><ContentCollection>
<dxw:ContentControl runat="server">
                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Future Sales" Text="Future Sales"><ContentCollection>
<dxw:ContentControl runat="server">
                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
<dxtc:TabPage Name="Closed Sales" Text="Closed Sales"><ContentCollection>
<dxw:ContentControl runat="server">
                        </dxw:ContentControl>
</ContentCollection>
</dxtc:TabPage>
</tabpages>
                    </dxtc:ASPxPageControl>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SalesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>">
        </asp:SqlDataSource>
        &nbsp;
    </form>
</body>
</html>
