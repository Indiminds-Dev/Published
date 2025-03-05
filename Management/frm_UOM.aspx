<%@ page language="C#" autoeventwireup="true" inherits="management_frm_UOM, App_Web_sjbhlkdr" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

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
		z-index:32767;
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
		z-index:3000;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">

    <script language="javascript" type="text/javascript">
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

    function PopulateGrid(obj)
 {
 
   grid.PerformCallback(obj);
 }
    function Changestatus(obj)
    {
      var URL="changeunit.aspx?id="+obj;
      editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Change Unit", "width=995px,height=300px,center=0,resize=1,top=-1", "recal");                 
      editwin.onclose=function()
             {
                 grid.PerformCallback();
             }
    }
    function ShowHideFilter(obj)
    {
        grid.PerformCallback(obj);
    } 
    function callback()
        {
            grid.PerformCallback();
        } 
    function callheight(obj)
    {
        height();
        parent.CallMessage();
    }
    </script>

    <%--</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">--%>
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Units Of Measurement [UOM] </span></strong>
                    </td>
                </tr>
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
                                <td style="width: 750px;">
                                </td>
                                <td class="gridcellright" align="right" id="td_export" runat="server">
                                    <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Gray"
                                        Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                        ValueType="System.Int32" Width="80px">
                                        <items>
                                                            <dxe:ListEditItem Text="Select" Value="0" />
                                                            <%--<dxe:ListEditItem Text="PDF" Value="1" />--%>
                                                            <dxe:ListEditItem Text="XLS" Value="2" />
                                                            <%--<dxe:ListEditItem Text="RTF" Value="3" />--%>
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
                        <dxwgv:ASPxGridView ID="grdDocuments" runat="server" AutoGenerateColumns="False"
                            KeyFieldName="tmp_id" Width="98%" OnRowDeleting="grdDocuments_RowDeleting" ClientInstanceName="grid"
                            OnCustomCallback="grdDocuments_CustomCallback" OnHtmlRowCreated="grdDocuments_HtmlRowCreated">
                            <Templates>
                                <TitlePanel>
                                    <table style="width: 100%">
                                        <tr>
                                            <td align="right">
                                                <table width="200px">
                                                    <tr>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </TitlePanel>
                                <EditForm>
                                </EditForm>
                            </Templates>
                            <Settings ShowGroupPanel="True" />
                            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="tmp_id" ReadOnly="True" VisibleIndex="0"
                                    Visible="false">
                                    <CellStyle HorizontalAlign="Left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="tmp_name" Caption="Name" Width="25%" ReadOnly="True"
                                    VisibleIndex="0">
                                    <CellStyle HorizontalAlign="left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="tmp_usedfor" Caption="Used For" Width="22%"
                                    VisibleIndex="1" Visible="true">
                                    <CellStyle HorizontalAlign="left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="tmp_shortname" Caption="Short Name" Width="22%"
                                    VisibleIndex="2">
                                    <CellStyle HorizontalAlign="left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="tmp_convuomname" Caption="Converted To"
                                    Width="22%" VisibleIndex="3">
                                    <CellStyle HorizontalAlign="left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                               <dxwgv:GridViewDataTextColumn FieldName="change" Caption="Change" Width="7%" VisibleIndex="4">
                                    <CellStyle HorizontalAlign="left">
                                    </CellStyle>
                                    <HeaderStyle HorizontalAlign="left" />
                                </dxwgv:GridViewDataTextColumn>
                                <%--<dxwgv:GridViewCommandColumn VisibleIndex="4">
                                <EditButton Visible="True">
                                </EditButton>
                                <DeleteButton Visible="True">
                                </DeleteButton>
                                <HeaderStyle HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <%if (Session["PageAccess"].ToString().Trim() == "All" || Session["PageAccess"].ToString().Trim() == "Add" || Session["PageAccess"].ToString().Trim() == "DelAdd")
                      { %>
                                    <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                    <%} %>
                                </HeaderTemplate>
                            </dxwgv:GridViewCommandColumn>--%>
                            </Columns>
                            <%--<SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="NextColumn" />--%>
                            <Settings ShowGroupPanel="True" ShowStatusBar="Visible" />
                            <Styles>
                            <Header SortingImageSpacing="5px" ImageSpacing="5px" CssClass="gridheader"></Header>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                                <FocusedGroupRow CssClass="gridselectrow">
                                </FocusedGroupRow>
                                <FocusedRow CssClass="gridselectrow">
                                </FocusedRow>
                            </Styles>
                            <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True" AlwaysShowPager="True">
                                <FirstPageButton Visible="True">
                                </FirstPageButton>
                                <LastPageButton Visible="True">
                                </LastPageButton>
                            </SettingsPager>
                           <SettingsEditing Mode="PopupEditForm" PopupEditFormHeight="200px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="600px"
                            EditFormColumnCount="1" />
                            <SettingsText PopupEditFormCaption="Add/Modify " ConfirmDelete="Are you sure to Delete this Record!" />
                           <%-- <ClientSideEvents EndCallback="function(s, e) {
	callheight(s.cpHeight);
}" />--%>
<%-- <Templates>
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
                        </Templates>--%>
                        </dxwgv:ASPxGridView>
                        <%--   <asp:SqlDataSource ID="grddoc" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
                            SelectCommand="" DeleteCommand="DELETE FROM [tbl_master_forms] WHERE [frm_id] = @formID">
                            <DeleteParameters>
                                <asp:Parameter Name="formID" Type="int32" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="userlist" SessionField="userchildHierarchy" Type="string" />
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                    </td>
                </tr>
                <tr>
                    <td style="display: none;">
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                </tr>
            </table>
            <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
            </dxwgv:ASPxGridViewExporter>
        </div>
    </form>
</body>
</html>
