<%@ page language="C#" autoeventwireup="true" inherits="management_DPAccount_general, App_Web_rilo-itm" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
    <style type="text/css">
       a:hover {background:#ffffff; text-decoration:none;} /*BG color is a must for IE6*/
       a.tooltip span {display:none; padding:2px 3px; font-size:smaller; margin-left:1px; width:100px;}
       a.tooltip:hover span{display:inline; position:horizontal; background:#ffffff; border:1px solid #cccccc; color:#6c6c6c; width:100px}
    
    </style>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
<script type="text/javascript">
function FnSelection(obj)
{
 
    if (obj=="[PLPAYOUT]" || obj=="[POOL]" || obj=="[CISA]" || obj=="[PLEPAY]" || obj=="[PLDRCTDEL]" || obj=="[PLPAYIN]" || obj=="[PLCUSA]")
    {
        ShowEmployeeFilterForm('S');
        crdbsegment.SetSelectedIndex(1);
        crdbsegment.SetEnabled(false);
        //New Work
        ccmbPRAcType.SetEnabled(false);
        ccmbPRAcType.SetText('');
        //End of New Work
    }
    else
    {
        ShowEmployeeFilterForm('A');
        crdbsegment.SetSelectedIndex(0);
        crdbsegment.SetEnabled(true);
        //New Work
        if (obj=="[MRGINP]" || obj=="[MRGINR]")
        {
            ccmbPRAcType.SetEnabled(true);
            ccmbPRAcType.SetText('TM/CM Pledge Account [TM]');
        }
        else
        {
            ccmbPRAcType.SetEnabled(false);
            ccmbPRAcType.SetText('');
        }
        //End of New Work
    }

}
function CallAjax(obj1,obj2,obj3)
    {
        var cmbcompany=document.getElementById('cmbCompany');
        var obj4=cmbcompany.value
        ajax_showOptions(obj1,obj2,obj3,obj4);
    }
function CallDPAjax(obj1,obj2,obj3)
    {
        ajax_showOptions(obj1,obj2,obj3);
    }
function PageLoad()
    {
        FieldName='btnSave';
        document.getElementById('trSegment').style.display="none";
        ShowEmployeeFilterForm('A');
    }
function ShowEmployeeFilterForm(obj)
    {
    //    document.getElementById('txtName_hidden').value="";
//        document.getElementById('txtDPName_hidden').value="";
        if(obj=='A')
        {
            hide('trSegment');
            //document.getElementById('txtName_hidden').Text="none";
          //  document.getElementById('txtName_hidden').style.display="none";
//            document.getElementById('txtDPName_hidden').style.display="none";
        }
        if(obj=='S')
        {
            show('trSegment');
          //  document.getElementById('txtName_hidden').style.display="none";
//            document.getElementById('txtDPName_hidden').style.display="none";
        }
    }
    function show(obj1)
    {
         document.getElementById(obj1).style.display='inline';
    }
    function hide(obj1)
    {
         document.getElementById(obj1).style.display='none';
    }
   function CloseWindow1()
   {
   
   parent.editwin.close();

   }
   
   function displayseg()
   {
  
    document.getElementById('trSegment').style.display="inline";
   }
   
   function displaynotseg()
   {
   
    document.getElementById('trSegment').style.display="none";
   }
</script>
    <form id="form1" runat="server" autocomplete="off">
    <div>
        <table class="TableMain100">
            <tr>
                <td style="text-align: center">
                    <table id="tblMain" class="TableMain100">
                        <tr>
                            <td class="gridcellleft" colspan="3" style="text-align: center">
                                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="#FF9933"></asp:Label></td>
                        </tr>
                         <tr>
                            <td class="Ecoheadtxt"style="width: 220px">

                               <span class="Ecoheadtxt" style="color:Blue"><strong>Company:</strong></span>
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; width: 148px;padding:7px;">
                                <span style="color: #DDECFE">a</span><asp:DropDownList ID="cmbCompany" runat="server" Width="262px" TabIndex="1">
                                </asp:DropDownList>
                            </td>
                            <td class="Ecoheadtxt" style="width: 214px; text-align: left">
                            </td>
                        </tr>
                        <tr >
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>A/C Type:</strong></span>
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; width: 148px;padding:7px">
                             <%--   <span style="color: #DDECFE">a</span>--%>
                                <asp:DropDownList ID="cmbAcType" runat="server" Width="180px"  TabIndex="7" onchange="FnSelection(this.value)">
                                            <asp:ListItem Text="Own" Value="[Own]" />
                                            <asp:ListItem Text="Pool-Payin" Value="[PLPAYIN]" />
                                            <asp:ListItem Text="Pool-Payout" Value="[PLPAYOUT]" />
                                            <asp:ListItem Text="Pool-CUSA" Value="[PLCUSA]" />
                                            <asp:ListItem Text="Pool-Unified" Value="[POOL]" />
                                            <asp:ListItem Text="Pool-CISA" Value="[CISA]" />
                                            
                                            <asp:ListItem Text="Own-Trading" Value="[OWNTRDNG]" />
                                            <asp:ListItem Text="Own-Investment" Value="[OWNINVST]" />
                                            <asp:ListItem Text="Clients-Margin" Value="[MRGIN]" />
                                            <asp:ListItem Text="Clients-Margin Pledge-A/c" Value="[MRGINP]" />
                                            <asp:ListItem Text="Clients-Margin Re-Pledge-A/c" Value="[MRGINR]" />
                                            <asp:ListItem Text="Clients-Holdback" Value="[HOLDBK]" />
                                            <asp:ListItem Text="Pool-EarlyPayin" Value="[PLEPAY]" />
                                            <asp:ListItem Text="Pool-DirectDelivery" Value="[PLDRCTDEL]" />
                                            <asp:ListItem Text="Dummy-Adjustment" Value="[DUMMYADJ]" />
                                </asp:DropDownList>
                            </td>
                            <td class="Ecoheadtxt" style="width: 214px; text-align: left">
                            </td>
                        </tr>
                        <%--New Work--%>
                        <tr >
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>Pledge/Repledge Account Type:</strong></span>
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; width: 148px;padding:7px">
                                <%--<asp:DropDownList ID="cmbPRAcType" runat="server" Width="250px" TabIndex="8" Enabled="false" cl>
                                    <asp:ListItem Text="TM/CM Pledge Account [TM]" Value="TM" />
                                    <asp:ListItem Text="CM Re-Pledge Account [CM]" Value="CM" />
                                    <asp:ListItem Text="CC Re-Pledge Account [CC]" Value="CC" />
                                </asp:DropDownList>--%>
                                <dxe:ASPxComboBox ID="cmbPRAcType" runat="server" Width="250px" TabIndex="8" ClientInstanceName="ccmbPRAcType" ClientEnabled="false">
                                    <Items>
                                        <dxe:ListEditItem Text="TM/CM Pledge Account [TM]" Value="TM"/>
                                        <dxe:ListEditItem Text="CM Re-Pledge Account [CM]" Value="CM"/>
                                        <dxe:ListEditItem Text="CC Re-Pledge Account [CC]" Value="CC"/>
                                    </Items>
                                </dxe:ASPxComboBox>
                            </td>
                            <td class="Ecoheadtxt" style="width: 214px; text-align: left">
                            </td>
                        </tr>
                        <%--End of New Work--%>
                        <tr>
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>Exchange Segment:</strong></span>
                            </td>
                            <td class="gridcellleft" style="width: 148px">
                                <dxe:ASPxRadioButtonList ID="rbsegment" runat="server" SelectedIndex="0" ItemSpacing="10px"
                                    RepeatDirection="Horizontal" ClientInstanceName="crdbsegment" TextWrap="False" Font-Size="10px" Height="28px" TabIndex="2" >
                                    <Items>
                                        <dxe:ListEditItem Text="All" Value="A" />
                                        <dxe:ListEditItem Text="Specific" Value="S" />
                                    </Items>
                                    <ClientSideEvents ValueChanged="function(s, e) {ShowEmployeeFilterForm(s.GetValue());}" />
                                    <Border BorderWidth="0px" />
                                </dxe:ASPxRadioButtonList>
                            </td>
                            <td class="gridcellleft">
                            </td>
                        </tr>
                        <tr id="trSegment" runat="server">
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong><strong>Segment:</strong></span></td>
                            <td class="gridcellleft" style="width: 148px;text-align:center;">
                                <asp:TextBox ID="txtName" runat="server" Width="180px" Font-Size="11px" TabIndex="3"></asp:TextBox>
                                </td>
                            <td class="gridcellleft"  style="display:none" ><asp:TextBox ID="txtName_hidden" runat="server" Width="100px"></asp:TextBox>
                                </td>
                        </tr>
                        <tr>
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue;"><strong>Account Name:</strong></span></td>
                            <td class="gridcellleft" style="width: 148px;text-align:center;">
                                <dxe:ASPxTextBox ID="txtAccountName" runat="server" Width="262px" TabIndex="4">
                                </dxe:ASPxTextBox>
                               </td>
                            <td class="gridcellleft">
                                <asp:RequiredFieldValidator ID="reqAccName" ControlToValidate="txtAccountName" runat="server" ErrorMessage="* Please Enter A/C Name!"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>A/C Short Name:</strong></span>
                            </td>
                            <td class="gridcellleft" style="width: 148px">
                                <dxe:ASPxTextBox ID="txtACShortName" runat="server" Width="262px" TabIndex="5">
                                </dxe:ASPxTextBox>
                            </td>
                            <td class="gridcellleft">
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtACShortName" runat="server" ErrorMessage="* Plese Enter A/C Short Name!"></asp:RequiredFieldValidator></td>
                        </tr>
                         <tr>
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>DP Name:</strong></span></td>
                            <td class="gridcellleft" style="width: 148px">
                                <asp:TextBox ID="txtDPName" runat="server" Font-Size="11px" Width="258px" TabIndex="6"></asp:TextBox>
                                
                            </td>
                            <td class="gridcellleft">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtDPName" runat="server" ErrorMessage="* Empty Field!"></asp:RequiredFieldValidator>
                            </td>
                            <td style="display:none" >
                               <asp:TextBox ID="txtDPName_hidden" runat="server" Width="100px"></asp:TextBox> 
                            </td>
                        </tr>
                        

                        

                        <tr>
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>CMBP ID:</strong></span></td>
                            <td class="gridcellleft" style="width: 148px">
                               <dxe:ASPxTextBox ID="txtCMBPID" runat="server"  Maxlength="8"  width="150px" TabIndex="8">
                                </dxe:ASPxTextBox>
                            </td>
                            <td class="gridcellleft">
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>Client Id:</strong></span>
                            </td>
                            <td class="gridcellleft" style="width: 148px">
                                <dxe:ASPxTextBox ID="txtCLIENTID" runat="server"   Maxlength="8" width="150px" TabIndex="9">
                                </dxe:ASPxTextBox>
                            </td>
                            <td class="gridcellleft">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtCLIENTID" runat="server" ErrorMessage="* Please enter client Id!"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>Status:</strong></span>
                            </td>
                            <td class="gridcellleft" style="width: 148px">
                                <asp:DropDownList ID="ddlbasis" runat="server" Font-Size="10px" Width="100px">
                                    <asp:ListItem Selected="True" Value="A">Active</asp:ListItem>
                                    <asp:ListItem Value="C">Closed</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>DDPI ID :</strong></span>
                            </td>
                            <td class="gridcellleft" style="width: 148px">
                                <dxe:ASPxTextBox ID="txtifslcode" runat="server"   Maxlength="12" width="150px" >
                                </dxe:ASPxTextBox>
                            </td>
                           
                        </tr>
                        <tr>
                            <td class="gridcellright" style="width: 220px">
                                <span class="Ecoheadtxt" style="color:Blue"><strong>POA ID :</strong></span>
                            </td>
                            <td class="gridcellleft" style="width: 148px">
                                <dxe:ASPxTextBox ID="txtPOAID" runat="server" Maxlength="16" width="150px" >
                                </dxe:ASPxTextBox>
                            </td>
                           
                        </tr>
                        <tr><td class="gridcellright" style="width: 220px">
                                              </td>
                                            <td class="gridcellleft">
                                                 <asp:CheckBox ID="chkpledge"  runat="server" />
                                                                    <span class="Ecoheadtxt" style="color:Blue"><strong>Is Pledge Account </strong></span>     
                                            </td>
                                            <td>
                                               
                                                   
                                            </td></tr>
                        <tr>
                            <td class="gridcellright" style="width: 220px">
                            </td>
                            <td class="gridcellleft" style="width: 148px;vertical-align:top;">
                                <table class="TableMain" style="width: 31%; height: 16px">
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnupdate" runat="server" Text="Save" CssClass="btnUpdate" Height="23px" OnClick="btnupdate_Click" TabIndex="10"/>
                                        </td>
                                        <td valign="top">
                                            <input id="btnClose" type="button" name="Cancel" value="Cancel" onclick="javascript:parent.wclose();" tabindex="11" class="btnUpdate" size="50px" style="height:23px"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td class="gridcellleft">
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
       </table>
    </div>
    </form>
</body>
</html>
