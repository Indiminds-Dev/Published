<%@ page language="C#" autoeventwireup="true" inherits="management_Employee_Document, App_Web_bfdn6hbr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Document</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script type="text/javascript">

    function Show() {

        var url = "frmAddDocuments.aspx?id=Employee_Document.aspx&id1=Employee&AcType=Add&docid="+'';

        popup.SetContentUrl(url);

        popup.Show();

    }
    function PopulateGrid(obj)
 {
   gridDocument.PerformCallback(obj);
 }
    function Changestatus(obj)
    {
      var URL="verify_documentremarks.aspx?id="+obj;
      editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Verify Remarks", "width=950px,height=300px,center=0,resize=1,top=-1", "recal");                 
      editwin.onclose=function()
             {
                 gridDocument.PerformCallback();
             }
    }
    
        function ShowEditForm(KeyValue)
    {
       var url = 'frmAddDocuments.aspx?id=Employee_Document.aspx&id1=Employee&AcType=Edit&docid='+KeyValue;
        popup.SetContentUrl(url);
        popup.Show();
    }
    function disp_prompt(name)
    {
        //var ID = document.getElementById(txtID);
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Employee_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Employee_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Employee_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Employee_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        //document.location.href="Employee_Document.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Employee_FamilyMembers.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="Employee_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Employee_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Employee_Employee.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Employee_EmployeeCTC.aspx"; 
        }
        else if ( name == "tab10")
        {
        //alert(name);
        document.location.href="Employee_Remarks.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="Employee_Education.aspx"; 
        }
        else if ( name == "tab12")
        {
        //alert(name);
        document.location.href="Employee_Subscription.aspx";
        }
    }
    function OnDocumentView(keyValue) 
    {
        var url='viewImage.aspx?id='+keyValue;
        popup.contentUrl=url;
        popup.Show();

    }
      function DeleteRow(keyValue)
    {
             doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   gridDocument.PerformCallback('Delete~'+ keyValue);
                   height();
                }
            else{
                  
                }

   
    }
    </script>

