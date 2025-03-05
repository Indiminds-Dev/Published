<%@ page language="C#" autoeventwireup="true" inherits="management_frmbulkemail_attachment, App_Web_vvdfezxa" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
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
    </script>

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
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
<script language="javascript" type="text/javascript">
    
    //function is called on changing Selection
    
    function OnGridServerSelectAll(obj)
    {
        OnGridSelectionChanged();
    }
    function OnGridSelectionChanged() 
    {
        gridLocal.GetSelectedFieldValues('filepathServer', OnGridSelectionComplete);
    }
    function OnGridSelectionComplete(values) 
    {
        counter = 'n';
        for(var i = 0; i < values.length; i ++) 
        {
            if(counter != 'n')
                counter += ',' + values[i];
            else
                counter = values[i];
        }
        //alert(counter);
    }
</script>
<script type="text/javascript" language="javascript">
    function AtTheTimePageLoad()
    {
        counter='n';
        FieldName='chkAttachment';
        document.getElementById("trSave").style.display='none';
        document.getElementById("trGrid").style.display='none';
        document.getElementById("trAttachment").style.display='none';
        document.getElementById("trAttachmentBody").style.display='none';
        document.getElementById("trDocument").style.display='none';
        var check = document.getElementById("chkAttachment");
        check.checked = false;
        checkAttachmentclick(false);
    }
    function checkAttachmentclick(obj)
    {
        if(obj==false)
        {
            document.getElementById("tdBrowse").style.display='none';
            document.getElementById("UploadAttachment").style.display='none';
        }
        if(obj==true)
        {
            document.getElementById("tdBrowse").style.display='inline';
            document.getElementById("UploadAttachment").style.display='inline';
        }
    }
    
    function UploadFuction(obj)
    {
        FieldName='chkAttachment';
         var DATA = obj.split(','); 
         if(DATA[0]=='0')
         {
            document.getElementById("trSave").style.display='inline';
            document.getElementById("trGrid").style.display='inline';
            document.getElementById("trAttachment").style.display='inline';
            document.getElementById("tdBrowse").style.display='inline';
            document.getElementById("UploadAttachment").style.display='inline';
            document.getElementById("trAttachmentBody").style.display='none';
            document.getElementById("trDocument").style.display='inline';   
         }
         if(DATA[0]=='1')
         {
            document.getElementById("trSave").style.display='inline';
            document.getElementById("trGrid").style.display='inline';
            document.getElementById("trAttachment").style.display='inline';
            document.getElementById("tdBrowse").style.display='none';
            document.getElementById("UploadAttachment").style.display='none';
            document.getElementById("trAttachmentBody").style.display='inline';
            document.getElementById("trDocument").style.display='inline';
            if(DATA[1]=='True')
            {
                document.getElementById("tdBrowse").style.display='inline';
                document.getElementById("UploadAttachment").style.display='inline'
            }
         }
    }
    function btnRemove_click()
    {
        if(counter != 'n')
        {
            var senddata = 'remvloc~' + counter;
            gridLocal.PerformCallback(senddata);
            counter='n';
        }
        
    }
    
</script>
<script type="text/ecmascript" >
    
    function SendingMailOption(obj)
    {
        
        if(obj != '')
        {   
            var senddata='option~'+obj;
            //alert(senddata);
            CallServer(senddata,"");
        }
        else
        {
            AtTheTimePageLoad();
            var senddata='optionnull';
            CallServer(senddata,"");
        }
    }
    function btnSend_click()
    {
        var senddata = 'send';
        CallServer(senddata,"");
    }
    function ReceiveServerData(rValue)
    {
        var DATA = rValue.split('~'); 
        //alert(rValue); 
        if(DATA[0]=="option")
        {
            if(DATA[1] != 'n')
            {
                if(DATA[1] == '1')
                {
                    document.getElementById("trSave").style.display='inline';
                    document.getElementById("trGrid").style.display='none';
                    document.getElementById("trAttachment").style.display='inline';
                    document.getElementById("tdBrowse").style.display='none';
                    document.getElementById("UploadAttachment").style.display='none';
                    document.getElementById("trAttachmentBody").style.display='inline';
                    document.getElementById("trDocument").style.display='inline';
                }
                if(DATA[1] == '0')
                {
                    document.getElementById("trSave").style.display='inline';
                    document.getElementById("trGrid").style.display='none';
                    document.getElementById("trAttachment").style.display='inline';
                    document.getElementById("tdBrowse").style.display='inline';
                    document.getElementById("UploadAttachment").style.display='inline';
                    document.getElementById("trAttachmentBody").style.display='none';
                    document.getElementById("trDocument").style.display='inline';
                }
            }
            else
                alert('No Data Found!');
        }
        if(DATA[0]=="send")
        {
            if(DATA[1]=="Y")
            {
                AtTheTimePageLoad();
                alert('Mail Delivered Successfully!');
            }
            else
                alert(DATA[1]);
        }
    }
