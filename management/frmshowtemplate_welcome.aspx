<%@ page language="C#" autoeventwireup="true" inherits="management_frmshowtemplate_welcome, App_Web_co654op-" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
     <link href="../CSS/style.css" rel="stylesheet" type="text/css" />
    <script language="javascript" type="text/javascript">          
                    
     function setvalue()
     {
          var str;
          var uservalue;
          var status;
          var msg;
          msg='';
          var i=0;
          status=0;          
          str=document.getElementById('HTEMPLATE').value;
          for (var x = 0; x <= str.length-1; x++)
          {
                   if (str.charAt(x)=='<')
                   {                              
                       uservalue=document.getElementById('textbox_'+i).value;
                       msg=msg+' '+uservalue+' ' 
                       status=1;
                       i=i+1;               
                   }               
                   
                   if (status==0)
                   {               
                    msg=msg+str.charAt(x)               
                   }              
                   
                   if (str.charAt(x)=='>')
                   {               
                    status=0;
                   }                                                        
          } 
          window.opener.document.aspnetForm.ctl00_ContentPlaceHolder3_txtContentM.value=msg;                          
//         if  (document.getElementById('HREC').value=='0')
//         {                 
//                  window.opener.document.aspnetForm.ctl00_ContentPlaceHolder3_txtRelplyUser.disabled = false;
//                  window.opener.document.aspnetForm.ctl00_ContentPlaceHolder3_txtRelplyUser.focus();
//         }
//         else
//         {              
//                window.opener.document.aspnetForm.ctl00_ContentPlaceHolder3_txtRelplyUser.disabled = true;
//                //window.opener.document.aspnetForm.txtSaveTemplate.focus();
//                window.opener.document.aspnetForm.ctl00_ContentPlaceHolder3_HREC.value= document.getElementById('HREC').value;          
//         }
         window.close();             
     }
             

    </script>
</head>
<body style="background-color:#DDECFE; vertical-align: top; text-align: center; width:100%">
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; padding-right: 2px; padding-left: 2px; padding-bottom: 2px; padding-top: 2px;">
                <tr>
                    <td colspan="2"  id="ss">                    
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; height:200px; vertical-align:text-top" >
                    <div runat="server" id="show_teplate"  style="width:100%; vertical-align:top; text-align:left; padding-right: 5px; padding-left: 10px; padding-bottom: 10px; padding-top: 10px; text-indent: 2px;" >                    
                    </div>
                    </td>
                </tr>
                <tr>
                    <td  style="text-align: right; border-top: blue 2px outset; padding-right: 1px; padding-left: 2px; padding-bottom: 5px; padding-top: 10px;">
                        <input id="Button2" style="width: 65px; border-right: 1px ridge; border-top: 1px ridge; border-left: 1px ridge; border-bottom: 1px ridge;" type="button" value="Ok" onclick="setvalue();" class="btnUpdate" /></td>
                    <td  style="text-align: left; border-top: blue 2px outset; padding-right: 1px; padding-left: 2px; padding-bottom: 5px; padding-top: 10px;">
                        <input id="Button1" size="100" style="width: 65px; border-right: 1px ridge; border-top: 1px ridge; border-left: 1px ridge; border-bottom: 1px ridge;" type="button" value="Close" onclick="window.close();" class="btnUpdate" /></td>
                </tr>
                <tr>
                    <td  style="text-align: left">
                        <asp:HiddenField ID="HTEMPLATE" runat="server" />
                    </td>
                    <td  style="text-align: center">
                    <asp:HiddenField ID="HREC" runat="server" />
                    
                    </td>
                </tr>
            </table>
    </div>
    </form>
</body>
</html>
