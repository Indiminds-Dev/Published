<%@ page language="C#" autoeventwireup="true" inherits="management_verify_documentremarks, App_Web_e81qjzgk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" >
    <title>Untitled Page</title>
      <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>

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

  FieldName='abcd';
//   function CallAjax(obj1,obj2,obj3)
//         { 
//        // alert ('1');
//            ajax_showOptions(obj1,obj2,obj3);
//         }
         // Fieldname = 'none'
    function SignOff()
    {
        window.parent.SignOff();
    }
      
//window.onload = autoStartTimer;
    function height()
    {
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function Page_Load()
    {
        //document.getElementById('Div1').style.display="none";
    }
     function FillValues(obj)
    {
    parent.editwin.close(obj);
     
       

    }
   
    
     
               
       

        
    

 </script>

</head>

<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
  <div>
   <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
            </asp:ScriptManager>
<table class="TableMain100">
<tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Verify Remarks</span></strong>
                    </td>
                </tr></table>
 
<table  width="400px" align="center" style="border:solid 1px white;">

<tr >
<td>
<table>


        <%--<td style="width: 150px; text-align: right;">
                                                       <span id="Span1" class="Ecoheadtxt" style="text-align:right;">Content :</span>
                                                        </td>--%>
                                                    <td style="width: 60%" align="left">
                       <asp:TextBox ID="txtReportTo" runat="server" Width="600px" TextMode="MultiLine" Height="50px" ></asp:TextBox>
                      
                        
                        
                  
                </td>
                

        
        </table>
</td>
    </tr>
    <tr style="height:10px;">
    </tr>
    <tr>
    <td>
    <table>
    
    <td style="width: 60px;"></td>
    <td align="left" id="td_yes" runat="server">
            <asp:Button ID="btnYes" runat="server" CssClass="btn" OnClientClick="f2()" Text="Save" Width="120px" OnClick="btnYes_Click"   ValidationGroup="a"  />
        </td>
        <td style="width: 20px;"></td>
        <td align="left" id="td_no" runat="server">
            <asp:Button ID="btnNo" runat="server" CssClass="btn" Text="Cancel" Width="120px" OnClick="btnNo_Click" />
            
        </td>
        </table>
    </td>
    </tr>
    
    
   

</table>


</div>


    </form>
</body>
</html>


