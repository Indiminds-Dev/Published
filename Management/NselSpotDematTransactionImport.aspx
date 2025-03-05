<%@ page language="C#" autoeventwireup="true" inherits="management_NselSpotDematTransactionImport, App_Web_sjbhlkdr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
       <title>Import Demat Transactions </title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

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

    function Page_Load()///Call Into Page Load
            {
                 height();
            }
   function height()
        {
            if(document.body.scrollHeight>=250)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '250px';
            }
            window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
   function fnAlert(obj)
   {
         alert(obj);
         height();
   }
     FieldName='lstSlection';
  
  
     </script>
	
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
    <div>
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Import Demat Transactions </span>
                    </strong>
                </td>
            </tr>
        </table>
        <br /> 
        <table class="TableMain100">
            <tr>
                <td align="center">
                    <table  border="10" cellpadding="1" cellspacing="1">
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Select File Type :
                            </td>
                            <td class="gridcellleft">
                                <asp:DropDownList ID="DdlFileType" runat="server" Width="100px" Font-Size="12px">
                                    <asp:ListItem Value="NSDL-Trn">NSDL-Trn</asp:ListItem>
                                    <asp:ListItem Value="CDSL-DPC9">CDSL-DPC9</asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Enter Account :
                            </td>
                            <td class="gridcellleft">
                                <asp:TextBox ID="txtAccName" runat="server" TabIndex="0" Width="250px" Font-Size="12px" onkeyup="ajax_showOptions(this,'DPAccounts',event);"></asp:TextBox>
                                
                            </td>
                        </tr>
                        <tr >
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Select File :
                            </td>
                            <td class="gridcellleft">
                                <asp:FileUpload ID="FileUpload1" runat="server" Width="340px" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="BtnImport" runat="server" Text="Import File" CssClass="btn" Width="84px" OnClick="BtnImport_Click"
                                    />
                            </td>
                        </tr>
                        <tr><td colspan="2" style="display:none;"><asp:TextBox ID="txtAccName_hidden" runat="server" Width="14px"></asp:TextBox></td></tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
