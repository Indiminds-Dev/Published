<%@ page language="C#" autoeventwireup="true" inherits="management_frm_insurancecommissionslab_Add, App_Web_n3rnr3dz" %>

<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Insurance Commission slab</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    
        <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
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
	#ajax_listOfOptions div{	/* General rule for both .optionDiv and 

.optionDivSelected */
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
    
    
    
      function InsurerCompany(obj1,obj2,obj3,obj4)
    {
               
        ajax_showOptions(obj1,obj2,obj3,obj4,'Main');
    }
     function show_Scheme(obj1,obj2,obj3)
    {
         
       var data=document.getElementById("txtInsurerCompany_hidden").value;
        if(data!='')
        {
             ajax_showOptions(obj1,obj2,obj3,data,'Main');
        }
        else
        {
            alert('Please Select Insurer Company from Populated List First!');
            return false;
        }
    }
    
    function Page_Load()
    {
        var txt=document.getElementById("txtslabcode");
        txt.focus();
        TypeChange('B');
        document.getElementById("txtmin").readOnly = true;
        document.getElementById("txtmint").readOnly = true;
    }
    function noNumbers(e,txtBox)
    {
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
            {
                  return true;
            }
            else
            {
                 alert("Please Insert Numeric Only");
                 return false;
            }
         } 
         
        else if(e.which) // Netscape/Firefox/Opera
        {
            keynum = e.which 
            if(keynum>=48 && keynum<=57 || keynum==46)
            {
                return true;
            }
            else
            {
                alert("Please Insert Numeric Only");
                return false;
            }     
        }
        
    } 
    
    function disableminrate()
    {  
       var gg= document.getElementById("txtfixedamt").value;
       if(gg!="")
       {
            document.getElementById("txtrate").value='';
            document.getElementById("txtrate").disabled=true;
       }
       else
       {
            document.getElementById("txtrate").disabled=false;
       }
    }
 
     function disablefixedamt1()
     {
        var rr= document.getElementById("txtrate").value;
        if(rr!="")
        {
            document.getElementById("txtfixedamt").value='';
            document.getElementById("txtfixedamt").disabled=true;
        }
        else
            document.getElementById("txtfixedamt").disabled=false;
      
     }
     function TypeChange(obj)
     {
//        if(obj=='B')
//        {
//            document.getElementById("txtmint").value='1';
//            document.getElementById("txtmaxt").value='100';
//            document.getElementById("txtmint").readOnly = true;
//            document.getElementById("txtmaxt").readOnly = true;
//            document.getElementById("txtmin").value='1';
//            document.getElementById("txtmax").value='999999999999';
//        }
//        else
//        {
//            document.getElementById("txtmint").value='1';
//            document.getElementById("txtmaxt").value='100';
//            document.getElementById("txtmint").readOnly = true;
//            document.getElementById("txtmaxt").readOnly = false;
//            document.getElementById("txtmin").value='1';
//            document.getElementById("txtmax").value='999999999999';
//        }
     }
     function MessageAlert(obj,Type,EntryPart)
     {
      //  document.getElementById("txtmin").readOnly = true;
//        if(Type=='B')
//        {
//            if(obj=='1')
//            {
//                alert('Continue Insert Untill Max Range is 999999999999');
//                var txt=document.getElementById("txtmax");
//                txt.focus();
//                txt.select();
//            }
//            if(obj=='0')
//            {
//                alert('Insertion Complete and Cannot able to Insert for This Code');
//            }
//            if(obj=='2')
//            {
//                EditClose();
//            }
//        }
//        else
//        {
            if(obj=='1')
            {
                if(EntryPart=='P')
                {
                    alert('Continue Insert Untill Max Range is 100');
                    var txt=document.getElementById("txtmaxt");
                    txt.focus();
                    txt.select();
                }
                else
                {
                    alert('Continue Insert Untill Max Range is 999999999999 For this PPT range!');
                    var txt=document.getElementById("txtmax");
                    txt.focus();
                    txt.select();
                }
            }
            if(obj=='0')
            {
                alert('Insertion Complete and Cannot able to Insert for This Code');
            }
            if(obj=='2')
            {
                EditClose();
            }
//        }
     }
     function makeupper()
     {
        var txt=document.getElementById("txtslabcode");
        txt.value=txt.value.toUpperCase();
     }
     function Edit()
     {
        document.getElementById("txtslabcode").readOnly = true;
        
         document.getElementById("txtInsurerCompany").readOnly = true;
         document.getElementById("txtScheme").readOnly = true;
         document.getElementById("drpTranMode").readOnly = true;
        
        
        document.getElementById("txtmin").readOnly = true;
        document.getElementById("txtmint").readOnly = true;
        document.getElementById("txtmaxt").readOnly = true;
        ddltype.SetEnabled(false);
        var txt=document.getElementById("txtfixedamt");
        if(txt.value=='')
            disablefixedamt1();
        else
            disableminrate();
        txt=document.getElementById("txtmax");
        txt.focus();
        txt.select();
        
     }
     function EditClose()
     {
        parent.editwin.close();
     }
     function aa()
     {
     
     
         var comp=document.getElementById("txtInsurerCompany_hidden");
         var scheme=document.getElementById("txtScheme_hidden");
         var mode=document.getElementById("drpTranMode");
//         var dtfrm=document.getElementById("txtFromDate");
//         var dtTo=document.getElementById("txtToDate");
       
        if(comp.value == "")
        {
        alert("Please Select Manufacturer Company.");
        return false;
        }
        else if(scheme.value == "")
        {
        alert("Please Select Policy Name.");
        return false;
        }
          else if(txtFromDate.GetText()=='01-01-0100')
         {
            alert("Effective Date is required.");
            return false;
         }
         else if(txtToDate.GetText()=='01-01-0100')
         {
            alert("Effective Date is required.");
            return false;
         }
        
        
        else if(mode.value =="")
        {
        alert("Please Select Mode.");
        return false;
        }
         
//        var txt=document.getElementById("txtslabcode");
//        if(txt.value=="")
//        {
//            alert('Please fill Code for this slab!');
//            return false;
//            
//        }

        var   txt=document.getElementById("txtmax");
        if(parseFloat(txt.value)>999999999999)
        {
            alert('Max Value can not be more than 999,999,999,999.00');
            txt.focus();
            txt.select();
            return false;
        }
     }
     
     FieldName='drpTranMode';
     
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <br />
            <table class="TableMain100">
                <tr>
                    <td class="gridcellcenter">
                        <table style="border: solid 1px blue"  width="100%">
                            <tr>
                                <td align="center">
                                    <table width="100%">
                                     <tr>
                                    <td class="gridcellleft">
                                     <span style="color: #000099">Manufacturer Name:</span>
                                    </td>
                                    <td class="gridcellleft">
                                     <asp:TextBox ID="txtInsurerCompany" runat="server" Width="235px" CssClass="EcoheadCon"
                                                                                                    TabIndex="1"></asp:TextBox>
                                                                                                    <asp:HiddenField ID="txtInsurerCompany_hidden" runat="server" />
                                                                                                    
                                    </td>
                                    <td class="gridcellleft">
                                    <span style="color: #000099">Policy Name:</span>
                                    </td>
                                    <td class="gridcellleft">
                                      <asp:TextBox ID="txtScheme" runat="server" Width="235px" CssClass="EcoheadCon" TabIndex="2"></asp:TextBox>
                                         <asp:HiddenField ID="txtScheme_hidden" runat="server" />
                                    </td>
                                    </tr>
                                    <tr>
                                    <td  class="gridcellleft">
                                            <span style="color: #000099">Effective From :</span></td>
                                        <td valign="middle" class="gridcellleft">
                                            <dxe:ASPxDateEdit ID="txtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" width="235px">
                                                <buttonstyle width="13px">
                                        </buttonstyle>
                                                <dropdownbutton text="">
                                        </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                        <td class="gridcellleft">
                                             <span style="color: #000099">To:</span></td>
                                        <td valign="middle" class="gridcellleft"  id="td4">
                                            <dxe:ASPxDateEdit ID="txtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True" width="235px">
                                                <buttonstyle width="13px">
                                        </buttonstyle>
                                                <dropdownbutton>
                                        </dropdownbutton>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    
                                    </tr>
                                    
                                        <tr>
                                            <td class="gridcellleft">
                                                <asp:Label ID="Label1" runat="server" Text="Slab Code:" Width="56px" ForeColor="#000099"></asp:Label>
                                               
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox ID="txtslabcode" runat="server" Width="235px" TabIndex="3" MaxLength="6" Enabled="false"></asp:TextBox>
                                                 
                                                </td>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Slab Type:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxComboBox runat="server" Width="235px" ID="ddltype" DropDownStyle="DropDown"
                                                    ClientInstanceName="ddltype" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    SelectedIndex="0" ValueType="System.String" TabIndex="4">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Base Commission" Value="B"></dxe:ListEditItem>
                                                        <dxe:ListEditItem Text="Renewal Commission" Value="R"></dxe:ListEditItem>
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                                                                        TypeChange(s.GetValue());
                                                                        }" />
                                                    <ValidationSettings Display="Dynamic" SetFocusOnError="True">
                                                        <RequiredField IsRequired="True" />
                                                    </ValidationSettings>
                                                </dxe:ASPxComboBox>
                                            </td>
                                        </tr>
                                         <tr >
                                        <td colspan="4" class="gridcellleft"><span style="color: #000099;font-size:11px;font-weight:bold;">Premium Paying Term(PPT) Range:</span></td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Min Term:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="235px" ID="txtmint" onkeypress="return noNumbers(event)"
                                                    MaxLength="2" TabIndex="5"></asp:TextBox>
                                            </td>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Max Term:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="235px" MaxLength="3" ID="txtmaxt" onkeypress="return noNumbers(event)" 
                                                    TabIndex="6"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr >
                                        <td colspan="4" class="gridcellleft"><span style="color: #000099;font-size:11px;font-weight:bold;">Premium Range:</span></td>
                                        </tr>
                                                <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">From Amt.:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="235px" ID="txtmin" onkeypress="return noNumbers(event)"
                                                    MaxLength="19" TabIndex="7"></asp:TextBox>
                                            </td>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">To Amt.:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="235px" MaxLength="19" ID="txtmax" onkeypress="return noNumbers(event)"
                                                    TabIndex="8"></asp:TextBox>
                                            </td>
                                        </tr>
                                       

                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Fixed Amt:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="235px" ID="txtfixedamt" onkeypress="return noNumbers(event)"
                                                    MaxLength="19" TabIndex="9"></asp:TextBox>
                                            </td>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Base Rate(%):</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="235px" ID="txtrate" onkeypress="return noNumbers(event)"
                                                    MaxLength="19" TabIndex="10" ValidationGroup="a"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtrate"
                                                    Display="Dynamic" ErrorMessage="Must be in 1 to 99.9999 format" ValidationExpression="^[0-9]{0,2}(\.[0-9]{1,4})?$"
                                                    ValidationGroup="a"></asp:RegularExpressionValidator></td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">ORC (%):</span>
                                            </td>
                                            <td   class="gridcellleft">
                                                <asp:TextBox ID="txtORC" runat="server" TabIndex="11" onkeypress="return noNumbers(event)" Width="235px"></asp:TextBox>
                                            </td>
                                              <td class="gridcellleft">
                                          <span style="color: #000099">Mode:</span>
                                        
                                        </td>
                                        <td class="gridcellleft">
                                         <asp:DropDownList ID="drpTranMode" runat="server" Width="240px" CssClass="EcoheadCon"
                                                                                                    TabIndex="12"  onchange="javascript:NetModeChange(this.value);" >
                                                                                                    <asp:ListItem Value="Y">Yearly</asp:ListItem>
                                                                                                 <asp:ListItem Value="M">Monthly</asp:ListItem>
                                                                                                    <asp:ListItem Value="Q">Quarterly</asp:ListItem>
                                                                                                    <asp:ListItem Value="H">Half-Yearly</asp:ListItem>
                                                                                                    <asp:ListItem Value="A">Any</asp:ListItem>
                                                                                                    <asp:ListItem Value="S">Single</asp:ListItem>
                                                                                          
                                                                                                </asp:DropDownList>
                                                                                                 </td>
                                        </tr>
                                          
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Slab Name:</span>
                                            </td>
                                            <td colspan="3"  class="gridcellleft">
                                                <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Width="235px" Height="53px" TabIndex="13"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left" colspan="2">
                                               <%-- <span style="color: red">*</span> 4 Character Code.--%>
                                                <asp:HiddenField ID="hd1" runat="server" />
                                                <asp:HiddenField ID="LastInsert" runat="server" />
                                            </td>
                                            <td colspan="2" class="gridcellright" style="height: 25px">
                                                <asp:Button ID="btnSave" runat="server" Style="cursor: pointer" CssClass="btnUpdate"
                                                    Text="Save" OnClick="btnSave_Click"  TabIndex="14"
                                                    ValidationGroup="a"  />
                                            </td>
                                        </tr>
                                      
                                    </table>
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
