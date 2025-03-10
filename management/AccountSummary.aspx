<%@ page language="C#" autoeventwireup="true" inherits="management_AccountSummary, App_Web_cvaj-tqf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Account Summary</title>
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
   
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
</head>
<body  style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
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
     function CallList(obj1,obj2,obj3)
     {
     FieldName='ctl00$ContentPlaceHolder3$txtAccountName_hidden';
          ajax_showOptions(obj1,obj2,obj3);
     }
      function AccountSummary(obj1,obj2,obj3)
     {
     alert(obj1);
      alert(obj2);
       alert(obj3);
       var aaaa=obj2;
     url1="frm_AccountSummary.aspx?id="+aaaa+"&name="+obj3+"";
    // alert(url1);
     window.open(url1,'popupwindow','left=10,top=10,height=550,width=950,scrollbars=yes,toolbar=no,location=center,menubar=no')
     return false;
     }
     
    </script>
<table class="TableMain100"><tr><td align="center">
    <table border="2" style="color: Red; position: static;">
        <tr>
            <td style="text-align: center; width: 150px; font-size: small; font-style: normal;">
                Select Account</td>
            <td>
                <table>
                    <tr style="width: 600px;">
                        <td>
                            <asp:RadioButtonList ID="RadioButtonSelect" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged_RadioButtonSelect"
                                AutoPostBack="true" Width="100px" RepeatDirection="Horizontal">
                                <asp:ListItem Text="All" Value="A" Selected="True"> </asp:ListItem>
                                <asp:ListItem Text="Specific" Value="S"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:TextBox ID="txtAccountName" runat="server" Width="203px"></asp:TextBox>
                            <asp:HiddenField ID="txtAccountName_hidden" runat="server" />
                        </td>
                        <td style="">
                            
                            <asp:Button ID="btnGo" runat="server" Text="Go" CssClass="btnUpdate" OnClick="btnGo_Click" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
       
    </table>
    </td></tr></table>
    <dxwgv:ASPxGridView ID="AccountGroup" runat="server" ClientInstanceName="grid" AutoGenerateColumns="False"
        DataSourceID="SqlDsAccountGroup" Width="100%" KeyFieldName="MainAccount_ReferenceID"
        OnHtmlFooterCellPrepared="AccountGroup_OnHtmlFooterCellPrepared" OnHtmlEditFormCreated="AccountGroup_HtmlEditFormCreated"
        OnRowUpdating="AccountGroup_RowUpdating" OnRowValidating="AccountGroup_RowValidating"
        OnParseValue="AccountGroup_ParseValue" OnRowInserting="AccountGroup_RowInserting"
        OnStartRowEditing="AccountGroup_StartRowEditing">
        <Columns>
            <dxwgv:GridViewDataTextColumn Caption="Code" FieldName="AccountCode" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Name" FieldName="AccountName" VisibleIndex="1">
                <EditFormSettings Visible="False" VisibleIndex="2" />
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Opnning Dr." FieldName="openingCR" VisibleIndex="2">
                <EditFormSettings Visible="False" VisibleIndex="3" />
                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                </EditFormCaptionStyle>
                
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataTextColumn Caption="Opening Cr." FieldName="openingDR" VisibleIndex="3">
                <EditFormSettings Visible="False" VisibleIndex="4" />
                <EditFormCaptionStyle HorizontalAlign="Right" VerticalAlign="Top" Wrap="False">
                </EditFormCaptionStyle>
            </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewCommandColumn VisibleIndex="4">
                <EditButton Visible="True">
                </EditButton>
            </dxwgv:GridViewCommandColumn>
        </Columns>
        <Styles>
            <Header ImageSpacing="5px" SortingImageSpacing="5px">
            </Header>
            <LoadingPanel ImageSpacing="10px">
            </LoadingPanel>
        </Styles>
        <SettingsText PopupEditFormCaption="Add/Modify Account Group" />
        <SettingsPager NumericButtonCount="20" PageSize="20" AlwaysShowPager="True" ShowSeparators="True">
            <FirstPageButton Visible="True">
            </FirstPageButton>
            <LastPageButton Visible="True">
            </LastPageButton>
        </SettingsPager>
        <SettingsEditing Mode="Inline" />
        <Templates>
            <EditForm>
               
                <tr>
                    <td>
                        <controls>
                        <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors" ColumnID="" ID="ASPxGridViewTemplateReplacement1">
                         </dxwgv:ASPxGridViewTemplateReplacement>                                                           
                      </controls>
                        <div style="text-align: center; padding: 2px 2px 2px 2px">
                            <dxwgv:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement2" ReplacementType="EditFormUpdateButton"
                                runat="server">
                            </dxwgv:ASPxGridViewTemplateReplacement>
                            <dxwgv:ASPxGridViewTemplateReplacement ID="ASPxGridViewTemplateReplacement3" ReplacementType="EditFormCancelButton"
                                runat="server">
                            </dxwgv:ASPxGridViewTemplateReplacement>
                        </div>
                    </td>
                </tr>
                
                <table style="width: 100%">
                    <tr>
                        <td style="width: 25%">
                        </td>
                        <td style="width: 50%">
                            <controls>
                                <dxwgv:ASPxGridViewTemplateReplacement runat="server" ReplacementType="EditFormEditors"  ID="Editors">
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
                                            Height="18px" Width="88px" 
                                             AutoPostBack="False">
                                            <ClientSideEvents Click="function(s, e) {grid.AddNewRow();}" />
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
 
    <asp:SqlDataSource ID="SqlDsAccountGroup" runat="server" ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>"
        InsertCommand="insert into table1 (temp123) values('0010')" SelectCommand=""
        UpdateCommand="update table1 set temp123='123'"></asp:SqlDataSource>
    </form>
</body>
</html>
