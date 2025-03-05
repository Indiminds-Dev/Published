<%@ page language="C#" autoeventwireup="true" inherits="management_frmtemplate, App_Web_8qixh_8w" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">
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

    <script language="javascript" type="text/javascript">
            function OnGridFocusedRowChanged() {
                // Query the server for the Row ID "Rid" fields from the focused row 
                // The values will be returned to the OnGetRowValues() function     
                grid1.GetRowValues(grid1.GetFocusedRowIndex(), 'UID', OnGetRowValues1);
                //alert();
            }
//            //Value array contains Row ID "Rid" field values returned from the server 
            function OnGetRowValues1(values) {
                RowID = values;
                //GridForR = document.getElementById("GridReminder");
            }
            function OnGridFocusedRowChanged1() {
                // Query the server for the Row ID "Rid" fields from the focused row 
                // The values will be returned to the OnGetRowValues() function     
                grid.GetRowValues(grid.GetFocusedRowIndex(), 'tem_id', OnGetRowValues);
            }
//            //Value array contains Row ID "Rid" field values returned from the server 
            function OnGetRowValues(values) {
                RowID1 = values;
                //GridForR = document.getElementById("GridReminder");
            }
            function frmOpenNewWindow_custom(location,v_height,v_weight,top,left)
               {   
                   window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ top +",left="+ left +",location=no,directories=no,menubar=no,toolbar=no,status=no,scrollbars=yes,resizable=no,dependent=no'");       
               } 


