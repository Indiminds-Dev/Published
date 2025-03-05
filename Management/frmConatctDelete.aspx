<%@ page language="C#" autoeventwireup="true" inherits="management_frmConatctDelete, App_Web_gflohp-r" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Delete</title>
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
    	     function showOptions(obj1,obj2,obj3)
         {
      
          
           var c=document.getElementById("ddlText").value;
            var d=document.getElementById("ddlValue").value;
           var obj4= c +'~'+ d;
           if(c !='' && d !='')
           {
           ajax_showOptions(obj1,obj2,obj3,obj4);
           }
           else
           {
           alert('Please Select Contact Type...!!')
           }
         }
         function Validate(obj)
         {
         alert(obj);
         return false;
         
         }
 
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Contact Delete</span></strong>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <%--  <asp:Panel ID="Panel1" runat="server" Width="99%" Visible="False">--%>
                                <table width="100%">
                                    <tr>
                                        <td style="text-align: left; width: 127px;">
                                            <asp:Label ID="Label1" runat="server" Text="Choose By" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td style="text-align: left">
                                            <asp:DropDownList ID="DDLAddData" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDLAddData_SelectedIndexChanged"
                                                Width="230px">
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            Select Contact:
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtReportTo" runat="server" Width="300px"></asp:TextBox>
                                            <asp:HiddenField ID="txtReportTo_hidden" runat="server" />
                                        </td>
                                        <td>
                                            <asp:Button ID="btnSave" runat="server" Text="Delete Contact" CssClass="btnUpdate" OnClick="btnSave_Click" />
                                         
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: left" visible="false">
                                            <asp:HiddenField ID="txtID" runat="server" />
                                            <asp:HiddenField ID="MType" runat="server" />
                                            <asp:HiddenField ID="ddlValue" runat="server" />
                                            <asp:HiddenField ID="ddlText" runat="server" />
                                            <%-- <asp:ListBox ID="LLbAddData" runat="server" Width="100%" Height="266px" SelectionMode="Multiple" Visible="false"></asp:ListBox>--%>
                                            <br />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                              <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click"></asp:AsyncPostBackTrigger>
                            </Triggers>
                        </asp:UpdatePanel>
                        
                        <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                            <ProgressTemplate>
                                <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
                                    top: 50%; background-color: white; layer-background-color: white; height: 80;
                                    width: 150;'>
                                    <table width='100' height='35' border='1' cellpadding='0' cellspacing='0' bordercolor='#C0D6E4'>
                                        <tr>
                                            <td>
                                                <table>
                                                    <tr>
                                                        <td height='25' align='center' bgcolor='#FFFFFF'>
                                                            <img src='../images/progress.gif' width='18' height='18'></td>
                                                        <td height='10' width='100%' align='center' bgcolor='#FFFFFF'>
                                                            <font size='1' face='Tahoma'><strong align='center'>Please Wait..</strong></font></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </ProgressTemplate>
                        </asp:UpdateProgress>
                    </td>
                </tr>
                
            </table>
        </div>
    </form>
</body>
</html>
