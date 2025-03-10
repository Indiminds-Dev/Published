<%@ page language="C#" autoeventwireup="true" inherits="management_test1, App_Web__yen2upk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml">



<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
 <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
<script type="text/javascript" src="../JSFUNCTION/jquery.meio.mask.js"></script>
    <style type="text/css">
	.grid_scrollNSEFO
     {
	    overflow-y:scroll;  
        overflow-x:scroll; 
        height:350px;
        width:1000px;
        scrollbar-base-color: #DDECFE;
        
     }
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

    <script type="text/javascript">
  (function($){
    // call setMask function on the document.ready event
      $(function(){
        $('input:text').setMask();
      }
    );
  })(jQuery);
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" alt="date"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <asp:GridView ID="gvUsers" runat="server">
                <Columns>
                    <asp:TemplateField HeaderText="User ID">
                        <ItemTemplate>
                            <asp:Label ID="lblUserID" runat="server" Text='<%# Eval("cashbank_id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="First Name">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Text='<%# Eval("cashbank_id") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Test Name">
                        <ItemTemplate>
                            <asp:Label ID="lblLastName" Visible='<%# !(bool) IsInEditMode %>' runat="server" Text='<%# Eval("cashbank_vouchernumber") %>' />
                            <asp:TextBox ID="txtLastName" Visible="true" runat="server" alt="date" />
                            <input id="Text1" type="text" alt="date" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" /><asp:Button
                ID="Button2" runat="server" Text="Button" />
        </div>
    </form>
</body>
</html>
