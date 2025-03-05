<%@ page language="C#" autoeventwireup="true" inherits="management_UploadDigitalSignature_AuthUser, App_Web_8qixh_8w" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script src="../JSFUNCTION/init.js" type="text/javascript"></script>

    <script src="../JSFUNCTION/ajax-dynamic-list.js" type="text/javascript"></script>

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
   function SignOff()
    {
        window.parent.SignOff();
    }
    function PageLoad()
    {
    FieldName='A4'; 

      document.getElementById('txtValidUser_hidden').style.display="none";

    }
    function CallAjax(obj1,obj2,obj3)
         {
          ajax_showOptions(obj1,obj2,obj3);
         }
    function ShowHideFilter(obj) 
    { 
    grid.PerformCallback(obj);
    }
    function closeWin()
        {
        parent.editwin.close();
       // parent.DhtmlClose();
        }
    
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table id="tblSummary" border="0" cellpadding="0" cellspacing="0" class="TableMain100"
            style="width: 100%; padding-right: 0px; padding-left: 0px; padding-bottom: 0px;
            padding-top: 0px;">
            <tr>
                <td colspan="2" style="text-align: left;">
                </td>
                <td class="gridcellright" colspan="4" valign="top">
                </td>
            </tr>
            <tr>
                <td colspan="6" style="text-align: left">
                    <dxwgv:ASPxGridView ID="gridAuthUser" runat="server" AutoGenerateColumns="False"
                        ClientInstanceName="grid" KeyFieldName="col" Width="100%" OnRowDeleting="gridAuthUser_RowDeleting"
                        OnRowInserting="gridAuthUser_RowInserting">
                        <templates><EditForm>
                                <table>
                                    <tr>
                                        <td>
                                            Name:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtValidUser" runat="server" onkeyup="CallAjax(this,'SearchEmployeesForDigitalSignatureUser',event)"
                                                Width="238px"></asp:TextBox>
                                            <asp:HiddenField ID="txtValidUser_hidden" runat="server" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnAdd" runat="server" AutoPostBack="False" Text="Add" ValidationGroup="a">
                                                            <ClientSideEvents Click="function(s, e) {grid.UpdateEdit();}" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dxe:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" Text="Cancel"
                                                            ValidationGroup="a">
                                                            <ClientSideEvents Click="function(s, e) {grid.CancelEdit();}" />
                                                        </dxe:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            
</EditForm>
</templates>
                        <settingsbehavior allowfocusedrow="True" confirmdelete="True" />
                        <styles>
<Header CssClass="gridheader"></Header>

<FocusedGroupRow CssClass="gridselectrow"></FocusedGroupRow>

<FocusedRow CssClass="gridselectrow"></FocusedRow>
</styles>
                        <settingspager alwaysshowpager="True" showseparators="True">
<FirstPageButton Visible="True"></FirstPageButton>

<LastPageButton Visible="True"></LastPageButton>
</settingspager>
                        <columns>
<dxwgv:GridViewDataTextColumn FieldName="name" Caption="Name" VisibleIndex="0">
<Settings FilterMode="DisplayText" AutoFilterCondition="Contains"></Settings>

<CellStyle Wrap="False" CssClass="gridcellleft"></CellStyle>
</dxwgv:GridViewDataTextColumn>
<dxwgv:GridViewCommandColumn Width="10%" VisibleIndex="1">
<DeleteButton Visible="True"></DeleteButton>
<HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span> </a>
                                
</HeaderTemplate>
</dxwgv:GridViewCommandColumn>
</columns>
                        <settings showstatusbar="Visible" />
                        <styleseditors>
<ProgressBar Height="25px"></ProgressBar>
</styleseditors>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
            <tr>
                <td colspan="6" style="text-align: left; padding-left: 10px">
                    <br />
                    <asp:Button ID="btnClose" runat="server" CssClass="btnUpdate" Height="23px" OnClientClick="javascript:closeWin();"
                        Text="Close" Width="101px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