</script>
    <table class="TableMain100">
        <tr>
            <td class="EHEADER" colspan="2" style="text-align:center;">
                <strong><span style="color: #000099">Bulk Email Template</span></strong>
            </td>
        </tr>
        <tr>
            <td class="gridcellright" style="width: 144px" align="right">
            <span style="color: #000099">Bulk Email Template:</span>
            </td>
            <td class="gridcellleft" align="left">
                &nbsp;<asp:DropDownList ID="cmbBulkEmailTemplate" runat="server" Width="253px" Font-Size="10px">
                </asp:DropDownList>
            </td>
            
        </tr>
        <tr id="trDocument">
            <td class="gridcellright" style="width: 144px" align="right">
            <span style="color: #000099">Document Name:</span>
            </td>
            <td class="gridcellleft" align="left">
                &nbsp;<asp:TextBox ID="txtDocumentName" runat="server" Font-Size="11px" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr id="trAttachmentBody">
            <td class="gridcellright" style="width: 144px" align="right">
            <span style="color: #000099">Browse File For Body:</span>
            </td>
            <td class="gridcellleft" align="left" >
            <table><tr><td align="left">
                <asp:FileUpload ID="UploadBody" runat="server" Width="254px" />
                <span style="color: #000099">Has Attachment </span>
                </td>
                <td>
                <asp:CheckBox ID="chkAttachment" runat="server" Height="13px" Width="37px" />
                </td>
                <td>
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UploadBody"
                    Display="Dynamic" ErrorMessage="upload only [.Doc] or [.txt] File !!" ValidationExpression="^.+\.((txt)|(doc))$"></asp:RegularExpressionValidator>
                    </td>
                    </tr>
                    </table>
                    </td>
        </tr>
        <tr id="trAttachment">
            <td class="gridcellright" style="width: 144px" align="right">
            <span id="tdBrowse" style="color: #000099">Browse File For Attachment:</span>
            </td>
            <td class="gridcellleft" align="left">
                &nbsp;<asp:FileUpload ID="UploadAttachment" runat="server" Width="254px" />&nbsp;&nbsp;
                <input id="btnUpload" runat="server" type="button" value="Upload" class="btnUpdate"  style="height: 19px; width: 48px;" onserverclick="btnUpload_ServerClick" />
                <input id="btnRemove" type="button" value="Remove" class="btnUpdate" onclick="btnRemove_click()" style="height: 19px; width: 69px;" /></td>
        </tr>
        <tr id="trGrid">
            <td colspan="2">
                <dxwgv:ASPxGridView ID="GridAttachment" ClientInstanceName="gridLocal" runat="server"   Width="100%" KeyFieldName="filepathServer"  AutoGenerateColumns="False" OnCustomCallback="GridAttachment_CustomCallback"  >
                                                            <Styles  >
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                            </Styles>
                                                            <SettingsPager AlwaysShowPager="True" NumericButtonCount="20" ShowSeparators="True" Visible="False">
                                                                <FirstPageButton Visible="True">
                                                                </FirstPageButton>
                                                                <LastPageButton Visible="True">
                                                                </LastPageButton>
                                                            </SettingsPager>
                                                            <SettingsBehavior AllowMultiSelection="True" AllowSort="False" />
                                                            <ClientSideEvents SelectionChanged="function(s, e) { OnGridSelectionChanged(); }"  />
                                                          
                                                            <Columns>
                                                                <dxwgv:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Width="3%">
                                                                    <HeaderStyle HorizontalAlign="Center">
                                                                        <Paddings PaddingBottom="1px" PaddingTop="1px" />
                                                                    </HeaderStyle>
                                                                    <HeaderTemplate>
                                                                         <input type="checkbox" onclick="gridServer.SelectAllRowsOnPage(this.checked);OnGridServerSelectAll(this.checked);" style="vertical-align:middle;" title="Select/Unselect all rows on the page"></input>
                                                                    </HeaderTemplate>
                                                                </dxwgv:GridViewCommandColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Document Name" FieldName="filename" ReadOnly="True"
                                                                    VisibleIndex="1">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Document Physical Location" FieldName="filepath"
                                                                    ReadOnly="True" VisibleIndex="2">
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Doc" FieldName="filepathServer"  ReadOnly="True" VisibleIndex="4" >
                                                                    <CellStyle CssClass="gridcellleft">
                                                                    </CellStyle>
                                                                    <EditFormSettings Visible="False" />
                                                                </dxwgv:GridViewDataTextColumn>
            <dxwgv:GridViewDataColumn Caption="Details" VisibleIndex="8" Width="5%">
                 <DataItemTemplate>
                     <a href="viewImage.aspx?id=<%#Container.KeyValue %>" target="_blank" >View..</a>
                 </DataItemTemplate>
             </dxwgv:GridViewDataColumn>

                                                                
                    </Columns>
                </dxwgv:ASPxGridView>
            </td>
        </tr>
        <tr id="tr1">
            <td></td>
            <td class="gridcellleft">
                &nbsp;</td>
        </tr>
        <tr id="trSave">
            <td></td>
            <td class="gridcellleft">
                <input id="btnSend" type="button" value="Send" class="btnUpdate" onclick="btnSend_click()" style="height: 24px; width: 69px;" />
            </td>
        </tr>
   </table>
<br />
    </form>
</body>
</html>
