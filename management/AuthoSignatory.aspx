<%@ page language="C#" autoeventwireup="true" inherits="management_AuthoSignatory, App_Web_1jeyysc_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
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
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	
	</style>

    <script language="javascript" type="text/javascript">
    function CallList(obj1,obj2,obj3)
    {
       
        ajax_showOptions(obj1,obj2,obj3);
        FieldName='Label3';
        
    }
    function ShowMessage(obj)
    {
        if(obj=='Duplicate')
        {
            alert('Duplicate entry not allowed');
        }
    }
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain99">
            <tr>
                <td style="width: 90%">
                    <dxwgv:ASPxGridView ID="gridSignatory" runat="server" Width="100%" ClientInstanceName="gridSignatory"
                        AutoGenerateColumns="False" KeyFieldName="AuthorizedSignatory_ID" DataSourceID="SqlSignatory"
                        OnHtmlEditFormCreated="gridSignatory_HtmlEditFormCreated" OnRowInserting="gridSignatory_RowInserting1"
                        OnStartRowEditing="gridSignatory_StartRowEditing" OnRowUpdating="gridSignatory_RowUpdating"
                        OnRowDeleting="gridSignatory_RowDeleting" OnCustomJSProperties="gridSignatory_CustomJSProperties">
                        <Templates>
                            <EditForm>
                                <table class="TableMain100">
                                    <tr>
                                        <td style="border: solid 1px blue; width: 80%">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="Employee:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TxtEmployee" runat="server" Text='<%#Bind("AuthorizedSignatory_EmployeeID") %>'></asp:TextBox>
                                                        <asp:HiddenField ID="TxtEmployee_hidden" runat="server" />
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label4" runat="server" Text="From Date:"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="ASPxStartDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                            Width="171px" EditFormatString="dd-MM-yyyy">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxDateEdit ID="ASPxTodate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                            Width="171px" EditFormatString="dd-MM-yyyy">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td>
                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                            runat="server">
                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                        <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                            runat="server">
                                                        </dxwgv:ASPxGridViewTemplateReplacement>
                                                        <asp:HiddenField ID="hdid" runat="server" />
                                                    </td>
                                                </tr>
                                               
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </EditForm>
                        </Templates>
                        <Styles>
                            <Header SortingImageSpacing="5px" ImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <Settings ShowGroupPanel="True" ShowTitlePanel="True" ShowFooter="True" ShowStatusBar="Visible">
                        </Settings>
                        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True"></SettingsBehavior>
                        <SettingsPager AlwaysShowPager="True" PageSize="20" NumericButtonCount="20" ShowSeparators="True">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="AuthorizedSignatory_ID">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Visible="False" ReadOnly="True" VisibleIndex="0" FieldName="AuthorizedSignatory_CompanyID">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="AuthorizedSignatory_SegmentID" VisibleIndex="0"
                                Visible="false">
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Visible="false" FieldName="AuthorizedSignatory_EmployeeID"
                                Width="50%" Caption="Employee">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="1" FieldName="name" Width="30%" Caption="Employee">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="2" FieldName="AuthorizedSignatory_DateFrom"
                                Width="500px" Caption="From Date">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="AuthorizedSignatory_DateTo"
                                Caption="To Date" Width="500px">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle Wrap="False" HorizontalAlign="Left">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="True"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="4">
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="gridSignatory.AddNewRow();"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                </HeaderTemplate>
                                <EditButton Visible="True">
                                </EditButton>
                            </dxwgv:GridViewCommandColumn>
                        </Columns>
                        <ClientSideEvents EndCallback="function(s,e){ShowMessage(s.cpValue)}" />
                    </dxwgv:ASPxGridView>
                    <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <input id="Button1" type="button" value="Cancel" onclick="parent.editwin1.close()" />
                </td>
            </tr>
            <asp:SqlDataSource ID="SqlSignatory" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                SelectCommand="select AuthorizedSignatory_ID,AuthorizedSignatory_CompanyID,AuthorizedSignatory_SegmentID,AuthorizedSignatory_EmployeeID,convert(varchar(11),AuthorizedSignatory_DateFrom,113)as AuthorizedSignatory_DateFrom, case AuthorizedSignatory_DateTo when '1900-01-01 00:00:00.000' then '' else (convert(varchar(11),AuthorizedSignatory_DateTo,113)) end as AuthorizedSignatory_DateTo ,isnull(cnt_firstname,'')+' '+isnull(cnt_middlename,'')+' '+isnull(cnt_lastname,'') as name from tbl_master_contact as a inner join Master_AuthorizedSignatory as b on a.cnt_internalid=b.AuthorizedSignatory_EmployeeID where b.AuthorizedSignatory_SegmentID=@AuthorizedSignatory_SegmentID ORDER BY AuthorizedSignatory_ID"
                InsertCommand="insert into table1 values(1)" UpdateCommand="update table1 set temp123=1"
                DeleteCommand="delete from table1">
                <SelectParameters>
                    <asp:SessionParameter Name="AuthorizedSignatory_SegmentID" SessionField="KeyVal"
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </table>
    </form>
</body>
</html>