<%--/head>
<body>--%>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="15px" ForeColor="Navy"
                            Width="819px" Height="18px"></asp:Label></td>
                </tr>
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="4" ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="CorresPondence" Name="CorresPondence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Bank Details" Text="Bank">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DP Details" Text="DP">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents" Text="Documents">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                           <dxwgv:ASPxGridView ID="EmployeeDocumentGrid" runat="server" AutoGenerateColumns="False"
                                                ClientInstanceName="gridDocument" KeyFieldName="Id" Width="100%" Font-Size="10px"
                                               OnCustomCallback="EmployeeDocumentGrid_CustomCallback" OnHtmlRowCreated="EmployeeDocumentGrid_HtmlRowCreated" >
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Type" VisibleIndex="0" Caption="Doc.Type"
                                                        >
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="FileName" VisibleIndex="1" Caption="Doc.Name"
                                                       >
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Src" VisibleIndex="2" Visible="False">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                      <dxwgv:GridViewDataTextColumn FieldName="Note1" VisibleIndex="3" Visible="true" Caption="Note 1">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                      <dxwgv:GridViewDataTextColumn FieldName="Note2" VisibleIndex="4" Visible="true" Caption="Note 2">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Fileno" VisibleIndex="5" Visible="true">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Bldng" VisibleIndex="6" Visible="true">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                    
                                                    <dxwgv:GridViewDataTextColumn FieldName="FilePath" ReadOnly="True" VisibleIndex="7"
                                                        Caption="Location" >
                                                    </dxwgv:GridViewDataTextColumn>
                                                     <dxwgv:GridViewDataTextColumn FieldName="createuser" ReadOnly="True" VisibleIndex="8"
                                                        Caption="Upload By" >
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <%--<dxwgv:GridViewDataHyperLinkColumn Caption="View" FieldName="Src" VisibleIndex="8"
                                                        Width="15%">
                                                        <DataItemTemplate>
                                                         <a onclick="OnDocumentView('<%#Eval("Src") %>')" style="cursor:pointer;">View</a>
                                                        </DataItemTemplate>
                                                    </dxwgv:GridViewDataHyperLinkColumn>--%>
                                                    
                                                     <dxwgv:GridViewDataTextColumn Caption="Verified By" FieldName="vrfy" ReadOnly="True"
                                                            VisibleIndex="9">
                                                            <EditFormSettings Visible="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="ReceiveDate" VisibleIndex="10" Visible="true">
                                                    </dxwgv:GridViewDataTextColumn>
                                                    
                                                      <dxwgv:GridViewDataTextColumn FieldName="RenewDate" VisibleIndex="11" Visible="true">
                                                    </dxwgv:GridViewDataTextColumn>
                                                   <%-- <dxwgv:GridViewCommandColumn VisibleIndex="7">
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="Show();"><span style="color: #000099; text-decoration: underline">
                                                                Add New</span> </a>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>--%>
                                                    
                                                      <dxwgv:GridViewDataTextColumn VisibleIndex="13"  Width="60px">
                                      <CellStyle CssClass="gridcellleft">
                                    </CellStyle>
                                     <DataItemTemplate>
                                           
                                                <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                Delete</a>&nbsp;&nbsp;&nbsp;                                                
                                             <a href="javascript:void(0);" onclick="ShowEditForm('<%# Container.KeyValue %>');">
                                                                Edit</a>      
                                        
                                    </DataItemTemplate>
                                       <HeaderTemplate>
                                      <a href="javascript:void(0);" onclick="Show();"><span style="color: #000099; text-decoration: underline">
                                                                Add New</span> </a>
                                    </HeaderTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                                                    
                                                 <%-- <dxwgv:GridViewDataTextColumn VisibleIndex="8" Width="60px" Caption="Edit">
                                                        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                                        <DataItemTemplate>
                                                                                                        
                                                        </DataItemTemplate>
                                                            <CellStyle Wrap="False"></CellStyle>
                                                            <HeaderTemplate>
                                                                     <span style="color: #000099;">Edit</span>                                                                                                                
                                                            </HeaderTemplate>
                                                            <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>--%>
                                                    
                                                </Columns>
                                                <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="300px" PopupEditFormHorizontalAlign="Center"
                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px"
                                                    EditFormColumnCount="1" />
                                                <Styles>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                </Styles>
                                                <SettingsText PopupEditFormCaption="Add/Modify Documents" ConfirmDelete="Are You Want To Delete This Record ???" />
                                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                    <FirstPageButton Visible="True">
                                                    </FirstPageButton>
                                                    <LastPageButton Visible="True">
                                                    </LastPageButton>
                                                </SettingsPager>
                                                <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                                <%-- <Templates>
                                                    <TitlePanel>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td align="right">
                                                                    <table width="200">
                                                                        <tr>
                                                                            <td>
                                                                                <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                    Height="18px" Width="88px" Font-Size="10px" AutoPostBack="False">
                                                                                  
                                                                                    <ClientSideEvents Click="function(s,e){Show();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </TitlePanel>
                                                </Templates>--%>
                                            </dxwgv:ASPxGridView>
                                            <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="frmAddDocuments.aspx"
                                                CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="350px"
                                                Width="900px" HeaderText="Add Document" AllowResize="true" ResizingMode="Postponed">
                                                <ContentCollection>
                                                    <dxpc:PopupControlContentControl runat="server">
                                                    </dxpc:PopupControlContentControl>
                                                </ContentCollection>
                                                <HeaderStyle BackColor="Blue" Font-Bold="True" ForeColor="White" />
                                            </dxpc:ASPxPopupControl>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Family Members" Text="Family">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Registration" Text="Registration">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Group Member" Text="Group">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Employee" Text="Employee">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Employee CTC" Text="CTC">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Remarks" Text="Remarks">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Education" Text="Education">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Subscription" Text="Subscriptions">
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
	                                            var Tab7 = page.GetTab(7);
	                                            var Tab8 = page.GetTab(8);
	                                            var Tab9 = page.GetTab(9);
	                                            var Tab10 = page.GetTab(10);
	                                            var Tab11 = page.GetTab(11);
	                                            var Tab12 = page.GetTab(12);
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
	                                            else if(activeTab == Tab7)
	                                            {
	                                                disp_prompt('tab7');
	                                            }
	                                            else if(activeTab == Tab8)
	                                            {
	                                                disp_prompt('tab8');
	                                            }
	                                            else if(activeTab == Tab9)
	                                            {
	                                                disp_prompt('tab9');
	                                            }
	                                            else if(activeTab == Tab10)
	                                            {
	                                                disp_prompt('tab10');
	                                            }
	                                            else if(activeTab == Tab11)
	                                            {
	                                                disp_prompt('tab11');
	                                            }
	                                            else if(activeTab == Tab12)
	                                            {
	                                                disp_prompt('tab12');
	                                            }
	                                            }"></ClientSideEvents>
                            <ContentStyle>
                                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                            </ContentStyle>
                            <LoadingPanelStyle ImageSpacing="6px">
                            </LoadingPanelStyle>
                            <TabStyle Font-Size="10px">
                            </TabStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                    <td>
                        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
