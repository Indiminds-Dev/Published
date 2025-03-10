<%@ page language="C#" autoeventwireup="true" inherits="management_insurance_contactPerson, App_Web_xu-hjjp9" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insurance Contact Person</title>
    <link type="text/css" href="../../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
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
                    <td>
                        <dxwgv:ASPxGridView ID="GridContactPerson" ClientInstanceName="GridContactPerson"
                            KeyFieldName="ContactId" runat="server" AutoGenerateColumns="False" 
                            Width="100%" OnHtmlDataCellPrepared="GridContactPerson_HtmlDataCellPrepared"
                            OnInitNewRow="GridContactPerson_InitNewRow" OnRowUpdating="GridContactPerson_RowUpdating" OnRowInserting="GridContactPerson_RowInserting"
                             OnRowDeleting="GridContactPerson_RowDeleting">
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
                                <dxwgv:GridViewDataTextColumn FieldName="Officephone" Visible="False" VisibleIndex="1">
                                    <EditCellStyle HorizontalAlign="Right">
                                    </EditCellStyle>
                                    <EditFormSettings Visible="True" Caption="OfficePhone" VisibleIndex="1" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Residencephone" Visible="False" VisibleIndex="1">
                                    <EditCellStyle HorizontalAlign="Right">
                                    </EditCellStyle>
                                    <EditFormSettings Visible="True" Caption="ResidencePhone" VisibleIndex="2" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="Mobilephone" Visible="False" VisibleIndex="1">
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
                                    <PropertiesComboBox  DataSourceID="SqlDesignation" TextField="deg_designation" ValueField="deg_id"
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
                                            }" Init="function(s, e) {
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
                                
                                
                               <dxwgv:GridViewDataTextColumn FieldName="cp_Pan" Caption="PAN Number" VisibleIndex="6">
                                    <EditFormSettings Visible="True" VisibleIndex="8" />
                                    <EditCellStyle HorizontalAlign="Right">
                                    </EditCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                 <dxwgv:GridViewDataTextColumn FieldName="cp_Din" Caption="Din" VisibleIndex="7">
                                    <EditFormSettings Visible="True" VisibleIndex="9" />
                                    <EditCellStyle HorizontalAlign="Right">
                                    </EditCellStyle>
                                </dxwgv:GridViewDataTextColumn>

				<dxwgv:GridViewDataTextColumn FieldName="cp_Adhar" Caption="Adhar(12 Digit)" VisibleIndex="7">
                                    <EditFormSettings Visible="True" VisibleIndex="10" />
                                    <EditCellStyle HorizontalAlign="Right">
                                    </EditCellStyle>
                                    <PropertiesTextEdit>
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RegularExpression ErrorText="Invalid Adhar" />
                                        </ValidationSettings>
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                
                                
                                <dxwgv:GridViewCommandColumn VisibleIndex="8" Width="10%">
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
                                
                                
        
                                
                                <dxwgv:GridViewDataTextColumn VisibleIndex="9">
                                <HeaderCaptionTemplate>
                                        <dxe:ASPxHyperLink ID="ASPxHyperLin" runat="server" Text="Address *" 
                                            Font-Size="12px" Font-Color="Red">
                                        </dxe:ASPxHyperLink>
                                    </HeaderCaptionTemplate>
                                    <DataItemTemplate>
                                        <a href="javascript:void(0);" onclick="AddAddress('<%# Container.KeyValue %>')">Add/Edit
                                            Address</a>
                                    </DataItemTemplate>
                                    <EditFormSettings Visible="False" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior ConfirmDelete="True" />
                            <SettingsPager ShowSeparators="True">
                            </SettingsPager>
                        </dxwgv:ASPxGridView>
                        <br />
                       <%-- <asp:SqlDataSource ID="SqlContactPerson" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="" InsertCommand="ContactPersonInsertforInsCompany" InsertCommandType="StoredProcedure"
                            DeleteCommand="ContactPersonDelete" DeleteCommandType="StoredProcedure" UpdateCommand="ContactPersonUpdateforInsComp"
                            UpdateCommandType="StoredProcedure">
                            <InsertParameters>
                                <asp:Parameter Name="name" Type="String" />
                                <asp:Parameter Name="Officephone" Type="String" />
                                <asp:Parameter Name="Residencephone" Type="String" />
                                <asp:Parameter Name="Mobilephone" Type="String" />
                                <asp:Parameter Name="email" Type="String" />
                                <asp:Parameter Name="cp_designation" Type="String" />
                                <asp:Parameter Name="cp_relationShip" Type="String" />
                                <asp:Parameter Name="cp_status" Type="String" />
                                 <asp:Parameter Name="cp_Pan" Type="String" />
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
                                 <asp:Parameter Name="cp_Pan" Type="String" />
                                <asp:SessionParameter Name="userid" SessionField="userid" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>--%>
                        <asp:SqlDataSource ID="SqlDesignation" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select deg_id,deg_designation from tbl_master_designation"></asp:SqlDataSource>
                        <asp:SqlDataSource ID="SqlFamRelationShip" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="select fam_id,fam_familyRelationship from tbl_master_familyrelationship">
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
