<%@ page language="C#" autoeventwireup="true" inherits="management_BrokerageBrideDp, App_Web_amufh4kc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>DP Brokerage</title>
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
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    <script language="javascript" type="text/javascript">
        function SignOff()
        {
            window.parent.SignOff();
        }
        function ShowFunction(obj)        
        {
              
            if(obj=='CL')
            {
                document.getElementById('TrGrp').style.display='none';
                //document.getElementById('TdCan').style.display='none';
                document.getElementById('TdCan').style.display='inline';
            }
            else                
            {
                document.getElementById('TrGrp').style.display='inline';
                document.getElementById('TdCan').style.display='inline';
            }
        }
        function ShowFunctionWithAdd()
        {
          document.getElementById('TrClient').style.display='none';
        }
        function ShowFunctionWithAdd1()
        {
          document.getElementById('TrGrp').style.display='none';
          document.getElementById('TrGrp1').style.display='none';
        }
        function CallAjax(obj,obj1,obj2)
        { 
          ajax_showOptions(obj,obj1,obj2); 
        }
        function FillValues(objVal,objCusID,objSegID,obchk)
        {
          if(obchk=='2')
            parent.document.getElementById("IFRAME_ForAllPages").contentWindow.FillValues(objVal,objCusID,objSegID);
            
          else if(obchk=='1')
            parent.FillValues(objVal,objCusID,objSegID);
            //alert(objVal,objCusID,objSegID,obchk);
        }
        function FillValuesWithAdd(objVal,obchk)
        {
            if(obchk=='2')
                parent.document.getElementById("IFRAME_ForAllPages").contentWindow.FillValuesWithAdd(objVal);
            else if(obchk=='1')
                parent.FillValuesWithAdd(objVal)
                // alert(IFRAME_ForAllPages);
        }
        FieldName='btnOk';
    </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
          <table class="TableMain100" ><tr><td>
         <table  width="400px" align="center" style="border:solid 1px white;">
         
            <tr id="TrClient">
                <td class="EcoheadCon_">
                    <asp:RadioButton ID="radCl" runat="server" Checked="True" GroupName="a" />
                </td>
                <td class="EcoheadCon_">
                    Copy Data From Latest Client SetUp
                </td>
            </tr>
            
            <tr id="TrGrp1">
                <td class="EcoheadCon_">
                    <asp:RadioButton ID="radDeft" runat="server" GroupName="a" />
                </td>
                <td class="EcoheadCon_">
                    Copy Data From Another Brokerage Group
                </td>
            </tr>
            <tr id="TrGrp">
                <td class="EcoheadCon_">
                    Group Name
                </td>
                <td class="EcoheadCon_">
                    <asp:TextBox ID="txtGroupName" Font-Size="10px" runat="server" Width="206px"></asp:TextBox>
                    <asp:HiddenField ID="txtGroupName_hidden" runat="server" />
                </td>
            </tr>
            <tr>
                <td id="TdCan">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" Height="27px" Width="60px" OnClick="btnCancel_Click" />
                </td>
                 <td>
                    <asp:Button ID="btnOk" runat="server" Text="Ok" CssClass="btnUpdate" Height="27px" Width="60px" OnClick="btnOk_Click"/>
                </td>
            </tr>
        </table>
          </td></tr></table> 
    </form>
</body>
</html>
