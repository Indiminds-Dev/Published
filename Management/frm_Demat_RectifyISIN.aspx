<%@ page language="C#" autoeventwireup="true" inherits="management_frm_Demat_RectifyISIN, App_Web_sggmuspu" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
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
<body>
<script language="javascript" type="text/javascript">
        function PageLoad()
         {
             FieldName='btnSave';   
             document.getElementById('txtScrip_hidden').style.display="none";
         } 
         function CallAjax(obj1,obj2,obj3)
         {          
             var obj4 = '<%=exchSegId %>';
             ajax_showOptions(obj1,obj2,obj3,obj4);
            
         }
         function updateScrip()
        {
            alert('Scrip saved sucessfully.');
            parent.editwin.close();            
        }
        function CheckUncheckRadio(obj)
        {
        
            rownum = eval(obj.id.split('_')[1].substr(3));            

            var grid = document.getElementById('<%=gridRectScrip.ClientID %>');           
                
            for (var i = 1; i < grid.rows.length; i++)
            {
                if (i != rownum-1)
                {
                    for (var j = 0; j <grid.rows[i].cells[2].childNodes.length; j++)
                    {
                    	if (grid.rows[i].cells[2].childNodes[j].type == 'radio')
                    	    grid.rows[i].cells[2].childNodes[j].checked = !obj.checked;
                    }
                    
                }
            }
        }
        function CheckMulti(obj)
        {
            var grid = document.getElementById('<%=gridRectScrip.ClientID %>');
            for (var i = 1; i < grid.rows.length; i++)
            {
                if (grid.rows[i].cells[2].childNodes[0].checked)
                {
                   document.getElementById('<%=hid.ClientID %>').value=document.getElementById('<%=hid.ClientID %>').value+'~'+grid.rows[i].cells[0].innerText;
                   return true;
                }
                
            }
            alert('Please select one scrip.');
            return false;
            
        }
        function CloseWindow()
        {
            window.close();
          
        }
        function OnScripChange(obj)
        {
            if (obj == 'UseScrip')
            {               
                Hide(tdSearch2);
                Show(trGrid2);
                Hide(trNoScrip1);
                Show(trGrid3);
            }
            else if (obj == 'SearchScrip')
            {                
                Show(tdSearch2);
                document.getElementById('<%=txtScrip.ClientID%>').focus();
                Hide(trGrid2);
                Hide(trGrid3);
                Show(trNoScrip1);
            }
            
        }
        function Show(obj)
        {
            obj.style.display = 'inline';
        }
        function Hide(obj)
        {
            obj.style.display = 'none';
        }  
        
        //----Loading..
        
             // Get the instance of PageRequestManager.
             var prm = Sys.WebForms.PageRequestManager.getInstance();
             // Add initializeRequest and endRequest
             prm.add_initializeRequest(prm_InitializeRequest);
             prm.add_endRequest(prm_EndRequest);
            
             // Called when async postback begins
             function prm_InitializeRequest(sender, args) {
                 // get the divImage and set it to visible
                 var panelProg = $get('divImage');                
                 panelProg.style.display = '';
                 // reset label text
                 var lbl = $get('<%= this.lblText.ClientID %>');
                 lbl.innerHTML = '';
 
                 // Disable button that caused a postback
                 $get(args._postBackElement.id).disabled = true;
             }
 
             // Called when async postback ends
             function prm_EndRequest(sender, args) {
                 // get the divImage and hide it again
                 var panelProg = $get('divImage');                
                 panelProg.style.display = 'none';
 
                 // Enable button that caused a postback
                 $get(sender._postBackSettings.sourceElement.id).disabled = false;
                 alert('Close');
             }
        
