<%@ page language="C#" autoeventwireup="true" inherits="management_Contact_FamilyMembers, App_Web_lgnajdkn" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Family Members</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
 <script language="javascript" type="text/javascript">
function SignOff()
    {
    window.parent.SignOff()
    }
    function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Contact_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Contact_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Contact_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        document.location.href="Contact_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Contact_Document.aspx"; 
        }
        else if ( name == "tab12")
        {
        //alert(name);
        //document.location.href="Contact_FamilyMembers.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Contact_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Contact_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Contact_Deposit.aspx"; 
        }
        else if ( name == "tab9")
        {
        //alert(name);
        document.location.href="Contact_Remarks.aspx"; 
        }
        else if ( name == "tab10")
        {
        //alert(name);
        document.location.href="Contact_Education.aspx"; 
        }
        else if ( name == "tab11")
        {
        //alert(name);
        document.location.href="contact_brokerage.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
            document.location.href="contact_other.aspx"; 
        }
        else if(name=="tab13")
        {
             document.location.href="contact_Subscription.aspx";
        }
        //New Work 30-12-2021
        else if(name=="tab14")
        {
             document.location.href="Contact_Nominee.aspx";
        }
        //End of New Work 30-12-2021
    }
    </script>
   <form id="form1" runat="server">
        <table width="100%">
                <tr>
                    <td class="EHEADER" style="text-align: center">
                        <asp:Label ID="lblName" runat="server" Font-Bold="True"></asp:Label>
                    </td>
                </tr>
            </table>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="12" ClientInstanceName="page">
                            <TabPages>
                                <dxtc:TabPage  Name="General">
                                <TabTemplate ><span style="font-size:x-small">General</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage  Name="CorresPondence">
                                <TabTemplate ><span style="font-size:x-small">CorresPondence</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Bank Details">
                                <TabTemplate ><span style="font-size:x-small">Bank</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DP Details">
                                <TabTemplate ><span style="font-size:x-small">DP</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents">
                                <TabTemplate ><span style="font-size:x-small">Documents</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                              
                                <dxtc:TabPage Name="Registration">
                                <TabTemplate ><span style="font-size:x-small">Registration</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                 <dxtc:TabPage Name="Other">
                                <TabTemplate ><span style="font-size:x-small">Other</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>
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
                                <dxtc:TabPage Name="Deposit" Text="Deposit">
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
                                <dxtc:TabPage Name="Trad. Prof." Text="Trad.Prof">
                                <%--<TabTemplate ><span style="font-size:x-small">Trad.Prof</span>&nbsp;<span style="color:Red;">*</span> </TabTemplate>--%>
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                
                                
                                
                                 <dxtc:TabPage Name="Family Members" Text="Family">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <dxwgv:ASPxGridView ID="FamilyMemberGrid" DataSourceID="FamilyMemberData" ClientInstanceName="gridFamily"
                                                KeyFieldName="Id" runat="server" AutoGenerateColumns="False" Width="100%" Font-Size="10px">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Relation" Caption="RelationShip" VisibleIndex="0"
                                                        Width="20%">
                                                        <EditFormSettings Caption="RelationShip" Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Name" Caption="Name" VisibleIndex="1" Width="20%">
                                                        <EditFormSettings Caption="Name" Visible="True" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <PropertiesTextEdit>
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField ErrorText="Name Required" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </PropertiesTextEdit>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataDateColumn Caption="Date of Birth" FieldName="DOB" VisibleIndex="2"
                                                        Width="20%">
                                                        <PropertiesDateEdit DisplayFormatString="{0:dd MMM yyyy}" EditFormatString="dd-MM-yyyy" EditFormat="Custom" UseMaskBehavior="true">
                                                        </PropertiesDateEdit>
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                        <EditFormSettings Visible="True" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataDateColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="RelationShip" FieldName="RID" Visible="False"
                                                        VisibleIndex="0">
                                                        <PropertiesComboBox DataSourceID="SelectRelation" TextField="fam_familyRelationship"
                                                            ValueField="fam_id" ValueType="System.String">
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField ErrorText="RelationShip Required" IsRequired="True" />
                                                            </ValidationSettings>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn Caption="Blood Group" FieldName="BloodGroup"  VisibleIndex="0">
                                                        <PropertiesComboBox ValueType="System.String">
                                                            <Items>
                                                                <dxe:ListEditItem Text="A+" Value="A+">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="A-" Value="A-">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="B+" Value="B+">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="B-" Value="B-">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="AB+" Value="AB+">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="AB-" Value="AB-">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="O" Value="O">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="O+" Value="O+">
                                                                </dxe:ListEditItem>
                                                            </Items>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True" />
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="User1" Caption="Create User" VisibleIndex="3"
                                                        Visible="False" Width="20%">
                                                        <EditFormSettings Caption="Category" Visible="False" />
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="4">
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <EditButton Visible="True">
                                                        </EditButton>
                                                        <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="gridFamily.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>
                                                </Columns>
                                                <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                                                <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="250px" PopupEditFormHorizontalAlign="Center"
                                                    PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px"
                                                    EditFormColumnCount="1" />
                                                <Styles>
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
                                                <Templates>
                                                    <EditForm>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 25%">
                                                                </td>
                                                                <td style="width: 50%">
                                                                    <controls>
                                                   <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                                   </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                                 </controls>
                                                                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                            runat="server">
                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                            runat="server">
                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                    </div>
                                                                </td>
                                                                <td style="width: 25%">
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </EditForm>
                                                    <TitlePanel>
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td align="right">
                                                                    <table width="200">
                                                                        <tr>
                                                                            <td>
                                                                                <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data"
                                                                                    Height="18px" Width="88px" AutoPostBack="False" Font-Size="10px">
                                                                                    <ClientSideEvents Click="function(s, e) {gridFamily.AddNewRow();}" />
                                                                                </dxe:ASPxButton>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </TitlePanel>
                                                </Templates>
                                            </dxwgv:ASPxGridView>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                            <dxtc:TabPage Name="Subscription" Text="Subscription">
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <%--New Work 30-12-2021--%>
                            <dxtc:TabPage Name="Nominee">
                                <TabTemplate>
                                    <span style="font-size: x-small;color:Blue;font-weight:bold">Nominee</span>&nbsp;<span style="color: Red;">*</span>
                                </TabTemplate>
                                <ContentCollection>
                                    <dxw:ContentControl runat="server">
                                    </dxw:ContentControl>
                                </ContentCollection>
                            </dxtc:TabPage>
                            <%--End of New Work 30-12-2021--%>
                            </TabPages>
                            <%--New work Contact_Nominee(Tab14) added 30-12-2021--%>
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
                                                var Tab13=page.GetTab(13);
                                                var Tab14=page.GetTab(14);
                                                
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
	                                            else if(activeTab == Tab13)
	                                            {
	                                               disp_prompt('tab13');
	                                            }
	                                            else if(activeTab == Tab14)
	                                            {
	                                               disp_prompt('tab14');
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
                </tr>
            </table>
         <asp:SqlDataSource ID="FamilyMemberData" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            InsertCommand="insert into tbl_master_contactfamilyrelationship(femrel_relationId,femrel_memberName,femrel_DOB,femrel_bloodgroup,femrel_cntId,femrel_contacttype,CreateDate,CreateUser) values(@RID,@Name,@DOB,@BloodGroup,@insuId,'contact',getdate(),@User1)"
            SelectCommand="select tbl_master_contactFamilyRelationship.femrel_id AS Id, 
                        tbl_master_familyRelationship.fam_familyRelationship AS Relation, tbl_master_contactFamilyRelationship.femrel_memberName AS Name, 
                        tbl_master_contactFamilyRelationship.femrel_bloodGroup AS BloodGroup, cast(tbl_master_contactFamilyRelationship.femrel_DOB as datetime) AS DOB,
                        tbl_master_contactFamilyRelationship.femrel_relationId as RID,
                        tbl_master_contactFamilyRelationship.CreateUser as User1 
                        from tbl_master_contactFamilyRelationship INNER JOIN tbl_master_familyRelationship 
                        ON tbl_master_contactFamilyRelationship.femrel_relationId = tbl_master_familyRelationship.fam_id 
                        where tbl_master_contactFamilyRelationship.femrel_cntId =@insuId 
                        AND tbl_master_contactFamilyRelationship.femrel_contactType = 'contact'"
            DeleteCommand="delete from tbl_master_contactfamilyrelationship where femrel_id=@Id"
            UpdateCommand="update tbl_master_contactfamilyrelationship set femrel_relationId=@RID,femrel_memberName=@Name,femrel_DOB=@DOB,femrel_bloodgroup=@BloodGroup,LastModifyDate=getdate(),LastModifyUser=@User1 where femrel_id=@Id">
            <InsertParameters>
                <asp:Parameter Name="RID" Type="decimal" />
                <asp:Parameter Name="Name" Type="string" />
                <asp:Parameter Name="DOB" Type="dateTime" />
                <asp:Parameter Name="BloodGroup" Type="string" />
                <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID" Type="String" />
                <asp:SessionParameter Name="User1" SessionField="userid" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="insuId" SessionField="KeyVal_InternalID" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="decimal" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="RID" Type="decimal" />
                <asp:Parameter Name="Name" Type="string" />
                <asp:Parameter Name="DOB" Type="dateTime" />
                <asp:Parameter Name="BloodGroup" Type="string" />
                <asp:SessionParameter Name="User1" SessionField="userid" Type="Decimal" />
                <asp:Parameter Name="Id" Type="decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectRelation" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select fam_familyRelationship,fam_id from tbl_master_familyrelationship order by fam_familyRelationship">
        </asp:SqlDataSource>
    </form>
</body>
</html>
