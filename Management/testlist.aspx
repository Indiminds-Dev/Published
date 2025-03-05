<%@ page language="C#" autoeventwireup="true" inherits="management_testlist, App_Web_yxggcryg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<body>
<head runat="server">
    <title>Untitled Page</title>
    <!--___________________These files are for List Items__________________________-->
   <%-- <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js" />--%>
	<style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	/* Never change this one */
		width:175px;	/* Width of box */
		height:250px;	/* Height of box */
		overflow:auto;	/* Scrolling features */
		border:1px solid #317082;	/* Dark green border */
		background-color:#FCI5D;	/* White background color */
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
		background-color:#317082;
		color:#FFF;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:5;
	}
	
	form{
		display:inline;
	}
	
	</style>
<<<<<<< .mine


=======
    <!--___________________________________________________________________________-->
</head>
<body>
<script language="javascript" type="text/javascript">
//    function aa()
//    {
//        var k='hiiii';
//        document.getElementById("TDiv").style.width='100px'
//        document.getElementById("TDiv").style.height='100px'
//        document.getElementById("TDiv").innerHTML = k;
//    }
function validate_number() {
    alert('Hii');
    var telephone = document.getElementById("TextBox2");
    alert(telephone.value)
    if(telephone.value.search(/^[0-9]*$/) == -1) {
        alert('Telephone field contains invalid\n' +
              'characters please correct.');
        telephone.focus();
        return false;
    } else {
        return true;
    }
</script>
>>>>>>> .r427
    <form id="form1" runat="server">
    <div id="test">
        <table style="width: 416px;background-color:Aqua">
            <tr>
                <td style="width: 129px">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 129px">
                    <asp:TextBox ID="TextBox2" runat="server" Text="ddd"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 129px">
                    <asp:TextBox ID="TextBox3" runat="server" Text="aaa"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 129px">
                    <asp:TextBox ID="TextBox4" runat="server" Text="aaa"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 129px; height: 26px;">
                    <asp:TextBox ID="TextBox5" runat="server" Text="aaa"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 129px">
                    <asp:TextBox ID="TextBox6" runat="server" Text="aaa"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 129px">
                    <asp:TextBox ID="TextBox7" runat="server" Text="aaa"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 129px">
                    <asp:TextBox ID="TextBox8" runat="server" Text="aaa"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 129px">
                    <asp:TextBox ID="TextBox9" runat="server" Text="aaa"></asp:TextBox></td>
            </tr>
            <tr>
                <td style="width: 129px">
                    <asp:TextBox ID="TextBox10" runat="server" Text="aaa"></asp:TextBox></td>
            </tr>
            
        </table>
    </div>

     <input id="Button2" type="button" value="dddd" onclick="validate_number()"/>
    </form>
    </head>
</body>
</html>
