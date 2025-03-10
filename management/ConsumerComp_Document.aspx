<%@ page language="C#" autoeventwireup="true" inherits="management_ConsumerComp_Document, App_Web_5uqmplyf" %>
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

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
<script type="text/javascript">
   function SignOff()
            {
            window.parent.SignOff()
            }

    function Show() {

        var url = "frmAddDocuments.aspx?id=ConsumerComp_Document.aspx&id1=ConsumerComp";

        popup.SetContentUrl(url);

        popup.Show();

    }
function disp_prompt(name)
    {
         if ( name == "tab0")
        {
        //alert(name);
        document.location.href="ConsumerComp_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="ConsumerComp_ContactPerson.aspx";         
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="ConsumerComp_Correspondence.aspx";         
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="ConsumerComp_BankDetails.aspx";         
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="ConsumerComp_DPDetails.aspx";         
        }
        else if ( name == "tab5")
        {
        //alert(name);
        //document.location.href="ConsumerComp_Document.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="ConsumerComp_GroupMember.aspx"; 
        }
    }
       function OnDocumentView(keyValue) 
    {
        var url='viewImage.aspx?id='+keyValue;
        popup.contentUrl=url;
        popup.Show();

    }
</script>
    <form id="form1" runat="server">
    <div>
    <table class="TableMain100">
        <tr>
            <td class="EHEADER" ></td>            
        </tr>
        <tr>
            <td colspan="2">
                <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="5" ClientInstanceName="page" >
                
                <TabPages>
                    <dxtc:TabPage Text="General" Name="General"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Contact Person" Text="Contact Person">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Text="CorresPondence" Name="CorresPondence"><ContentCollection>
                        <dxw:ContentControl runat="server">
                        </dxw:ContentControl>
                        </ContentCollection>
                        </dxtc:TabPage>
                    <dxtc:TabPage Name="BankDetails" Text="Bank Details">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">                                                            
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="DPDetails" Text="DP Details">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="Documents" Text="Documents">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                                <dxwgv:ASPxGridView ID="EmployeeDocumentGrid" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridDocument" KeyFieldName="Id" Width="100%" Font-Size="10px"  OnRowDeleting="EmployeeDocumentGrid_RowDeleting">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn FieldName="Id" ReadOnly="True" VisibleIndex="0" Visible="False">
                                              <EditFormSettings Visible="False" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Type" VisibleIndex="0" Caption="DocumentType" Width="25%">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="FileName" VisibleIndex="1" Caption="DocumentName" Width="25%">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="Src" VisibleIndex="2" Visible="False">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn FieldName="FilePath" ReadOnly="True" VisibleIndex="2" Caption="Document Physical Location" Width="25%">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataHyperLinkColumn Caption="View" FieldName="Src" VisibleIndex="3" Width="15%">
                                                <DataItemTemplate>
                                                 <%--   <a href='viewImage.aspx?id=<%#Eval("Src") %>' target="_blank">View</a>--%>
                                                <a onclick="OnDocumentView('<%#Eval("Src") %>')" style="cursor:pointer;">View</a>
                                                </DataItemTemplate>
                                            </dxwgv:GridViewDataHyperLinkColumn>
                                            <dxwgv:GridViewCommandColumn VisibleIndex="4">
                                                <DeleteButton Visible="True">
                                                </DeleteButton>
                                                <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="Show();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        </HeaderTemplate>
                                            </dxwgv:GridViewCommandColumn>
                                        </Columns>
                                         <Settings ShowStatusBar="Visible" />
                                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px" EditFormColumnCount="1" />
                                        <Styles >
                                         <LoadingPanel ImageSpacing="10px">
                                         </LoadingPanel>
                                         <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                        </Header>
                                         </Styles>
                                            <SettingsText PopupEditFormCaption="Add/Modify Family Relationship" ConfirmDelete="Are You Want To Delete This Record ???" />
                                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                                <FirstPageButton Visible="True">
                                                </FirstPageButton>
                                                <LastPageButton Visible="True">
                                                </LastPageButton>
                                            </SettingsPager>
                                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                                    </dxwgv:ASPxGridView>
                                    <dxpc:ASPxPopupControl ID="ASPXPopupControl" runat="server" ContentUrl="frmAddDocuments.aspx" CloseAction="CloseButton" Top="100" Left="400" ClientInstanceName="popup" Height="500px" Width="900px" HeaderText="Add Document">
                                        <ContentCollection>
                                            <dxpc:PopupControlContentControl runat="server">
                                            </dxpc:PopupControlContentControl>
                                        </ContentCollection>
                                    </dxpc:ASPxPopupControl>
                                
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>
                    <dxtc:TabPage Name="GroupMember" Text="Group Member">
                        <ContentCollection>
                            <dxw:ContentControl runat="server">
                            </dxw:ContentControl>
                        </ContentCollection>
                    </dxtc:TabPage>                    
                    </TabPages>
                    <ClientSideEvents  ActiveTabChanged="function(s, e) {
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
	                                            
	                                            }">
                    </ClientSideEvents>
                    <ContentStyle>
                        <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px" />
                    </ContentStyle>
                    <LoadingPanelStyle ImageSpacing="6px">
                    </LoadingPanelStyle>
                    <TabStyle Font-Size="10px">
                    </TabStyle>
                </dxtc:ASPxPageControl>
                </td>
            </tr>
        <tr>
            <td >
                    <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
        </tr>
        </table>
        <%--<asp:SqlDataSource ID="EmployeeDocumentData" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select tbl_master_document.doc_id AS Id, tbl_master_documentType.dty_documentType AS Type,tbl_master_document.doc_documentName AS FileName, tbl_master_document.doc_source AS Src,COALESCE ('Building- ' + tbl_master_building.bui_Name + CHAR(13) + CHAR(10), '') +COALESCE ('/ Floor No : ' + tbl_master_document.doc_Floor + CHAR(13) + CHAR(10), '')  + '/ Room No-' + tbl_master_document.doc_RoomNo + '/ Cabinet No-' + tbl_master_document.doc_CellNo + '/ File No-' + tbl_master_document.doc_FileNo AS FilePath from tbl_master_document INNER JOIN tbl_master_documentType ON tbl_master_document.doc_documentTypeId = tbl_master_documentType.dty_id INNER JOIN tbl_master_building ON tbl_master_document.doc_buildingId = tbl_master_building.bui_id where doc_contactId=@doc_contactId"
            DeleteCommand="delete from tbl_master_document where doc_id=@Id">
          <DeleteParameters>
             <asp:Parameter Name="Id" Type="decimal" />
          </DeleteParameters>  
          <SelectParameters>
            <asp:SessionParameter Name="doc_contactId" SessionField="KeyVal_InternalID" Type="string" />
          </SelectParameters>
        </asp:SqlDataSource>--%>
    </div>
    </form>
</body>
</html>
