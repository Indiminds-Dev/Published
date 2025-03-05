<%@ page language="C#" autoeventwireup="true" inherits="management_GroupMaster, App_Web_8qixh_8w" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Group</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:50px;	/* Width of box */
		height:auto;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:30000;
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
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:5000;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script type="text/javascript">
    
    
  function DeleteRow(keyValue)
    {
             doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   var obj1="Delete"+"~"+keyValue;
                   grid.PerformCallback(obj1);
                   height();
                }
            else{
                  
                }

   
    }
     function HideGroupType(obj)
     {
  
        if(obj=='a')
        {
           GroupType.SetEnabled(true);   
        }
        else if(obj=='b')
        {
         GroupType.SetEnabled(false);
         
        }
        else if(obj=='c')
        {
         alert("Member already Exists in  this group.Deletion is not allowed.");
        }
        height();
     }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
        //function is called on changing country
        function OnOwnerChanged(cmbCountry) 
        {
            grid.GetEditor("gpm_Description").PerformCallback(cmbCountry.GetValue().toString());
        }
        function OnTypeChanged(cmbType) 
        {
            grid.GetEditor("GroupOwner").PerformCallback(cmbType.GetValue().toString());
        }
        function OnMoreInfoClick(keyValue,name,type) 
        {
           //  frmOpenNewWindow1('groupmasterPopUp.aspx?id='+keyValue+'&type='+type+'&name='+name,400,500);
              
//               var url='Lead_general.aspx?id=' + 'ADD';
//             parent.OnMoreInfoClick(url,"Add New Lead Details",'940px','450px',"Y");

            
             var url='groupmasterPopUp.aspx?id='+keyValue+'&type='+type+'&name='+name;
             parent.OnMoreInfoClick(url,"Add Member",'940px','450px',"Y");

        }
        function frmOpenNewWindow1(location,v_height,v_weight)
        {
                var y=(screen.availHeight-v_height)/2;
                var x=(screen.availWidth-v_weight)/2;
                window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ y +",left="+ x +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
        }
        function ShowHideFilter(obj)
        {
            grid.PerformCallback(obj);
        } 
        
  function CallList(obj1,obj2,obj3)
    {
       var obj4=GroupType.GetValue(); 
        ajax_showOptions(obj1,obj2,obj3,obj4);
    }
    FieldName='UpdateButton';

    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Group Master</span></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                            <td style="text-align: left; vertical-align: top">
                                <table>
                                    <tr>
                                        <td id="ShowFilter">
                                            <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                Show Filter</span></a>
                                        </td>
                                        <td id="Td1">
                                            <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                All Records</span></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                            </td>
                            <td style="text-align: right; vertical-align: top">
                                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                    Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                    ValueType="System.Int32" Width="130px">
                                    <items>
                            <dxe:ListEditItem Text="Select" Value="0"/>
                            <dxe:ListEditItem Text="PDF" Value="1" />
                            <dxe:ListEditItem Text="XLS" Value="2" />
                            <dxe:ListEditItem Text="RTF" Value="3" />
                            <dxe:ListEditItem Text="CSV" Value="4" />
                        </items>
                                    <buttonstyle backcolor="#C0C0FF" forecolor="Black">
                        </buttonstyle>
                                    <itemstyle backcolor="Navy" forecolor="White">
                            <HoverStyle BackColor="#8080FF" ForeColor="White">
                            </HoverStyle>
                        </itemstyle>
                                    <border bordercolor="White" />
                                    <dropdownbutton text="Export">
                        </dropdownbutton>
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="GroupMasterGrid" runat="server" ClientInstanceName="grid"
                        AutoGenerateColumns="False" Width="995px" KeyFieldName="Id" OnAutoFilterCellEditorInitialize="GroupMasterGrid_AutoFilterCellEditorInitialize"
                        DataSourceID="GroupMaster" OnHtmlEditFormCreated="GroupMasterGrid_HtmlEditFormCreated"
                        OnHtmlRowCreated="GroupMasterGrid_HtmlRowCreated" OnCellEditorInitialize="GroupMasterGrid_CellEditorInitialize"
                        OnInitNewRow="GroupMasterGrid_InitNewRow" OnCustomCallback="GroupMasterGrid_CustomCallback"
                        OnRowValidating="GroupMasterGrid_RowValidating" OnRowUpdating="GroupMasterGrid_RowUpdating"
                        OnRowInserting="GroupMasterGrid_RowInserting" OnCustomJSProperties="GroupMasterGrid_CustomJSProperties"
                        OnStartRowEditing="GroupMasterGrid_StartRowEditing" OnRowDeleting="GroupMasterGrid_RowDeleting">
                        <ClientSideEvents EndCallback="function(s, e) {
	HideGroupType(s.cpvarHide);
}"></ClientSideEvents>
                        <Templates>
                            <EditForm>
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td class="gridcellright">
                                                        Group Type</td>
                                                    <td>
                                                        <dxe:ASPxComboBox ID="GroupType" Text='<%#Bind("GroupType") %>' runat="server" ValueType="System.String"
                                                            SelectedIndex="0" ClientInstanceName="GroupType" Width="400px">
                                                            <items>
                                             <dxe:ListEditItem Text="Sub Broker" Value="Sub Broker" />
                                             <dxe:ListEditItem Text="Broker" Value="Broker" />
                                             <dxe:ListEditItem Text="Relationship Partner" Value="Relationship Partner" />
                                             <dxe:ListEditItem Text="Franchisee" Value="Franchisee" />
                                             <dxe:ListEditItem Text="Relationship Manager" Value="Relationship Manager" />
                                             <dxe:ListEditItem Text="Relationship Officer" Value="Relationship Officer" />
                                             <dxe:ListEditItem Text="Dealers" Value="Dealers" />
                                             <dxe:ListEditItem Text="Family" Value="Family" />
                                             <dxe:ListEditItem Text="Business Partner" Value="Business Partner" />
                                             <dxe:ListEditItem Text="Agents" Value="Agents" />
                                             <dxe:ListEditItem Text="Virtual DP" Value="Virtual DP" />
                                             <dxe:ListEditItem Text="DeliveryGroup" Value="DeliveryGroup" />
                                             </items>
                                                            <clientsideevents selectedindexchanged="function(s,e){OnTypeChanged(s);}" />
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="gridcellright">
                                                        Group Name</td>
                                                    <td>
                                                        <asp:TextBox ID="GroupName" runat="server" Text='<%#Bind("GroupName") %>' Width="400px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="gridcellright">
                                                        Group Code</td>
                                                    <td>
                                                        <asp:TextBox ID="GroupCode" runat="server" Text='<%#Bind("GroupCode") %>' Width="400px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="gridcellright">
                                                        Principal Group</td>
                                                    <td>
                                                        <%--<dxe:ASPxComboBox ID="PrincipalGroup"  DataSourceID="PrincipleGroup" ValueField="gpm_id" TextField="PrincipalGroup" Value='<%#Bind("PrincipalGroup") %>' EnableIncrementalFiltering="True" EnableSynchronization="False"  runat="server" ValueType="System.String" SelectedIndex="0" ClientInstanceName="PrincipalGroup1" Width="400px">
                                    
                                     </dxe:ASPxComboBox>--%>
                                                        <dxe:ASPxComboBox ID="PrincipalGroup" runat="server" EnableSynchronization="False"
                                                            EnableIncrementalFiltering="True" DataSourceID="PrincipleGroup" TextField="PrincipalGroup"
                                                            ValueField="gpm_id" ClientInstanceName="combo" Width="400px" ValueType="System.String"
                                                            Value='<%#Bind("PrincipalGroup") %>'>
                                                            <buttonstyle width="13px">
                  </buttonstyle>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="gridcellright">
                                                        Group Owner</td>
                                                    <td>
                                                        <%--<dxe:ASPxComboBox ID="GroupOwner" DataSourceID="SelectOwner" ValueField="cnt_internalId" TextField="GroupOwner" EnableIncrementalFiltering="True" EnableSynchronization="False" ValueType="System.String"  runat="server"  SelectedIndex="0"  ClientInstanceName="GroupOwner" Width="100px">
                                   <ClientSideEvents SelectedIndexChanged="function(s,e){OnOwnerChanged(s);}" />
                              </dxe:ASPxComboBox>--%>
                                                        <asp:TextBox ID="GroupOwner" runat="server" Width="400px" Text='<%#Bind("GroupOwner1") %>'></asp:TextBox>
                                                        <%--<asp:TextBox ID="GroupOwner_hidden" runat="server" Visible="true"></asp:TextBox>--%>
                                                        <asp:HiddenField runat="server" ID="GroupOwner_hidden" Visible="true" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="gridcellright">
                                                        Member Type</td>
                                                    <td>
                                                        <dxe:ASPxComboBox ID="MemberType" runat="server" Value='<%#Bind("MemberType") %>'
                                                            ValueType="System.String" SelectedIndex="0" ClientInstanceName="MemberType" Width="400px">
                                                            <items>
                                               <dxe:ListEditItem Text="Contacts" Value="Contacts" />
                                               <dxe:ListEditItem Text="Addresses" Value="Addresses" />
                                               <dxe:ListEditItem Text="Emails" Value="Emails" />
                                               <dxe:ListEditItem Text="Phones" Value="Phones" />
                                               <dxe:ListEditItem Text="CDSL Accounts" Value="CDSL Accounts" />
                                               <dxe:ListEditItem Text="NSDL Accounts" Value="NSDL Accounts" />
                                              </items>
                                                        </dxe:ASPxComboBox>
                                                    </td>
                                                </tr>
                                                <%--    For Email Editing--%>
                                                <tr>
                                                    <td class="gridcellright">
                                                        Email</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%#Bind("gpm_emailID") %>' Width="400px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="gridcellright">
                                                        CC Email</td>
                                                    <td>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%#Bind("gpm_ccemailID") %>' Width="400px"></asp:TextBox></td>
                                                </tr>
                                                <%--    For Email Editing--%>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 50%">
                                            <%-- <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="Editors">
                                </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                            </controls> --%>
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
                                </table>
                            </EditForm>
                        </Templates>
                        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                        <Styles>
                            <Header CssClass="gridheader" SortingImageSpacing="5px" ImageSpacing="5px">
                            </Header>
                            <FocusedRow CssClass="gridselectrow">
                            </FocusedRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                        </Styles>
                        <Settings ShowHorizontalScrollBar="true" />
                        <SettingsPager NumericButtonCount="20" PageSize="10" AlwaysShowPager="True" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="Id">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="GroupName">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                        <RequiredField IsRequired="True" ErrorText="Group Name Can Not Be Blank"></RequiredField>
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" VisibleIndex="1"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="GroupType">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="GroupCode">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="True" VisibleIndex="2"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="PrincipalGroup" Caption="Principal Group"
                                VisibleIndex="2">
                                <PropertiesComboBox ValueType="System.String" TextField="PrincipalGroup" ValueField="gpm_id"
                                    EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="PrincipleGroup">
                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnOwnerChanged(s);}"></ClientSideEvents>
                                </PropertiesComboBox>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" VisibleIndex="3"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn ReadOnly="True" VisibleIndex="4" FieldName="PrincipalGroup1"
                                Caption="Principal Group">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="GroupOwner1" Caption="Group Owner">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="GroupOwner" Caption="Group Owner">
                                <PropertiesComboBox ValueType="System.String" TextField="GroupOwner" ValueField="cnt_internalId"
                                    EnableIncrementalFiltering="True" EnableSynchronization="False" DataSourceID="SelectOwner">
                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnOwnerChanged(s);}"></ClientSideEvents>
                                </PropertiesComboBox>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" VisibleIndex="4"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="GroupType" Caption="Group Type"
                                VisibleIndex="6">
                                <PropertiesComboBox ValueType="System.String">
                                    <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                        <RequiredField IsRequired="True" ErrorText="Select Group Type"></RequiredField>
                                    </ValidationSettings>
                                    <ClientSideEvents SelectedIndexChanged="function(s,e){OnTypeChanged(s);}"></ClientSideEvents>
                                    <Items>
                                        <dxe:ListEditItem Value="Sub Broker" Text="Sub Broker">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Broker" Text="Broker">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Relationship Partner" Text="Relationship Partner">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Franchisee" Text="Franchisee">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Relationship Manager" Text="Relationship Manager">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Relationship Officer" Text="Relationship Officer">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Dealers" Text="Dealers">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Family" Text="Family">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Business Partner" Text="Business Partner">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Agents" Text="Agents">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Virtual DP" Text="Virtual DP">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="DeliveryGroup" Text="DeliveryGroup">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                </EditFormCaptionStyle>
                                <EditFormSettings Caption="Group Type" Visible="True" VisibleIndex="0"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="MemberType" Caption="Member Type" VisibleIndex="5">
                                <PropertiesComboBox ValueType="System.String">
                                    <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                        <RequiredField IsRequired="True" ErrorText="Select Member Type"></RequiredField>
                                    </ValidationSettings>
                                    <Items>
                                        <dxe:ListEditItem Value="Contacts" Text="Contacts">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Addresses" Text="Addresses">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Emails" Text="Emails">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="Phones" Text="Phones">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="CDSL Accounts" Text="CDSL Accounts">
                                        </dxe:ListEditItem>
                                        <dxe:ListEditItem Value="NSDL Accounts" Text="NSDL Accounts">
                                        </dxe:ListEditItem>
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                </EditFormCaptionStyle>
                                <EditFormSettings Caption="Member Type" Visible="True"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="6" FieldName="gpm_emailID" Caption="Email">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                        <RegularExpression ErrorText="Enetr Valid E-Mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </RegularExpression>
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" VisibleIndex="1"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="gpm_ccemailID" Caption="CC EmailID">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <PropertiesTextEdit>
                                    <ValidationSettings SetFocusOnError="True" ErrorDisplayMode="ImageWithText" ErrorTextPosition="Bottom">
                                        <RegularExpression ErrorText="Enetr Valid E-Mail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                        </RegularExpression>
                                    </ValidationSettings>
                                </PropertiesTextEdit>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Right" VerticalAlign="Top">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True" VisibleIndex="1"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="8" Caption="Add Member">
                                <DataItemTemplate>
                                    <a href="#" onclick="OnMoreInfoClick('<%# Container.KeyValue %>','<%#Eval("GroupName") %>','<%#Eval("MemberType") %>')">
                                        Add</a>
                                </DataItemTemplate>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="9">
                                <HeaderTemplate>
                                    <%-- <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                      { %>--%>
                                    <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                        text-decoration: underline">Add New Group</span> </a>
                                    <%-- <%} %>--%>
                                </HeaderTemplate>
                                <EditButton Visible="True">
                                </EditButton>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="10"  Caption="Details">
                                <HeaderStyle HorizontalAlign="Left"></HeaderStyle>
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">Delete</a>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <HeaderTemplate>
                                    <span style="color: #000099; text-decoration: underline">Delete</span>
                                </HeaderTemplate>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="400px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="TopSides" PopupEditFormWidth="700px"
                            EditFormColumnCount="1" />
                        <SettingsText PopupEditFormCaption="Add/Modify GroupMaster" ConfirmDelete="Are You Sure To Delete This Record ???" />
                        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="PrincipleGroup" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT gpm_id, gpm_Description as PrincipalGroup FROM tbl_master_groupMaster">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SelectOwner" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="Select_Owner" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="Owner" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="GroupMaster" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT gpm_id AS Id, gpm_Description AS GroupName,gpm_code as GroupCode, gpm_Type AS GroupType, gpm_Owner AS GroupOwner,(select ISNULL(ltrim(rtrim(cnt_firstName)), '') + ' ' + ISNULL(cnt_middleName, '') + ' ' + ISNULL(cnt_lastName, '')+' ['+case when cnt_internalId like 'CL%' then ltrim(rtrim(cnt_UCC)) else cnt_shortName end+']' as Name from tbl_master_contact where cnt_internalId=tbl_master_groupMaster.gpm_Owner ) AS GroupOwner1,gpm_MemberType AS MemberType, CASE WHEN gpm_PrincipalGroup = 0 THEN 'None' ELSE (SELECT a.gpm_Description FROM tbl_master_groupMaster a WHERE a.gpm_id = tbl_master_groupMaster.gpm_PrincipalGroup) END AS PrincipalGroup,CASE WHEN gpm_PrincipalGroup = 0 THEN 'None' ELSE (SELECT a.gpm_Description FROM tbl_master_groupMaster a WHERE a.gpm_id = tbl_master_groupMaster.gpm_PrincipalGroup) END AS PrincipalGroup1,gpm_emailID,gpm_ccemailID FROM tbl_master_groupMaster"
            ConflictDetection="CompareAllValues" InsertCommand="INSERT INTO [tbl_master_groupMaster] ([gpm_Description],[gpm_code], [gpm_Type], [gpm_Owner], [gpm_MemberType], [gpm_PrincipalGroup], [CreateDate], [CreateUser],[gpm_emailID],[gpm_ccemailID]) VALUES (@GroupName,@GroupCode, @GroupType, @GroupOwner, @MemberType, @PrincipalGroup, getdate(), @CreateUser,@gpm_emailID,@gpm_ccemailID)"
            OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tbl_master_groupMaster] SET [gpm_Description] = @GroupName,[gpm_code] = @GroupCode, [gpm_Type] = @GroupType, [gpm_Owner] = @GroupOwner, [gpm_MemberType] = @MemberType, [gpm_PrincipalGroup] = @PrincipalGroup, [LastModifyDate] = getdate(), [LastModifyUser] = @CreateUser,gpm_emailID=@gpm_emailID,gpm_ccemailID=@gpm_ccemailID WHERE [gpm_id] = @Id">
            <%-- 
           DeleteCommand="DELETE FROM [tbl_master_groupMaster] WHERE [gpm_id] = @original_Id"
           <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="Decimal" />
            </DeleteParameters>--%>
            <UpdateParameters>
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="GroupType" Type="String" />
                <asp:Parameter Name="GroupCode" Type="String" />
                <asp:Parameter Name="GroupOwner" Type="String" />
                <asp:Parameter Name="MemberType" Type="String" />
                <asp:Parameter Name="PrincipalGroup" Type="Decimal" />
                <asp:Parameter Name="CreateDate" Type="String" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                <asp:Parameter Name="Id" Type="Decimal" />
                <asp:Parameter Name="gpm_emailID" Type="String" />
                <asp:Parameter Name="gpm_ccemailID" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="GroupType" Type="String" />
                <asp:Parameter Name="GroupCode" Type="String" />
                <asp:Parameter Name="GroupOwner" Type="String" />
                <asp:Parameter Name="MemberType" Type="String" />
                <asp:Parameter Name="PrincipalGroup" Type="Decimal" />
                <asp:Parameter Name="CreateDate" Type="String" />
                <asp:Parameter Name="gpm_emailID" Type="String" />
                <asp:Parameter Name="gpm_ccemailID" Type="String" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        <br />
    </form>
</body>
</html>
