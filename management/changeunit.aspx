<%@ page language="C#" autoeventwireup="true" inherits="management_changeunit, App_Web_xu-hjjp9" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />

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

    <script language="javascript" type="text/javascript">

  function FunCallAjaxList(objID,objEvent,ObjType)
        {
        //alert(ObjType);
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
               
               if(ObjType=='ProductFo')
                {
               
                     strQuery_Table = "Master_uom";
                     strQuery_FieldName = "distinct top 10 (isnull(Uom_Name,''))+'[' + Uom_Shortname+']',Uom_id";
                     
                    strQuery_WhereClause = "  ( Uom_Name like (\'%RequestLetter%') or Uom_Shortname like (\'%RequestLetter%') )";
                    
                }
                
                
                CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                
                 ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
              
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
 function CallAjax(obj1,obj2,obj3)
    {
    
       // FieldName='ctl00_ContentPlaceHolder1_Headermain1_cmbCompany';
       ajax_showOptions(obj1,obj2,obj3);
       //alert (ajax_showOptions);
    }
  

FieldName='abcd';
    function SignOff()
    {
        window.parent.SignOff();
    }
      

    function height()
    {
        if(document.body.scrollHeight>=300)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '300px';
        window.frameElement.Width = document.body.scrollWidth;
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
                        <strong><span style="color: #000099">Change Unit</span></strong>
                    </td>
                </tr>
            </table>
            <%--<table width="400px" align="center" style="border: solid 1px white;">
                
            </table>--%>
            <table width="400px" align="center" style="border: solid 1px white;">
                <tr>
                    <td>
                        <table width="100%">
                            <td style="width: 80px; text-align: left;">
                                <span id="Span2" class="Ecoheadtxt" style="text-align: right;">Existing Unit :</span>
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; height: 37px; width:300px">
                                <strong><span id="litSegment" runat="server" style="color: Maroon"></span></strong>
                            </td>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <td style="width: 80px; text-align: left;">
                                <span id="Span1" class="Ecoheadtxt" style="text-align: right;">Change to :</span>
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; height: 37px; width:300px">
                                <asp:TextBox runat="server" Width="250px" ID="txtproduct"></asp:TextBox><asp:TextBox
                                    ID="txtproduct_hidden" runat="server" Width="14px" Style="display: none">
                                </asp:TextBox>
                            </td>
                        </table>
                    </td>
                </tr>
                <tr style="height: 10px;">
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <td style="width: 80px;">&nbsp;
                            </td>
                            <td align="left" id="td_yes" runat="server" style="width: 40px;">
                                <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Save" Width="120px" OnClick="btnYes_Click"
                                    ValidationGroup="a" />
                            </td>
                            <td style="width: 20px;">&nbsp;
                            </td>
                            <td align="left" id="td_no" runat="server" style="width: 40px;">
                                <asp:Button ID="btnNo" runat="server" CssClass="btn" Text="Cancel" Width="120px"
                                    OnClick="btnNo_Click" />
                            </td>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <asp:HiddenField ID="HiddenField1" runat="server" />
    </form>
</body>
</html>
