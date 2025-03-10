<%@ page language="C#" autoeventwireup="true" inherits="management_HRrecruitmentagent_ContactPerson, App_Web_6_wayyot" %>

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
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
    function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        //document.location.href="HRrecruitmentagent_ContactPerson.aspx";         
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_Correspondence.aspx";         
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_BankDetails.aspx";         
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_DPDetails.aspx";         
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_Document.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="HRrecruitmentagent_GroupMember.aspx"; 
        }
        
    }
    
    function AddAddress(KeyVal)
        {
            var url='AddAddressForContactPerson.aspx?id='+KeyVal;
            frmOpenNewWindow1(url,300,300)
        }
        function frmOpenNewWindow1(location,v_height,v_weight)
        {
            var y=(screen.availHeight-v_height)/2;
            var x=(screen.availWidth-v_weight)/2;
            window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td style="text-align: center">
                        <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="15px" ForeColor="Navy"
                            Width="819px" Height="18px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100%">
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" ClientInstanceName="page"
                            Font-Size="10px" Width="99%">
                            <TabPages>
                                <dxtc:TabPage Text="General" Name="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="Contact Person" Name="ContactPreson">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <table class="TableMain100">
                                                <tr>
                                                    <td style="width: 933px">
                                                        <dxwgv:ASPxGridView ID="GridContactPerson" ClientInstanceName="GridContactPerson"
                                                            KeyFieldName="ContactId" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
                                                            Width="100%" OnHtmlDataCellPrepared="GridContactPerson_HtmlDataCellPrepared">
                                                            <Styles>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn FieldName="name" Caption="Name" VisibleIndex="0">
                                                                    <EditFormSettings Visible="True" VisibleIndex="0" />
                                                                    <EditCellStyle HorizontalAlign="Right">
                                                                    </EditCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Phone" VisibleIndex="3">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Officephone" Visible="false" VisibleIndex="1">
                                                                    <EditCellStyle HorizontalAlign="Right">
                                                                    </EditCellStyle>
                                                                    <EditFormSettings Visible="True" Caption="OfficePhone" VisibleIndex="1" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Residencephone" Visible="false" VisibleIndex="1">
                                                                    <EditCellStyle HorizontalAlign="Right">
                                                                    </EditCellStyle>
                                                                    <EditFormSettings Visible="True" Caption="ResidencePhone" VisibleIndex="2" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="Mobilephone" Visible="false" VisibleIndex="1">
                                                                    <EditCellStyle HorizontalAlign="Right">
                                                                    </EditCellStyle>
                                                                    <EditFormSettings Visible="True" Caption="MobilePhone" VisibleIndex="3" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="email" Caption="Email" VisibleIndex="4">
                                                                    <PropertiesTextEdit>
                                                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                                                            <RegularExpression ErrorText="Invali E-mail ID!" ValidationExpression="^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$" />
                                                                        </ValidationSettings>
                                                                    </PropertiesTextEdit>
                                                                    <EditCellStyle HorizontalAlign="Right">
                                                                    </EditCellStyle>
                                                                    <EditFormSettings Visible="True" VisibleIndex="4" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="cp_designation" Caption="Designation"
                                                                    VisibleIndex="2" Width="10%">
                                                                    <PropertiesComboBox DataSourceID="SqlDesignation" TextField="deg_designation" ValueField="deg_id"
                                                                        ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="True" VisibleIndex="6" />
                                                                    <EditCellStyle HorizontalAlign="Right">
                                                                    </EditCellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="cp_relationShip" Caption="RelationShip"
                                                                    VisibleIndex="1" Width="10%">
                                                                    <PropertiesComboBox DataSourceID="SqlFamRelationShip" TextField="fam_familyRelationship"
                                                                        ValueField="fam_id" ValueType="System.String" EnableSynchronization="False" EnableIncrementalFiltering="True">
                                                                        <ClientSideEvents Init="function(s, e) {
	                                                                        var value = s.GetText().toUpperCase();	
                                                                            if(value == &quot;EMPLOYEE&quot;)
                                                                            {
                                                                                 GridContactPerson.GetEditor(&quot;cp_designation&quot;).SetVisible(true);
                                                                            }
                                                                            else
                                                                            {
                                                                                 GridContactPerson.GetEditor(&quot;cp_designation&quot;).SetVisible(false);
                                                                            }
                                                                        }" />
                                                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                                        var value = s.GetText().toUpperCase();
                                                                            if(value == &quot;EMPLOYEE&quot;)
                                                                            {
                                                                                 GridContactPerson.GetEditor(&quot;cp_designation&quot;).SetVisible(true);
                                                                            }
                                                                            else
                                                                            {
                                                                                 GridContactPerson.GetEditor(&quot;cp_designation&quot;).SetVisible(false);
                                                                            }
                                                                        }" />
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="True" VisibleIndex="5" />
                                                                    <EditCellStyle HorizontalAlign="Right">
                                                                    </EditCellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewDataTextColumn FieldName="status" Caption="Status" VisibleIndex="5"
                                                                    Width="10%">
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataComboBoxColumn FieldName="cp_status" Visible="False" VisibleIndex="4"
                                                                    Width="10%">
                                                                    <PropertiesComboBox ValueType="System.Char" EnableIncrementalFiltering="True">
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Active" Value="Y">
                                                                            </dxe:ListEditItem>
                                                                            <dxe:ListEditItem Text="Suspended" Value="N">
                                                                            </dxe:ListEditItem>
                                                                        </Items>
                                                                    </PropertiesComboBox>
                                                                    <EditFormSettings Visible="True" Caption="Status" VisibleIndex="7" />
                                                                    <EditCellStyle HorizontalAlign="Right">
                                                                    </EditCellStyle>
                                                                </dxwgv:GridViewDataComboBoxColumn>
                                                                <dxwgv:GridViewCommandColumn VisibleIndex="5" Width="10%">
                                                                    <ClearFilterButton Visible="True">
                                                                    </ClearFilterButton>
                                                                    <DeleteButton Visible="True">
                                                                    </DeleteButton>
                                                                    <EditButton Visible="True">
                                                                    </EditButton>
                                                                    <HeaderCaptionTemplate>
                                                                        <dxe:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Add New" ClientSideEvents-Click="function(s, e) {GridContactPerson.AddNewRow();}"
                                                                            Font-Size="10px" Font-Underline="true">
                                                                        </dxe:ASPxHyperLink>
                                                                    </HeaderCaptionTemplate>
                                                                    <HeaderStyle Font-Underline="True" HorizontalAlign="Center" />
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataTextColumn VisibleIndex="7">
                                                                    <DataItemTemplate>
                                                                        <a href="javascript:void(0);" onclick="AddAddress('<%# Container.KeyValue %>')">Add
                                                                            Address</a>
                                                                    </DataItemTemplate>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <SettingsBehavior ConfirmDelete="True" />
                                                            <SettingsPager ShowSeparators="True">
                                                            </SettingsPager>
                                                        </dxwgv:ASPxGridView>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                            SelectCommand="select A.cp_contactId as ContactId, A.cp_name as name,(select phf_phonenumber from tbl_master_phonefax where phf_cntId=A.cp_contactId and phf_type='Office') as Officephone,(select phf_phonenumber from tbl_master_phonefax where phf_cntId=A.cp_contactId and phf_type='Residence') as Residencephone,(select phf_phonenumber from tbl_master_phonefax where phf_cntId=A.cp_contactId and phf_type='Mobile') as Mobilephone,isnull(('(O)'+(select phf_phonenumber from tbl_master_phonefax where phf_cntId=A.cp_contactId and phf_type='Office')),'')+isnull(('(R)'+(select phf_phonenumber from tbl_master_phonefax where phf_cntId=A.cp_contactId and phf_type='Residence')),'')+isnull(('(M)'+(select phf_phonenumber from tbl_master_phonefax where phf_cntId=A.cp_contactId and phf_type='Mobile')),'') as Phone,(select eml_email from tbl_master_email where eml_cntId=A.cp_contactId) as email, (case when cp_status = 'Y' then 'Active' when cp_status = 'N' then 'Suspended' else 'N/A'  end) as status, ltrim(rtrim(cp_status)) as cp_status,ltrim(rtrim(cp_designation)) as cp_designation,ltrim(rtrim(cp_relationShip)) as cp_relationShip from tbl_master_contactperson A  where cp_agentInternalId=@insuId ORDER BY cp_status desc"
                                                            InsertCommand="ContactPersonInsertforInsCompany" InsertCommandType="StoredProcedure"
                                                            DeleteCommand="ContactPersonDelete" DeleteCommandType="StoredProcedure" UpdateCommand="ContactPersonUpdateforInsComp"
                                                            UpdateCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID" Type="String" />
                                                            </SelectParameters>
                                                            <InsertParameters>
                                                                <asp:Parameter Name="name" Type="String" />
                                                                <asp:Parameter Name="Officephone" Type="String" />
                                                                <asp:Parameter Name="Residencephone" Type="String" />
                                                                <asp:Parameter Name="Mobilephone" Type="String" />
                                                                <asp:Parameter Name="email" Type="String" />
                                                                <asp:Parameter Name="cp_designation" Type="String" />
                                                                <asp:Parameter Name="cp_relationShip" Type="String" />
                                                                <asp:Parameter Name="cp_status" Type="String" />
                                                                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                                                                <asp:SessionParameter Name="agentid" SessionField="KeyVal_InternalID" Type="String" />
                                                            </InsertParameters>
                                                            <DeleteParameters>
                                                                <asp:Parameter Name="ContactId" Type="String" />
                                                            </DeleteParameters>
                                                            <UpdateParameters>
                                                                <asp:Parameter Name="name" Type="String" />
                                                                <asp:Parameter Name="Officephone" Type="String" />
                                                                <asp:Parameter Name="Residencephone" Type="String" />
                                                                <asp:Parameter Name="Mobilephone" Type="String" />
                                                                <asp:Parameter Name="email" Type="String" />
                                                                <asp:Parameter Name="cp_designation" Type="String" />
                                                                <asp:Parameter Name="cp_relationShip" Type="String" />
                                                                <asp:Parameter Name="cp_status" Type="String" />
                                                                <asp:Parameter Name="ContactId" Type="String" />
                                                                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                                                            </UpdateParameters>
                                                        </asp:SqlDataSource>
                                                        <asp:SqlDataSource ID="SqlDesignation" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                            SelectCommand="select deg_id,deg_designation from tbl_master_designation"></asp:SqlDataSource>
                                                        <asp:SqlDataSource ID="SqlFamRelationShip" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                                                            SelectCommand="select fam_id,fam_familyRelationship from tbl_master_familyrelationship">
                                                        </asp:SqlDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Text="CorresPondence" Name="CorresPondence">
                                    <ContentCollection>
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