//            function ReservedWord_Click()
//            {
//                frmOpenNewWindow_custom('frmreservedword.aspx?type=receipent&control=window.opener.document.aspnetForm.txt_msg.value','200','400','375','500')
//            }
            FieldName=document.getElementById("btnAdd");   
            function Page_Load()
            {
                document.getElementById("TrGrdTemplate").style.display = 'inline';   
                document.getElementById("TrInsert").style.display = 'none';   
                document.getElementById("TrMessage").style.display = 'none';  
                document.getElementById("TrButton").style.display = 'none';  
            } 
            function drpChange()
            {
                var cmb = document.getElementById("drp_templatetype");
                var val = cmb.value;
                if(val=='2')
                {   
                    document.getElementById("TrReceip").style.display = 'none';   
                    document.getElementById("TrAccess").style.display = 'none';   
                    document.getElementById("TrReserveWord").style.display = 'inline';  
                }
                else    
                {
                    document.getElementById("TrReceip").style.display = 'inline';   
                    document.getElementById("TrAccess").style.display = 'inline';   
                    document.getElementById("TrReserveWord").style.display = 'none';  
                }
            }      
    </script>

    <script type="text/ecmascript">
            function btn_adduser_Click()
            {
                var data = 'AddUser';
                 var cmb = document.getElementById("txt_ajax");
                var cmb1 = document.getElementById("txt_ajax_hidden");
                //alert(cmb.Value);
               // data+='~'+cmb.value + '~' + cmb1.Value;
                data+='~'+cmb.value ;
                data+='~'+cmb1.value ;
                CallServer(data, ""); 
                grid1.PerformCallback();
                var cmb = document.getElementById("txt_ajax");
                cmb.value='';
                document.getElementById("Trgrd").style.display = 'inline';   
            }
            function btn_remove_Click()
            {
                CallServer('Remove'+'~'+RowID, ""); 
                grid1.PerformCallback();
            }
            function btnDelete_Click()
            {
                CallServer('Delete'+'~'+RowID1, ""); 
                grid.PerformCallback();
            }
            function btnAdd_Click()
            {
                document.getElementById("TrGrdTemplate").style.display = 'none';   
                document.getElementById("TrInsert").style.display = 'inline';   
                document.getElementById("TrMessage").style.display = 'inline';  
                document.getElementById("TrButton").style.display = 'inline'; 
                document.getElementById("Trgrd").style.display = 'none';   
                var cmb = document.getElementById("drp_templatetype");
                if(cmb.value==1)
                {
                    document.getElementById("TrReceip").style.display = 'inline';   
                    document.getElementById("TrAccess").style.display = 'inline';   
                    document.getElementById("TrReserveWord").style.display = 'none';   
                }
                else    
                {
                    document.getElementById("TrReceip").style.display = 'none';   
                    document.getElementById("TrAccess").style.display = 'none';   
                    document.getElementById("TrReserveWord").style.display = 'inline';  
                }
                var cmb = document.getElementById("txt_description");
                cmb.value='';
                cmb = document.getElementById("txt_msg");
                cmb.value='';
                cmb = document.getElementById("txt_ajax");
                cmb.value='';
                cmb = document.getElementById("drpSenderType");
                cmb.SelectedIndex=1;
                cmb = document.getElementById("hdID");
                cmb.value='';
                CallServer('Add', ""); 
                grid1.PerformCallback();
            }
            function btnDiscard_Click()
            {
                document.getElementById("TrGrdTemplate").style.display = 'none';   
                document.getElementById("TrInsert").style.display = 'inline';   
                document.getElementById("TrMessage").style.display = 'inline';  
                document.getElementById("TrButton").style.display = 'inline';  
                var cmb = document.getElementById("drp_templatetype");
                if(cmb.value==1)
                {
                    document.getElementById("TrReceip").style.display = 'inline';   
                    document.getElementById("TrAccess").style.display = 'inline';   
                    document.getElementById("TrReserveWord").style.display = 'none';   
                }
                else    
                {
                    document.getElementById("TrReceip").style.display = 'none';   
                    document.getElementById("TrAccess").style.display = 'none';   
                    document.getElementById("TrReserveWord").style.display = 'inline';  
                }
                var cmb = document.getElementById("txt_description");
                cmb.value='';
                cmb = document.getElementById("txt_msg");
                cmb.value='';
                cmb = document.getElementById("txt_ajax");
                cmb.value='';
                cmb = document.getElementById("drpSenderType");
                cmb.SelectedIndex=1;
                CallServer('Add', ""); 
                document.getElementById("TrGrdTemplate").style.display = 'inline';   
                document.getElementById("TrInsert").style.display = 'none';   
                document.getElementById("TrMessage").style.display = 'none';  
                document.getElementById("TrButton").style.display = 'none';  
            }
            function btnUpdate_Click()
            {
                CallServer('Update~'+RowID1, ""); 
                grid1.PerformCallback();
                document.getElementById("TrGrdTemplate").style.display = 'none';   
                document.getElementById("TrInsert").style.display = 'inline';   
                document.getElementById("TrMessage").style.display = 'inline';  
                document.getElementById("TrButton").style.display = 'inline';  
            }
            
            function btnSave_Click()
            {
                var data = 'Save';
                var cmb = document.getElementById("txt_description");
                data+='~'+cmb.value;
                cmb = document.getElementById("txt_msg");
                data+='~'+cmb.value;
                cmb = document.getElementById("drp_templatetype");
                data+='~'+cmb.value;
                cmb = document.getElementById("drp_accesslevel");
                data+='~'+cmb.value;
                cmb = document.getElementById("hdID");
                data += '~' + cmb.value;
                cmb = document.getElementById("drpSenderType");
                data+='~'+cmb.value
                CallServer(data, "");
                grid.PerformCallback();
                Page_Load();
            }   
         
            function ReceiveServerData(rValue)
            {
                var DATA=rValue.split('~');
//                if(DATA[0]=="Save" )            
//                {
//                   
//                       if(DATA[1]="Y")
//                       {
//                       alert('Update Successfully!');
//                       }
//                      
//                  
//                }
                if(DATA[0]=="Edit")
                {
                    var cmb = document.getElementById("txt_description");
                    cmb.value=DATA[1];
                    cmb = document.getElementById("txt_msg");
                    cmb.value=DATA[2];
                    cmb = document.getElementById("drp_templatetype");
                    cmb.value=DATA[4];
                    cmb = document.getElementById("drp_accesslevel");
                    if(DATA[5]==1)
                    {
                        cmb.SelectedIndex=1;
                    }
                    else
                    {
                        cmb.SelectedIndex=2;
                    }
                    cmb = document.getElementById("hdID");
                    cmb.value=DATA[6];
                    var rcount=DATA[7];
                    if(DATA[4]==1)
                    {
                        document.getElementById("TrReceip").style.display = 'inline';   
                        document.getElementById("TrAccess").style.display = 'inline';   
                        document.getElementById("TrReserveWord").style.display = 'none';  
                    }
                    if(DATA[4]==2)
                    {
                        document.getElementById("TrReceip").style.display = 'none';   
                        document.getElementById("TrAccess").style.display = 'none';   
                        document.getElementById("TrReserveWord").style.display = 'inline';  
                    }
                    if(rcount!='0')
                    {
                        document.getElementById("Trgrd").style.display = 'inline';   
                    }
                    else
                    {
                         document.getElementById("Trgrd").style.display = 'none';   
                    }
                    cmb = document.getElementById("drpSenderType");
                    if(DATA[8]==0)
                    {
                        cmb.SelectedIndex=1;
                    }
                    else if(DATA[8]==1)
                    {
                        cmb.SelectedIndex=2;
                    }
                    else
                    {
                        cmb.SelectedIndex=3;
                    }
                } 
//                if(DATA[0]=="Delete")
//                {          
//                    if(DATA[1]="Y")
//                    alert('Deleted Successfully!');
//                }   
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
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099;">Message Template</span></strong></td>
            </tr>
        </table>
        <table class="TableMain100">
            <tr>
                <td valign="top">
                    <table>
                        <tr>
                            <td>
                                <input id="btnAdd" type="button" value="Add" class="btnUpdate" onclick="btnAdd_Click()"
                                    style="width: 56px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="btnUpdate" type="button" value="Modify" class="btnUpdate" onclick="btnUpdate_Click()" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input id="btnDelete" type="button" value="Delete" onclick="btnDelete_Click()" class="btnUpdate" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="90%" style="text-align: left">
                    <table width="100%">
                        <tr id="TrGrdTemplate">
                            <td colspan="2" valign="top">
                                <dxwgv:ASPxGridView ID="GrdTemplate" ClientInstanceName="grid" runat="server" KeyFieldName="tem_id"
                                    Width="100%" OnCustomCallback="GrdTemplate_CustomCallback">
                                    <Styles>
                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                        </Header>
                                        <LoadingPanel ImageSpacing="10px">
                                        </LoadingPanel>
                                    </Styles>
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn FieldName="tem_id" Visible="False" VisibleIndex="0">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn FieldName="Title" VisibleIndex="0">
                                            <CellStyle CssClass="gridcellleft">
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <StylesEditors>
                                        <ProgressBar Height="25px">
                                        </ProgressBar>
                                    </StylesEditors>
                                    <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                                    <ClientSideEvents FocusedRowChanged="function(s, e) { OnGridFocusedRowChanged1(); }" />
                                    <SettingsPager>
                                        <FirstPageButton Visible="True">
                                        </FirstPageButton>
                                        <LastPageButton Visible="True">
                                        </LastPageButton>
                                    </SettingsPager>
                                </dxwgv:ASPxGridView>
                            </td>
                        </tr>
                        <tr id="TrInsert">
                            <td style="vertical-align: top; width: 47px;">
                                <table style="width: 454px">
                                    <tr>
                                        <td style="text-align: right; width: 92px;">
                                            <span class="Ecoheadtxt">Template For :</span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:DropDownList ID="drp_templatetype" runat="server" Width="163px" Enabled="False">
                                                <asp:ListItem Value="1">Message</asp:ListItem>
                                                <asp:ListItem Value="2">Email</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; width: 92px;">
                                            <span class="Ecoheadtxt">Short Description :</span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txt_description" runat="server" Width="160px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="TrReceip">
                                        <td style="text-align: right; width: 92px;">
                                            <span class="Ecoheadtxt">Recipients :</span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txt_ajax" runat="server" Width="160px"></asp:TextBox>
                                            <asp:TextBox ID="txt_ajax_hidden" runat="server" Width="0px"></asp:TextBox>
                                            <input id="btn_adduser" type="button" value="Add" class="btnUpdate" style="width: 67px;
                                                height: 20px;" onclick="btn_adduser_Click()" />
                                        </td>
                                    </tr>
                                    <tr id="TrAccess">
                                         <td style="text-align: right; width: 92px;">
                                            <span class="Ecoheadtxt">Access Level :</span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:DropDownList ID="drp_accesslevel" runat="server" Width="163px">
                                                <asp:ListItem Value="1">Public</asp:ListItem>
                                                <asp:ListItem Value="0">Private</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr id="TrReserveWord">
                                        <td class="gridcellleft" style="width: 92px">
                                            &nbsp;</td>
                                        <td class="gridcellleft">
                                            <asp:DropDownList ID="drpSenderType" runat="server" Width="163px">
                                                <asp:ListItem Value="0">Official</asp:ListItem>
                                                <asp:ListItem Value="1">Department</asp:ListItem>
                                                <asp:ListItem Value="2">Branch</asp:ListItem>
                                            </asp:DropDownList>
                                            <span style="font-weight: bold; color: Blue">(Email Id)</span>
                                            <%--<input id="Button1" type="button" value="Reserved Word" class="btnUpdate" style="height: 20px" visible="false" onclick="ReservedWord_Click()" />--%>
                                        </td>
                                    </tr>
                                </table>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                            </td>
                            <td style="text-align: left" id="Trgrd">
                                <table style="width: 336px">
                                    <tr>
                                        <td>
                                            <dxwgv:ASPxGridView ID="grduser" runat="server" AutoGenerateColumns="true" ClientInstanceName="grid1"
                                                KeyFieldName="UID" Width="86%" OnCustomCallback="grduser_CustomCallback">
                                                <Styles>
                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                    </Header>
                                                    <LoadingPanel ImageSpacing="10px">
                                                    </LoadingPanel>
                                                </Styles>
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn FieldName="UID" Visible="false" VisibleIndex="0">
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn FieldName="UNAME" Caption="Recipient Name" Visible="true">
                                                        <CellStyle CssClass="gridcellleft">
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                                <StylesEditors>
                                                    <ProgressBar Height="25px">
                                                    </ProgressBar>
                                                </StylesEditors>
                                                <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                                                <ClientSideEvents FocusedRowChanged="function(s, e) { OnGridFocusedRowChanged(); }" />
                                            </dxwgv:ASPxGridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input id="btn_remove" type="button" value="Remove" class="btnUpdate" onclick="btn_remove_Click()"
                                                style="height: 22px" />&nbsp;
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="TrMessage">
                            <td colspan="2" style="text-align: left">
                                <table>
                                    <tr>
                                        <td style="text-align: right; width: 92px;">
                                            <span class="Ecoheadtxt">Message :</span>
                                        </td>
                                        <td class="gridcellleft">
                                            <asp:TextBox ID="txt_msg" runat="server" Height="160px" TextMode="MultiLine" Width="603px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: right">
                                            <a href="#" onclick="frmOpenNewWindow_custom('frmreservedword.aspx?type=receipent,sender&control=window.opener.document.aspnetForm.txt_msg.value','200','400','200','300')">
                                                <span style="color: #000099; text-decoration: underline">Use Reserved Word</span></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="TrButton">
                            <td>
                                <input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_Click()"
                                    style="width: 64px" />
                                <input id="btnDiscard" type="button" value="Discard" class="btnUpdate" onclick="btnDiscard_Click()" />
                                <input id="hdID" type="hidden" style="width: 151px; height: 7px" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