</script>
    <form id="form1" runat="server" autocomplete="off">
    <div>
    <asp:ScriptManager ID="sm1" runat="server"></asp:ScriptManager>
    <table class="TableMain100">
    <tr>
        <td colspan="6" >
        &nbsp;
        </td>
    </tr>
    <tr id="trNoScrip" runat="server">
        <td width="15%" style="color:Red; font-weight:bold;padding-left:50px">No Scrip Found.
        </td>
        <td align="right" id="tdSuggested1">
            <asp:RadioButton ID="rbtnSuggestedScrip" runat="server" Checked="true" onclick="OnScripChange('UseScrip');"
                GroupName="Scrip" />
        </td>
        <td align="left" id="tdSuggested2">
            Use Suggested ScripName</td>
        <td align="right" id="tdSuggested3">
            <asp:RadioButton ID="rbtnSearchScrip" runat="server" onclick="OnScripChange('SearchScrip');"
                GroupName="Scrip" />
        </td>        
        <td align="left" id="tdSearch1">Search for ScripName
        </td>
        <td align="left" id="tdSearch2">
            <asp:TextBox ID="txtScrip" runat="server" TabIndex="1" Width="250px" Font-Size="12px"
            onkeyup="CallAjax(this,'ScripName',event)"></asp:TextBox>
            <asp:TextBox ID="txtScrip_hidden" runat="server" Width="14px"></asp:TextBox>
        </td>
    </tr>     
    <tr id="trStatus">
        <td colspan="6" >
            <asp:Label ID="lblStatus" runat="server" Font-Size="X-Small" Font-Names="Arial"
                Font-Bold="True" ForeColor="Red" />
        </td>
    </tr>
    <tr id ="trGrid1">
        <td id="tdGrid1" colspan="6" align="center" style="color:red; font-weight:bold" runat="server">        
        </td>
    </tr>    
    <tr id ="trGrid2">
        <td colspan="6" align="center">
        <br />
            <asp:GridView ID="gridRectScrip"  runat="server" AutoGenerateColumns="False"
            BackColor="PeachPuff" BorderColor="Blue" BorderStyle="Solid" BorderWidth="1px"
            EmptyDataText="No Record Found.">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="No." />
                    <asp:BoundField DataField="ScripName" HeaderText="Scrip Names" >
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Select One">
                    <ItemTemplate>
                        <asp:RadioButton ID="rbtnScrip" runat="server" AutoPostBack="false" onclick="CheckUncheckRadio(this);" />
                    </ItemTemplate>                    
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
    </tr> 
    <tr id="trDetails1">
        <td align="left" style="padding-left:50px" >Effective From : </td>
        <td>
            <dxe:ASPxDateEdit ID="txtDate" runat="server" ClientInstanceName="e1" Width="152px"
                EditFormat="Custom" EditFormatString="dd MMMM yyyy" UseMaskBehavior="True" AllowNull="False"
                Height="25px" TabIndex="2">
                <buttonstyle width="13px"></buttonstyle>                
            </dxe:ASPxDateEdit>
        </td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr id="trDetails2">
        <td align="left" style="padding-left:50px">Face Value : </td>
        <td colspan="5">
            <asp:TextBox ID="txtFaceVal" runat="server" TabIndex="3"></asp:TextBox>
        </td>
    </tr>
    <tr id="trDetails3">
        <td align="left" style="padding-left:50px">PaidUp Value : </td>
        <td colspan="5">
            <asp:TextBox ID="txtPaidUpVal" runat="server" TabIndex="4"></asp:TextBox>
        </td>        
    </tr>    
    <tr id="trGrid3">
        <td colspan="6" align="center">
            <asp:UpdatePanel ID="up1" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnMulti" runat="server" Text="Save" OnClientClick="return CheckMulti(this);"
                        OnClick="btnMulti_Click" TabIndex="5" /> 
                       <br />
                    <asp:Label ID="lblText" runat="server" Text=""></asp:Label>
                    <div id="divImage" style="display: none">
                        <asp:Image ID="img1" runat="server" ImageUrl="~/images/progress.gif" />
                        Processing...
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnMulti" EventName="Click" />
                </Triggers>
            </asp:UpdatePanel>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server"
                            DynamicLayout="true">
                            <ProgressTemplate>
                                Processing..Please Wait.
                            </ProgressTemplate>
            </asp:UpdateProgress>
        </td>
    </tr> 
    <tr id="trNoScrip1">
        <td colspan="6" align="center">
            <asp:UpdatePanel ID="up2" runat="server" >
            <ContentTemplate>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" TabIndex="6" />
            </ContentTemplate>  
            <Triggers><asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click"/></Triggers>
            </asp:UpdatePanel>
        </td>    
    </tr>    
    <tr>
        <td colspan="6" align="center" style="height: 41px">
            <asp:HiddenField ID="hid" runat="server" />
        </td>
    </tr> 
    </table>
    </div>
    </form>
</body>
</html>
