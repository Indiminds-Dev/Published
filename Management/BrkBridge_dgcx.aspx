<%@ page language="C#" autoeventwireup="true" inherits="management_BrkBridge_dgcx, App_Web_bfdn6hbr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Brokerage</title>
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
        function page_load()
        {
            document.getElementById('Trclient123').style.display='none';
            document.getElementById('TrGrp').style.display='none';
        
        }
        function ShowFunction(obj)        
        {
              
            if(obj=='CL')
            {
                document.getElementById('TrGrp').style.display='none';
                document.getElementById('TdCan').style.display='none';
                document.getElementById('Trclient123').style.display='none';
            }
            if(obj=='Client')
            {
              document.getElementById('Trclient123').style.display='inline';
              document.getElementById('TdCan').style.display='none';
              document.getElementById('TrGrp').style.display='none';
            
            }
            if(obj=='DF')               
            {
                document.getElementById('Trclient123').style.display='none';
                document.getElementById('TrGrp').style.display='inline';
                document.getElementById('TdCan').style.display='none';
            }
            if(obj=='Fresh')               
            {
                document.getElementById('Trclient123').style.display='none';
                document.getElementById('TrGrp').style.display='none';
                document.getElementById('TdCan').style.display='none';
            }
        }
        function ShowFunctionWithAdd()
        {
                document.getElementById('TrGrp').style.display='none';
                document.getElementById('TdCan').style.display='none';
                document.getElementById('Trclient123').style.display='none';
        }
        function ShowFunctionWithAdd1()
        {
                document.getElementById('TrClient').style.display='none';
                document.getElementById('TrGrp').style.display='none';
                document.getElementById('Trclient123').style.display='none';
                document.getElementById('TdCan').style.display='none';
        }
        function ShowFunctionWithAdd2()
        {
                document.getElementById('TrClient').style.display='none';
                document.getElementById('TrGrp').style.display='none';
                document.getElementById('Trclient123').style.display='inline';
               
        }
         function ShowFunctionWithAdd3()
        {
       
                document.getElementById('TrClient').style.display='none';
                document.getElementById('TrGrp').style.display='inline';
                document.getElementById('Trclient123').style.display='none';
                
        }
         function ShowFunctionWithAdd5()
        {
                document.getElementById('TrClient').style.display='none';
                document.getElementById('TrGrp').style.display='inline';
                document.getElementById('Trclient123').style.display='none';
                document.getElementById('TrClient').style.display='none';
                
        }
         function ShowFunctionWithAdd6()
        {
                document.getElementById('TrClient').style.display='none';
                document.getElementById('TrGrp').style.display='inline';
                document.getElementById('Trclient123').style.display='none';
                document.getElementById('TrClient').style.display='inline';
        }
        
        function ShowFunctionWithAdd7()
        {
                document.getElementById('TrClient').style.display='none';
                document.getElementById('TrGrp').style.display='none';
                document.getElementById('Trclient123').style.display='inline';
                document.getElementById('TrClient').style.display='none';
        }
        
        function ShowFunctionWithAdd8()
        {
                document.getElementById('TrClient').style.display='none';
                document.getElementById('TrGrp').style.display='none';
                document.getElementById('Trclient123').style.display='inline';
                document.getElementById('TrClient').style.display='inline';
        }
//        function CallAjax(obj,obj1,obj2)
//        { 
//          ajax_showOptions(obj,obj1,obj2); 
//        }
function CallAjax1(obj,obj1,obj2)
        { 
          ajax_showOptions(obj,obj1,obj2); 
        }
