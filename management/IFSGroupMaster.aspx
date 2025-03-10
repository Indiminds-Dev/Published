<%@ page language="C#" autoeventwireup="true" inherits="management_IFSGroupMaster, App_Web__yen2upk" %>

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
    
    function ShowMessage(obj)
    {
        if(obj=='D')
        {
            alert('This Group is already tagged.You Can not Delete.');
        }
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

        function OnMoreInfoClick(keyValue,name,type) 
        {           
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
                    <dxwgv:ASPxGridView ID="GroupMasterGrid" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False" Width="800px" KeyFieldName="Id" 
                        DataSourceID="GroupMaster" OnHtmlEditFormCreated="GroupMasterGrid_HtmlEditFormCreated"
                        OnInitNewRow="GroupMasterGrid_InitNewRow" OnCustomCallback="GroupMasterGrid_CustomCallback"
                        OnRowValidating="GroupMasterGrid_RowValidating" OnCustomJSProperties="GroupMasterGrid_CustomJSProperties"
                        OnStartRowEditing="GroupMasterGrid_StartRowEditing" OnRowDeleting="GroupMasterGrid_RowDeleting">
                        <Templates>
                            <EditForm>
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td class="gridcellright">
                                                        Group Code</td>
                                                    <td>
                                                        <asp:TextBox ID="GroupCode" runat="server" Text='<%#Bind("GroupCode") %>' Width="200px"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td class="gridcellright">
                                                        Group Name</td>
                                                    <td>
                                                        <asp:TextBox ID="GroupName" runat="server" Text='<%#Bind("GroupName") %>' Width="400px"></asp:TextBox></td>
                                                </tr>                                                
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 50%">
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
                            
                            <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="GroupCode" Caption="Group Code" Width="150px">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="True" VisibleIndex="2"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="GroupName" Caption="Group Name" Width="400px">
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
                            <dxwgv:GridViewCommandColumn VisibleIndex="2" Width="300px">
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                        text-decoration: underline">Add New Group</span> </a>
                                </HeaderTemplate>
                                <EditButton Visible="True">
                                </EditButton>
                            </dxwgv:GridViewCommandColumn>
                            
                            <dxwgv:GridViewDataTextColumn VisibleIndex="3" Caption="Details" Width="50px">
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
                        <ClientSideEvents EndCallback="function(s,e){ShowMessage(s.cpValue)}" />
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="150px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="TopSides" PopupEditFormWidth="650px"
                            EditFormColumnCount="1" />
                        <SettingsText PopupEditFormCaption="Add/Modify GroupMaster" ConfirmDelete="Are You Sure To Delete This Record ???" />
                        <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="GroupMaster" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="SELECT IfsGroup_ID AS Id, IfsGroup_Code as GroupCode, IfsGroup_Name AS GroupName FROM Master_IfsGroup"
            ConflictDetection="CompareAllValues" InsertCommand="INSERT INTO [Master_IfsGroup] ([IfsGroup_Code],[IfsGroup_Name], [IfsGroup_CreateTime], [IfsGroup_CreateUser]) VALUES (@GroupCode,@GroupName,getdate(), @CreateUser)"
            OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Master_IfsGroup] SET [IfsGroup_Code] = @GroupCode,[IfsGroup_Name] = @GroupName, [IfsGroup_ModifyTime] = getdate(), [IfsGroup_ModifyUser] = @CreateUser WHERE [IfsGroup_ID] = @Id">
            <UpdateParameters>
                <asp:Parameter Name="GroupCode" Type="String" />
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="CreateDate" Type="String" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
                <asp:Parameter Name="Id" Type="Decimal" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="GroupCode" Type="String" />
                <asp:Parameter Name="GroupName" Type="String" />
                <asp:Parameter Name="CreateDate" Type="String" />
                <asp:SessionParameter Name="CreateUser" SessionField="userid" Type="Decimal" />
            </InsertParameters>
        </asp:SqlDataSource>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        <br />
    </form>
</body>
</html>
