<%@ page language="C#" autoeventwireup="true" inherits="management_EmployeeDelete, App_Web_1jeyysc_" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../css/style.css" rel="stylesheet" type="text/css" />
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
	
	<script language="javascript" type="text/javascript">
	 FieldName='btnSave';
	 
	  function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=600)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '600px';
        window.frameElement.Width = document.body.scrollWidth;
    }
	 function CallList(obj1,obj2,obj3)
    {
        var obj5='';
        if(obj5 != '18')
        {
            ajax_showOptions(obj1,obj2,obj3,obj5);
        }
    }
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
    <table class="TableMain100">
      <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Delete Employee</span></strong>
                    </td>
                </tr>
    <tr>
    <td align="left">
     <asp:TextBox ID="txtReportTo" runat="server" Width="300px" TabIndex="7"></asp:TextBox>
      <asp:HiddenField ID="txtReportTo_hidden" runat="server" />
    </td>
    </tr>
    <tr>
    <td align="left" valign="top">
        <asp:Button ID="btnSave" runat="server" Text="Delete Employee" CssClass="btnUpdate" OnClick="btnSave_Click" />
    </td>
    </tr>
    </table>
    </div>
    </form>
</body>
</html>
