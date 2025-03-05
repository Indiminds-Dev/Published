<%@ page language="C#" autoeventwireup="true" inherits="management_frm_insurancecommissionslab_entry, App_Web_yxggcryg" %>

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
<head runat="server">
    <title>Insurance Commission slab</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script language="javascript" type="text/javascript">
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
        document.getElementById("txtmin").readOnly = true;
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
        var txt=document.getElementById("txtslabcode");
        if(txt.value=="")
        {
            alert('Please fill Code for this slab!');
            return false;
            
        }
        txt=document.getElementById("txtmax");
        if(parseFloat(txt.value)>999999999999)
        {
            alert('Max Value can not be more than 999,999,999,999.00');
            txt.focus();
            txt.select();
            return false;
        }
     }
     
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <br />
            <table class="TableMain100">
                <tr>
                    <td class="gridcellcenter">
                        <table style="border: solid 1px blue">
                            <tr>
                                <td align="center">
                                    <table>
                                        <tr>
                                            <td class="gridcellleft">
                                                <asp:Label ID="Label1" runat="server" Text="Slab Code:" Width="56px" ForeColor="#000099"></asp:Label>
                                                <span style="color: red">*</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox ID="txtslabcode" runat="server" Width="66px" TabIndex="1" MaxLength="6"></asp:TextBox>
                                                </td>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Slab Type:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <dxe:ASPxComboBox runat="server" Width="160px" ID="ddltype" DropDownStyle="DropDown"
                                                    ClientInstanceName="ddltype" EnableSynchronization="False" EnableIncrementalFiltering="True"
                                                    SelectedIndex="0" ValueType="System.String" TabIndex="2">
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
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Min Term:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="66px" ID="txtmint" onkeypress="return noNumbers(event)"
                                                    MaxLength="2"></asp:TextBox>
                                            </td>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Max Term:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="66px" MaxLength="3" ID="txtmaxt" onkeypress="return noNumbers(event)" 
                                                    TabIndex="3"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Min Amt.:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="150px" ID="txtmin" onkeypress="return noNumbers(event)"
                                                    MaxLength="19"></asp:TextBox>
                                            </td>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Max Amt.:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="155px" MaxLength="19" ID="txtmax" onkeypress="return noNumbers(event)"
                                                    TabIndex="4"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Fixed Amt:</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="150px" ID="txtfixedamt" onkeypress="return noNumbers(event)"
                                                    MaxLength="19" TabIndex="5"></asp:TextBox>
                                            </td>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Rate(%):</span>
                                            </td>
                                            <td class="gridcellleft">
                                                <asp:TextBox runat="server" Width="155px" ID="txtrate" onkeypress="return noNumbers(event)"
                                                    MaxLength="19" TabIndex="6" ValidationGroup="a"></asp:TextBox>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtrate"
                                                    Display="Dynamic" ErrorMessage="Must be in 1 to 99.9999 format" ValidationExpression="^[0-9]{0,2}(\.[0-9]{1,4})?$"
                                                    ValidationGroup="a"></asp:RegularExpressionValidator></td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">ORC (%):</span>
                                            </td>
                                            <td colspan="3"  class="gridcellleft">
                                                <asp:TextBox ID="txtORC" runat="server" TabIndex="7" onkeypress="return noNumbers(event)"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft">
                                                <span style="color: #000099">Slab Name:</span>
                                            </td>
                                            <td colspan="3"  class="gridcellleft">
                                                <asp:TextBox ID="txtNote" runat="server" TextMode="MultiLine" Width="100%" Height="53px" TabIndex="8"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left" colspan="2">
                                                <span style="color: red">*</span> 4 Character Code.
                                                <asp:HiddenField ID="hd1" runat="server" />
                                                <asp:HiddenField ID="LastInsert" runat="server" />
                                            </td>
                                            <td colspan="2" class="gridcellright" style="height: 25px">
                                                <asp:Button ID="btnSave" runat="server" Style="cursor: pointer" CssClass="btnUpdate"
                                                    Text="Save" OnClick="btnSave_Click" OnClientClick="return aa();" TabIndex="9"
                                                    ValidationGroup="a" />
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
