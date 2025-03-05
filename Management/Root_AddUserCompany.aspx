<%@ page language="C#" autoeventwireup="true" inherits="management_Root_AddUserCompany, App_Web_2wstwz9u" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add User Company</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

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

    <script language="javascript" type="text/javascript">
	     function showOptions(obj1,obj2,obj3)
         {
           ajax_showOptions(obj1,obj2,obj3);          
         }
         
    function CallGrid()
     { 
      
       grid.PerformCallback();
     }
     
    function DeleteRow(keyValue)
    {
           doIt=confirm('Are You Want To Delete This Record ???');
            if(doIt)
                {
                   grid.PerformCallback(keyValue);
                   height();
                }
            else{
                  
                }

   
    }
         FieldName='BtnSave';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center">
                        <strong>Add Company </strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr>
                                        <td>
                                            Select Company:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtContact" runat="server" Width="300px"></asp:TextBox>
                                            <asp:HiddenField ID="txtContact_hidden" runat="server" />
                                        </td>
                                        <td>
                                            <asp:Button ID="BtnSave" runat="server" Text="Add" CssClass="btnUpdate" OnClick="BtnSave_Click" />
                                            <asp:Button ID="BtnCancel" runat="server" CssClass="btnUpdate" Text="Cancel" OnClick="BtnCancel_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: left" visible="false">
                                            <asp:HiddenField ID="txtID" runat="server" />
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="GridName" runat="server" KeyFieldName="UserCompany_ID" AutoGenerateColumns="False"
                            DataSourceID="SelectName" ClientInstanceName="grid" Width="100%" OnCustomCallback="GridName_CustomCallback">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn FieldName="Company" ReadOnly="True" VisibleIndex="0"
                                    Width="80%">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn FieldName="UserCompany_CompanyID" ReadOnly="True" Visible="false">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn VisibleIndex="8" Width="60px" Caption="Details">
                                    <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                    <DataItemTemplate>
                                       <a href="javascript:void(0);" onclick="DeleteRow('<%# Container.KeyValue %>')">
                                                Delete</a>
                                    </DataItemTemplate>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                    <HeaderTemplate> 
                                    ##                                    
                                    </HeaderTemplate>
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dxwgv:GridViewDataTextColumn>
                              
                            </Columns>
                            <Styles>
                                <LoadingPanel ImageSpacing="10px">
                                </LoadingPanel>
                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                </Header>
                            </Styles>
                            <SettingsText ConfirmDelete="Are You Sure To Delete This Record ???" />
                            <SettingsBehavior ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SelectName" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" >
                 </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
