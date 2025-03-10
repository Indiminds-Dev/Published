<%@ page language="C#" autoeventwireup="true" inherits="management_frmFundFiles, App_Web_xu-hjjp9" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Fo Position</title>
    <link href="../CSS/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
     <script src="../JSFUNCTION/prototype-1.6.0.3.js" type="text/javascript" ></script>
<script type="text/javascript" src="../JSFUNCTION/ajaxList.js"></script>
<%--    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>--%>
    <style type="text/css">
       .grid_scroll 
       { 
            overflow-y: scroll;
            overflow-x: scroll;
            width:70%;
            scrollbar-base-color: #C0C0C0;
       }
    </style>
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
	
	.grid_scroll
    {
        overflow-y: no;  
        overflow-x: scroll; 
        width:99%;
        scrollbar-base-color: #C0C0C0;
    
    }
	
	form{
		display:inline;
	}
	
	</style>
    <script language="javascript" type="text/javascript">

    function height()
    { 
        if(document.body.scrollHeight>350)
        {
            window.frameElement.height = document.body.scrollHeight;
            window.frameElement.widht = document.body.scrollWidht;
        }
        else
        {
            window.frameElement.height = '350px';
            window.frameElement.widht = document.body.scrollWidht;
        }
    }
   


//        function saveText() {

//        new Ajax.Request("api/saveData.cs", {
//        parameters: { q: "saveText", },
//        onSuccess: function(request) 
//        {

//        document.getElementById('textToSave').value = "return";
//        },
//        onFailure: function(request) 
//        {
//        },
//        onException: function(exception) {}
//        });
//        }

    function CallAjax(obj1,obj2,obj3)
    { 
        ajax_showOptions(obj1,obj2,obj3);
    }
    function showOptions(obj1,obj2,obj3)
    {
//        FieldName='txtBank_hidden';  
        //alert(obj1);
//          FieldName='txtTableName';        
//        var aa=dtpDate.GetValue();
//        aa=(aa.getYear()+"-"+(aa.getMonth()+1)+"-"+aa.getDate());
          
            
        ajax_showOptions(obj1,obj2,obj3);

    }
     FieldName='txtBank_hidden';

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panelmain" runat="server" Visible="true" HorizontalAlign="Center">
                <table id="tbl_main" class="login" cellspacing="0" cellpadding="0"  style="border: solid 1px blue; width: 402px;">
                    
                    <tbody>
                    <tr>
                            <td class="EHEADER">
                                <span style="color: blue"><strong>Fund Files</strong></span></td>
                            
                    </tr>
                        <tr>
                            <td class="lt">
                                <table class="width100per" cellspacing="12" cellpadding="0" style="width: 100%">
                                    <tbody>
                                        <tr>
                                            <td class="gridcellleft" colspan="2">
                                                <span style="color: #000099; text-align: left;">Fund File</span></td>
                                            <td align="right" style="width: 278px">
                                                <asp:FileUpload ID="Fundselectfile" runat="server" Width="272px" Height="21px" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" colspan="2">
                                                Bank Type</td>
                                            <td align="right" style="width: 278px; text-align: left;">
                                                <asp:TextBox ID="txtBank" runat="server" Width="220px" Font-Size="11px" Height="15px" Visible="false" TabIndex="3"></asp:TextBox>
                                                <asp:DropDownList ID="ddlBank" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" valign="middle" colspan="2" visible="false">
                                            </td>
                                            <td align="right" valign="middle" colspan="2" >
                                                <table cellspacing="0" cellpadding="0">
                                                    <tbody>
                                                       <tr>
                                                            <td valign="top" align="left">
                                                            <asp:Button ID="BtnSave" runat="server" Text="Import File" CssClass="btn" OnClick="BtnSave_Click"
                                                                Width="84px" />
                                                            </td>
                                                            
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr style="display: none">
                                         <td style="width: 277px; height: 44px;">
                                                <asp:TextBox ID="txtBank_hidden" runat="server" Width="46px"></asp:TextBox>
                                         </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </tbody>
                </table>
             <asp:HiddenField ID="hdfname" runat="server" />
            </asp:Panel>
            
        </div>
    </form>
</body>
</html>
