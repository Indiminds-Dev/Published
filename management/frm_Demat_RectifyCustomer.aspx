<%@ page language="C#" autoeventwireup="true" inherits="management_frm_Demat_RectifyCustomer, App_Web_-k9nslwd" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
    <script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
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
</head>
<body>
<script language="javascript" type="text/javascript">

        function PageLoad()
         {
//             alert('Hi');
             FieldName='btnSave';   
             document.getElementById('txtClient_hidden').style.display="none";                
             
         } 
         
        function CallAjax(obj1,obj2,obj3)
         { 
             ajax_showOptions(obj1,obj2,obj3,'','Sub');
                 
         }
         function AllowNumericAndDecimalOnly(e)
            {
                var keycode;
                if (window.event) keycode = window.event.keyCode;
                else if (event) keycode = event.keyCode;
                else if (e) keycode = e.which;
                else return true;
                if( (keycode == 46)||(keycode > 47 && keycode <= 57)  )
                {
                    return true;
                }
                else
                {
                    return false;
                }
                return true;

            }
         function checkClient()
         {
//         alert('checkClient');
         
            qty = window.location.search.split('=')[5];
            var countCheck=0;
          
            var grid = document.getElementById("<%= gridRectCust.ClientID %>");
            //variable to contain the cell of the grid
            var cell;
            rownum = '';
            newQty = '';
          
            
            if (grid.rows.length > 0)
            {
                //loop starts from 1. rows[0] points to the header.
                for (i=1; i<grid.rows.length; i++)
                {
                    //get the reference of template column
                    cell = grid.rows[i].cells[3];
                    
                    //loop according to the number of childNodes in the cell
                    for (j=0; j<cell.childNodes.length; j++)
                    {   
                           
//                        //if childNode type is CheckBox                 
//                        if ((cell.childNodes[j].type =="checkbox")&&(cell.childNodes[j].checked))
                        if (cell.childNodes[j].type =="text")
                        {
                            if (cell.childNodes[j].value != '')
                            { 
                                if (eval(countCheck) == 0)
                                {
                                    rownum = rownum + i;
                                    newQty = newQty + cell.childNodes[j].value
                                }
                                else 
                                {
                                    rownum = rownum + ',' + i;
                                    newQty = newQty + ',' + cell.childNodes[j].value
                                }
                                    
                                countCheck = eval(countCheck) + eval(cell.childNodes[j].value);  
                                
                                
                            }               
//                            countCheck = countCheck + 1;
//                            rownum = i;
                            
                        }
                    }
                }
            }
//            alert(countCheck);
           
            
              if (eval(countCheck) == 0)
              {
                alert("Invalid. Please select at least ONE client to continue."); 
             
              }
//              else if (eval(countCheck) > 1)             
//              {
//                alert("Invalid. Please select ONLY ONE client to continue.");               
//              }
//              
//              else 
//              {
//                rowid = grid.rows[rownum].cells[0].innerText;
//                document.getElementById("<%= hid.ClientID %>").value = rowid;
              else if (eval(countCheck) > qty)
              {
                 alert("Invalid. Total receieved quantity must not exceed pending incoming quantity.");               
              }
              else
                 document.getElementById("<%= hid.ClientID %>").value = rownum + '~' + newQty;
               
         }         
        
        function updateCustomer()
        {
            alert('Client saved sucessfully.');
            parent.editwin.close();            
        }
        
 </script>
 
    <form id="form1" runat="server" autocomplete="off">
    <div>
    <table class="TableMain100">
    <tr>
    <td colspan="4" >
    &nbsp;
    </td>
    </tr>
    <tr id="trNoClient" runat="server">
    <td align="center" style="color:Red; font-weight:bold">No Customer Found.
    </td>
    <td align="right">Search for Customer : 
    </td>
    <td align="left">
        <asp:TextBox ID="txtClient" runat="server" TabIndex="0" Width="250px" Font-Size="12px"
        onkeyup="CallAjax(this,'SearchByCustomerCL',event)"></asp:TextBox>
        <asp:TextBox ID="txtClient_hidden" runat="server" Width="14px"></asp:TextBox>
    </td>
    <td align="left">
        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
    </td>
    
    </tr> 
    <tr id="trStatus">
    <td colspan="4" >
        <asp:Label ID="lblStatus" runat="server" Font-Size="X-Small" Font-Names="Arial"
            Font-Bold="True" ForeColor="Red" />
    </td>
    </tr>
    <tr id ="trGrid1" runat="server">
    <td id="tdGrid1" colspan="4" align="center" style="color:red; font-weight:bold"  runat="server">
    
    </td>
    </tr>
    <tr id ="trGrid2" runat="server">
    <td colspan="4" align="center">
        <br />
        <asp:GridView ID="gridRectCust"  runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="No." />
                <asp:BoundField DataField="clientnames" HeaderText="Client Names" >
                    <ItemStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="DematPosition_QtyToReceive" HeaderText="Pending Incoming" />
                <asp:TemplateField HeaderText="Enter Quantity">
                <ItemTemplate>
               <%--<asp:CheckBox ID="chkClient"  runat="server" />--%>
                    <asp:TextBox ID="txtGridClient" runat="server" onkeypress="return AllowNumericAndDecimalOnly(this);"></asp:TextBox>
                </ItemTemplate>                    
                </asp:TemplateField>
                
            </Columns>
        </asp:GridView>
    </td>
    </tr> 
    <tr id="trGrid3" runat="server">
    <td colspan="4" align="center">
        <dxe:ASPxButton ID="btnSaveMulti" ClientInstanceName="btnMulti" autopostback=False 
            runat="server" Text="Save" onclick="btnSaveMulti_Click">
            <clientsideevents click="function(s, e) {checkClient();  }">
            </clientsideevents>
        </dxe:ASPxButton>
    </td>
    </tr> 
    <tr>
    <td colspan="4" align="center" style="height: 41px">
        <asp:HiddenField ID="hid" runat="server" />
    </td>
    </tr> 
    </table>
    
    </div>
    </form>
</body>
</html>