function CallAjax(obj1,obj2,obj3,Query)
        {
            var CombinedQuery=new String(Query);
            ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
        }
        function replaceChars(entry) 
       {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) {
            pos= temp.indexOf(out);
            temp = "" + (temp.substring(0, pos) + add + 
            temp.substring((pos + out.length), temp.length));
            }
            return temp;
        } 
        function FillValues(objVal,objCusID,objCompID,objSegID,obchk)
        {
          if(obchk=='2')
            parent.document.getElementById("IFRAME_ForAllPages").contentWindow.FillValues(objVal,objCusID,objCompID,objSegID);
          else if(obchk=='1')
            parent.FillValues(objVal,objCusID,objCompID,objSegID);
            //alert(objVal,objCusID,objCompID,objSegID,obchk);
        }
        function FillValuesWithAdd(objVal,obchk)
        {
//        alert(obchk);
//        alert(objVal);
            if(obchk=='2')
                parent.document.getElementById("IFRAME_ForAllPages").contentWindow.FillValuesWithAdd(objVal);
            else if(obchk=='1')
                parent.FillValuesWithAdd(objVal)
        }
     function Validate()
      {
        document.getElementById("hdn_ValidateIndicator").value="Failed";
        if (document.getElementById('radDeft').checked==true)
         {
            
                if(document.getElementById('txtGroupName_hidden').value == "")
                   {
                     alert ('Please Select One Group !!');
                     return;
                   }
            
        }  
        if (document.getElementById('radclient').checked==true)
         {
            
                if(document.getElementById('txtcustomer_hidden').value == "")
                   {
                     alert ('Please Select One Client !!');
                     return;
                   }
            
        }  
        document.getElementById("hdn_ValidateIndicator").value="Successful";
           
         
      }
      function hidegroup()
      {
        document.getElementById('radDeft').checked=true
        document.getElementById('TrGrp').style.display='inline';
       document.getElementById('TdCan').style.display='none';
      }

     
        FieldName='btnOk';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td>
                    <table width="400px" align="center" style="border: solid 1px white;">
                        <tr id="TrClient">
                            <td class="EcoheadCon_">
                                <asp:RadioButton ID="radCl" runat="server" Checked="True" GroupName="a" />
                            </td>
                            <td style="font-size:12px;">
                                Copy Data From Latest Client SetUp
                            </td>
                        </tr>
                         <tr id="Trfresh">
                            <td class="EcoheadCon_">
                                <asp:RadioButton ID="radfresh" runat="server"  GroupName="a" />
                            </td>
                            <td style="font-size:12px;">
                                Fresh Setup
                            </td>
                        </tr>
                        <tr id="Trclientlabel">
                            <td class="EcoheadCon_">
                                <asp:RadioButton ID="radclient" runat="server" GroupName="a" />
                            </td>
                            <td style="font-size:12px;">
                                Copy Data From Another Client Setup
                            </td>
                        </tr>
                        <tr id="Trclient123">
                            <td style="font-size:12px;">
                                Client Name
                            </td>
                            <td class="EcoheadCon_">
                                <asp:TextBox ID="txtcustomer" Font-Size="10px" runat="server" Width="206px"></asp:TextBox>
                                <asp:HiddenField ID="txtcustomer_hidden" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="EcoheadCon_">
                                <asp:RadioButton ID="radDeft" runat="server" GroupName="a" />
                            </td>
                            <td style="font-size:12px;">
                                Copy Data From Another Brokerage Group
                            </td>
                        </tr>
                        <tr id="TrGrp">
                            <td style="font-size:12px;">
                                Group Name
                            </td>
                            <td class="EcoheadCon_">
                                <asp:TextBox ID="txtGroupName" Font-Size="10px" runat="server" Width="206px"></asp:TextBox>
                                <asp:HiddenField ID="txtGroupName_hidden" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td id="TdCan" style="display:none;">
                                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnUpdate" Height="27px"
                                    Width="60px" OnClick="btnCancel_Click" />
                                     
                            </td>
                            <td >
                                <asp:Button ID="btnOk" runat="server" Text="Ok" CssClass="btnUpdate" Height="27px"
                                    Width="60px" OnClick="btnOk_Click" OnClientClick="return Validate();" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hdn_ValidateIndicator" runat="server" />
        <asp:HiddenField ID="hdn_hiddensendserver" runat="server" />
    </form>
</body>
</html>
