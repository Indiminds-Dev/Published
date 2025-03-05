<%@ page language="C#" autoeventwireup="true" inherits="management_frm_TemplateReservedWord, App_Web_n3rnr3dz" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Reserved Word</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" language="javascript">
   
        function checkevent(chkObj)
        {
              var st = chkObj.value
              var ob = window.opener.document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtContent');
              ob.value=window.opener.document.getElementById('ASPxPopupControl1_ASPxCallbackPanel1_txtContent').value + ' '+ st;
              window.close(); 
    
        }
        function lostFocus()
        {
            var str = window.opener.document.getElementById("txtNote");
            str.focus();
        }
  
    function OnButtonClick(obj)
    {
    alert(obj)
     window.parent.SetContent(obj);
     alert("455");
   
    }
    
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width='100%'>
                <tr style='background-color: #DDECFE'>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='chk_0' value='<#FirstName#>' onclick="javascript:checkevent(this)">
                        First Name</td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='chk_5' value='<#MiddleName#>' onclick="javascript:checkevent(this)">
                        Middle Name
                    </td>
                </tr>
                <tr style='background-color: #DDECFE'>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='chk_3' value='<#LastName#>' onclick="javascript:checkevent(this)">
                        Last Name</td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='chk_4' value='<#ClientCode#>' onclick="javascript:checkevent(this)">
                        Code
                    </td>
                </tr>
                <tr style='background-color: #DDECFE'>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='chk_1' value='<#Addres1#>' onclick="javascript:checkevent(this)">
                        Address 1
                    </td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='chk_6' value='<#Addres2#>' onclick="javascript:checkevent(this)">
                        Address 2
                    </td>
                </tr>
                <tr style='background-color: #DDECFE'>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='chk_7' value='<#Addres3#>' onclick="javascript:checkevent(this)">
                        Address 3</td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox8' value='<#City#>' onclick="javascript:checkevent(this)">
                        City</td>
                </tr>
                <tr style='background-color: #DDECFE'>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox9' value='<#State#>' onclick="javascript:checkevent(this)">
                        State</td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox10' value='<#Country#>' onclick="javascript:checkevent(this)">
                        Country
                    </td>
                </tr>
                <tr style='background-color: #DDECFE'>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox11' value='<#Pin#>' onclick="javascript:checkevent(this)">
                        Pin</td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox12' value='<#ISDCode#>' onclick="javascript:checkevent(this)">
                        ISD Code
                    </td>
                </tr>
                <tr style='background-color: #DDECFE'>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox13' value='<#STDCode#>' onclick="javascript:checkevent(this)">
                        STD Code
                    </td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox14' value='<#TelephoneNumber#>' onclick="javascript:checkevent(this)">
                        Telephone Number
                    </td>
                </tr>
                <tr style='background-color: #DDECFE'>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox15' value='<#MobNumber#>' onclick="javascript:checkevent(this)">
                        Mobile Number</td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox16' value='<#DateOfBirth#>' onclick="javascript:checkevent(this)">
                        Date Of Birth</td>
                </tr>
                <tr style='background-color: #DDECFE'>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox17' value='<#PANNumber#>' onclick="javascript:checkevent(this)">
                        PAN Number</td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox1' value='<#CurrentDate#>' onclick="javascript:checkevent(this)">
                        Current Date</td>
                    
                </tr>
                
                
                
                 <tr style='background-color: #DDECFE' id="tr1" runat="server">
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox4' value='<#Branch#>' onclick="javascript:checkevent(this)">
                        Branch</td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox5' value='<#Designation#>' onclick="javascript:checkevent(this)">
                        Designation</td>
                    
                </tr>
                
                
                 <tr style='background-color: #DDECFE' id="tr2" runat="server">
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                        <input type='checkbox' id='Checkbox2' value='<#Department#>' onclick="javascript:checkevent(this)">
                        Department</td>
                    <td style='font-family: Tahoma,Arial, Verdana, sans-serif; color: Blue; font-size: 10px;
                        width: 300px'>
                       
                       </td>
                    
                </tr>
                
                
            </table>
        </div>
    </form>
</body>
</html>
