<%@ page language="C#" autoeventwireup="true" inherits="management_Lead_DPDetails, App_Web_kqhq1k1d" %>

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
    <title>DP Details</title>

    <script language="javascript" type="text/javascript">
             function SignOff()
            {
            window.parent.SignOff()
            }
           function height()
            {
                window.frameElement.height = document.body.scrollHeight;
                window.frameElement.widht = document.body.scrollWidht;
            }
    </script>

    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <!--___________________These files are for List Items__________________________-->
    <link href="../CSS/style.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
	}
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and .optionDivSelected */
		margin:1px;		
		padding:1px;
		cursor:pointer;
		font-size:0.9em;
	}
	#ajax_listOfOptions .optionDiv{	/* Div for each item in list */
		
	}
	#ajax_listOfOptions .optionDivSelected{ /* Selected item in the list */
		background-color:#DDECFE;
		color:Blue;
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
        function disp_prompt(name)
    {
        if ( name == "tab0")
        {
        //alert(name);
        document.location.href="Lead_general.aspx"; 
        }
        if ( name == "tab1")
        {
        //alert(name);
        document.location.href="Lead_Correspondence.aspx"; 
        }
        else if ( name == "tab2")
        {
        //alert(name);
        document.location.href="Lead_BankDetails.aspx"; 
        }
        else if ( name == "tab3")
        {
        //alert(name);
        //document.location.href="Lead_DPDetails.aspx"; 
        }
        else if ( name == "tab4")
        {
        //alert(name);
        document.location.href="Lead_Document.aspx"; 
        }
        else if ( name == "tab5")
        {
        //alert(name);
        document.location.href="Lead_FamilyMembers.aspx"; 
        }
        else if ( name == "tab6")
        {
        //alert(name);
        document.location.href="Lead_Registration.aspx"; 
        }
        else if ( name == "tab7")
        {
        //alert(name);
        document.location.href="Lead_GroupMember.aspx"; 
        }
        else if ( name == "tab8")
        {
        //alert(name);
        document.location.href="Lead_Remarks.aspx"; 
        }
    }
        function CallList(obj,obj1,obj2)
        {
            ajax_showOptions(obj,obj1,obj2);
        } 
        FieldName='ASPxPageControl1_DpDetailsGrid_DXSelInput';
      function setvaluetovariable(obj)
    {
        if(obj=='1')
        {
            document.getElementById("TrPoaName").style.display="none";
        }
        else    
        {
            document.getElementById("TrPoaName").style.display="inline";
        }
    }
    </script>

    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <dxtc:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="3" ClientInstanceName="page"  Width="100%">
                            <ContentStyle>
                                <Border BorderColor="#002D96" BorderStyle="Solid" BorderWidth="1px"></Border>
                            </ContentStyle>
                            <TabPages>
                                <dxtc:TabPage Name="General" Text="General">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="CorresPondence" Text="CorresPondence">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Bank Details" Text="Bank Details">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="DP Details" Text="DP Details">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                            <dxwgv:ASPxGridView runat="server" ClientInstanceName="gridDp" KeyFieldName="Id"
                                                AutoGenerateColumns="False" DataSourceID="DpDetailsdata" Width="100%" Font-Size="10px"
                                                ID="DpDetailsGrid" OnRowValidating="DpDetailsGrid_RowValidating" OnRowUpdating="DpDetailsGrid_RowUpdating"
                                                OnRowInserting="DpDetailsGrid_RowInserting" OnHtmlEditFormCreated="DpDetailsGrid_HtmlEditFormCreated">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="Id" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="CntId" Visible="False" VisibleIndex="0">
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="Category" VisibleIndex="0">
                                                        <PropertiesComboBox ValueType="System.String">
                                                            <Items>
                                                                <dxe:ListEditItem Text="Default" Value="Default">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="Secondary" Value="Secondary">
                                                                </dxe:ListEditItem>
                                                            </Items>
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Select Category"></RequiredField>
                                                            </ValidationSettings>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="DP" VisibleIndex="1">
                                                        <PropertiesComboBox EnableIncrementalFiltering="True" EnableSynchronization="False"
                                                            DataSourceID="SelectDp" TextField="DP" ValueField="DP_DepositoryID" ValueType="System.String">
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Select DPName"></RequiredField>
                                                            </ValidationSettings>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataComboBoxColumn FieldName="POA" VisibleIndex="3">
                                                        <PropertiesComboBox ValueType="System.String">
                                                            <Items>
                                                                <dxe:ListEditItem Text="Yes" Value="1">
                                                                </dxe:ListEditItem>
                                                                <dxe:ListEditItem Text="No" Value="0">
                                                                </dxe:ListEditItem>
                                                            </Items>
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="Select POA"></RequiredField>
                                                            </ValidationSettings>
                                                        </PropertiesComboBox>
                                                        <EditFormSettings Visible="True"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataComboBoxColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="ClientId" VisibleIndex="2">
                                                        <PropertiesTextEdit>
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="ClientId Required"></RequiredField>
                                                            </ValidationSettings>
                                                        </PropertiesTextEdit>
                                                        <EditFormSettings Visible="True"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="POAName" VisibleIndex="4">
                                                        <PropertiesTextEdit>
                                                            <ValidationSettings ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom" SetFocusOnError="True">
                                                                <RequiredField IsRequired="True" ErrorText="POAName Required"></RequiredField>
                                                            </ValidationSettings>
                                                        </PropertiesTextEdit>
                                                        <EditFormSettings Visible="True"></EditFormSettings>
                                                        <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                                                        </EditFormCaptionStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="CreateUser" Visible="False" VisibleIndex="5">
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="DPName" Visible="False" VisibleIndex="6">
                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewCommandColumn VisibleIndex="5">
                                                        <EditButton Visible="True">
                                                        </EditButton>
                                                        <DeleteButton Visible="True">
                                                        </DeleteButton>
                                                        <HeaderTemplate>
                                                            <a href="javascript:void(0);" onclick="gridDp.AddNewRow();"><span style="color: #000099;
                                                                text-decoration: underline">Add New</span> </a>
                                                        </HeaderTemplate>
                                                    </dxwgv:GridViewCommandColumn>
                                                </Columns>
                                                <SettingsBehavior ConfirmDelete="True"></SettingsBehavior>
                                                <SettingsPager PageSize="20" NumericButtonCount="20" ShowSeparators="True">
                                                    <FirstPageButton Visible="True">
                                                    </FirstPageButton>
                                                    <LastPageButton Visible="True">
                                                    </LastPageButton>
                                                </SettingsPager>
                                                <Settings ShowStatusBar="Visible"></Settings>
                                                <SettingsText ConfirmDelete="Are You Want To Delete This Record ???" PopupEditFormCaption="Add/Modify DP Details">
                                                </SettingsText>
                                                <Styles>
                                                    <Header SortingImageSpacing="5px" ImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <Templates>
                                                    <TitlePanel>
                                                        <%-- <table style="width:100%">
                                              <tr>
                                                <td align="right">
                                                  <table width="200">
                                                    <tr>                                                 
                                                      <td>
                                                        <dxe:ASPxButton ID="ASPxButton1" runat="server" Text="ADD" ToolTip="Add New Data" Height="18px" Width="88px" Font-Size="10px" AutoPostBack="False">
                                                           <clientsideevents click="function(s, e) {gridDp.AddNewRow();}" />
                                                        </dxe:ASPxButton>
                                                      </td>                                                                                
                                                    </tr>
                                                 </table>
                                              </td>   
                                            </tr>
                                          </table>--%>
                                                    </TitlePanel>
                                                    <EditForm>
                                                        <table class="TableMain100">
                                                            <tr>
                                                                <td style="text-align: right; width: 30%">
                                                                    <span class="Ecoheadtxt" style="color: Black">Category :</span>
                                                                </td>
                                                                <td style="text-align: left">
                                                                    <dxe:ASPxComboBox ID="comboCategory" EnableIncrementalFiltering="True" EnableSynchronization="False"
                                                                        Value='<%#Bind("Category") %>' runat="server" ValueType="System.String" Width="285px">
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Default" Value="Default" />
                                                                            <dxe:ListEditItem Text="Secondary" Value="Secondary" />
                                                                        </Items>
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxComboBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right; width: 30%">
                                                                    <span class="Ecoheadtxt" style="color: Black">DPName :</span>
                                                                </td>
                                                                <td style="text-align: left">
                                                                    <asp:TextBox ID="txtDPName" CssClass="EcoheadCon" Text='<%#Bind("DP") %>' runat="server"
                                                                        Width="279px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right; width: 30%">
                                                                    <span class="Ecoheadtxt" style="color: Black">ClientID :</span>
                                                                </td>
                                                                <td style="text-align: left">
                                                                    <asp:TextBox ID="txtClientID" CssClass="EcoheadCon" Text='<%#Bind("ClientId") %>'
                                                                        runat="server" Width="279px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right; width: 30%">
                                                                    <span class="Ecoheadtxt" style="color: Black">POA :</span>
                                                                </td>
                                                                <td style="text-align: left">
                                                                    <dxe:ASPxComboBox ID="comboPOA" EnableIncrementalFiltering="True" EnableSynchronization="False"
                                                                        Value='<%#Bind("POA") %>' runat="server" ValueType="System.String" Width="285px">
                                                                        <Items>
                                                                            <dxe:ListEditItem Text="Yes" Value="1" />
                                                                            <dxe:ListEditItem Text="No" Value="0" />
                                                                        </Items>
                                                                        <ClientSideEvents ValueChanged="function(s,e){
                                                                                                    var indexr = s.GetSelectedIndex();
                                                                                                    setvaluetovariable(indexr)
                                                                                                    }" />
                                                                        <ButtonStyle Width="13px">
                                                                        </ButtonStyle>
                                                                    </dxe:ASPxComboBox>
                                                                </td>
                                                            </tr>
                                                            <tr id="TrPoaName">
                                                                <td style="text-align: right; width: 30%">
                                                                    <span class="Ecoheadtxt" style="color: Black">POAName :</span>
                                                                </td>
                                                                <td style="text-align: left">
                                                                    <asp:TextBox ID="txtPoaName" CssClass="EcoheadCon" Text='<%#Bind("POAName") %>' runat="server"
                                                                        Width="279px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="text-align: center">
                                                                    <%--<controls>
                                                       <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                                       </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                                                     </controls>--%>
                                                                    <div style="text-align: right; padding: 2px 2px 2px 2px">
                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                                            runat="server">
                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                                            runat="server">
                                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="display: none">
                                                                    <asp:TextBox ID="txtDPName_hidden" CssClass="EcoheadCon" Text='<%#Bind("DPName") %>'
                                                                        runat="server" Width="279px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </EditForm>
                                                </Templates>
                                            </dxwgv:ASPxGridView>
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Documents" Text="Documents">
                                    <ContentCollection>
                                        <dxw:ContentControl runat="server">
                                        </dxw:ContentControl>
                                    </ContentCollection>
                                </dxtc:TabPage>
                                <dxtc:TabPage Name="Family Members" Text="Family Members">
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
                                <dxtc:TabPage Name="Group Member" Text="Group Member">
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
                            </TabPages>
                            <TabStyle Font-Size="10px">
                            </TabStyle>
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
	                                            
	                                            }"></ClientSideEvents>
                            <LoadingPanelStyle ImageSpacing="6px">
                            </LoadingPanelStyle>
                        </dxtc:ASPxPageControl>
                    </td>
                    <td>
                        <asp:TextBox ID="txtID" runat="server" Visible="false"></asp:TextBox></td>
                </tr>
            </table>
        </div>
        <asp:SqlDataSource ID="DpDetailsdata" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select dpd_id AS Id,dpd_cntId as CntId,dpd_accountType AS Category,dpd_dpCode AS DPName,dpd_ClientId AS ClientId, CASE dpd_POA WHEN 1 THEN 'Yes' ELSE 'No' END AS POA,dpd_POAName AS POAName,CreateUser,(select DP_Name+' ['+DP_DepositoryID+']' from Master_DP where DP_DepositoryID=replace(tbl_master_contactDPDetails.dpd_dpCode,char(160),'')) as DP from tbl_master_contactDPDetails where dpd_cntId=@CntId"
            InsertCommand="insert into tbl_master_contactDPDetails(dpd_cntId,dpd_accountType,dpd_dpCode,dpd_clientId,dpd_POA,dpd_POAName,CreateDate,CreateUser) values(@CntId,@Category,@DPName,@ClientId,@POA,@POAName,getdate(),@CreateUser)"
            UpdateCommand="update tbl_master_contactDPDetails set dpd_accountType=@Category,dpd_dpCode=@DPName,dpd_clientId=@ClientId,dpd_POA=@POA,dpd_POAName=@POAName,LastModifyDate=getdate(),LastModifyUser=@CreateUser where dpd_id=@Id"
            DeleteCommand="delete from tbl_master_contactDPDetails where dpd_id=@Id">
            <SelectParameters>
                <asp:SessionParameter Name="CntId" SessionField="KeyVal_InternalID" Type="String" />
            </SelectParameters>
            <InsertParameters>
                <asp:SessionParameter Name="CntId" SessionField="KeyVal_InternalID" Type="String" />
                <asp:Parameter Name="Category" />
                <asp:Parameter Name="DPName" />
                <asp:Parameter Name="ClientId" />
                <asp:Parameter Name="POA" />
                <asp:Parameter Name="POAName" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Category" />
                <asp:Parameter Name="DPName" />
                <asp:Parameter Name="ClientId" />
                <asp:Parameter Name="POA" />
                <asp:Parameter Name="POAName" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                <asp:Parameter Name="Id" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="Id" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectDp" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select DP_DepositoryID,DP_Name+' ['+DP_DepositoryID+']' as DP from Master_DP order by DP_Name">
        </asp:SqlDataSource>
    </form>
</body>
</html>
