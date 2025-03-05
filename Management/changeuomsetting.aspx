<%@ page language="C#" autoeventwireup="true" inherits="management_changeuomsetting, App_Web_dw8rtpla" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <%--<link type="text/css" href="../CSS/AjaxStyle.css" rel="Stylesheet" />--%>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
     <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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

  function FunCallAjaxList(objID,objEvent,ObjType)
        {
        //alert(ObjType);
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
                var alert3= (document.getElementById('txttoname').value);
               var alert4= (document.getElementById('txtfromname').value);
              
               var alert1= (document.getElementById('txttoname_hidden').value);
               var alert2= (document.getElementById('txtfromname_hidden').value);
               
                if (alert3=="")
               {
               alert1=""
               }
               if (alert4=="")
               {
               alert2=""
               }
//               alert (alert3);
//               alert (alert4);
               if(ObjType=='ProductFo')
                {
               
                     strQuery_Table = "Master_uom";
                     strQuery_FieldName = "distinct top 10 (isnull(Uom_Name,''))+'[' + Uom_Shortname+']',Uom_id";
                     if (alert1!="")
                     {
//                     alert ('1');
                    strQuery_WhereClause = "  ( Uom_Name like (\'%RequestLetter%') or Uom_Shortname like (\'%RequestLetter%')) and Uom_id not in ('"+document.getElementById('txttoname_hidden').value+"')";
                    }
                    else
                    {
                    //alert ('2');
                    strQuery_WhereClause = "  ( Uom_Name like (\'%RequestLetter%') or Uom_Shortname like (\'%RequestLetter%') )";
                    }
                    
                }
                if(ObjType=='ProductFo1')
                {
               
                     strQuery_Table = "Master_uom";
                     strQuery_FieldName = "distinct top 10 (isnull(Uom_Name,''))+'[' + Uom_Shortname+']',Uom_id";
                     
                    if (alert2!="")
                    {
                    //alert ('3')
                    strQuery_WhereClause = "  ( Uom_Name like (\'%RequestLetter%') or Uom_Shortname like (\'%RequestLetter%')) and Uom_id not in ('"+document.getElementById('txtfromname_hidden').value+"') ";
                    }
                    else
                    {
                    //alert ('4');
                    strQuery_WhereClause = "  ( Uom_Name like (\'%RequestLetter%') or Uom_Shortname like (\'%RequestLetter%')  )";
                    }
                    
                }
                
                
                CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                
                 ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
                 //alert (CombinedQuery);
              
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
  

FieldName='none';
    function SignOff()
    {
        window.parent.SignOff();
    }
    
      
 function displayrate()
    {
      document.getElementById("trrate").style.display = "inline";
    }
       function noNumbers(e)
    {
    //alert (e);
        var keynum
        var keychar
        var numcheck
        
        if(window.event)//IE
        {
            keynum = e.keyCode                        
            if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                {
                 alert("Please Insert Numeric Only");
                 return false;
                }
                //alert (keynum);
         } 
         
          else if(e.which) // Netscape/Firefox/Opera
       {
           keynum = e.which  
           
           if(keynum>=48 && keynum<=57 || keynum==46)
                 {
                  return true;
                 }
                 else
                 {
                 alert("Please Insert Numeric Only");
                 return false;
                 }     
        }
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
                        <strong><span style="color: #000099">ADD/Edit Multiplier</span></strong>
                    </td>
                </tr>
            </table>
            <%--<table width="400px" align="center" style="border: solid 1px white;">
                
            </table>--%>
            <table width="400px" align="center" style="border: solid 1px white;">
            <tr id="tr_11" runat="server">
                    <td>
                        <table width="100%">
                            <td style="width: 110px; text-align: left;">
                                <span id="Span4" class="Ecoheadtxt" style="text-align: right;">From Name</span>
                            </td>
                             <td class="Ecoheadtxt" style="text-align: left; height: 37px; width: 290px">
                                <asp:TextBox runat="server" Width="250px" ID="txtfromname"></asp:TextBox><asp:TextBox
                                    ID="txtfromname_hidden" runat="server" Width="14px" Style="display: none">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtfromname"
                            ErrorMessage="Required." ValidationGroup="a"></asp:RequiredFieldValidator>
                            </td>
                        </table>
                    </td>
                </tr>
                
                <tr id="tr_12" runat="server">
                    <td>
                        <table width="100%">
                            <td style="width: 110px; text-align: left;">
                                <span id="Span6" class="Ecoheadtxt" style="text-align: right;">To Name</span>
                            </td>
                             <td class="Ecoheadtxt" style="text-align: left; height: 37px; width: 290px">
                                <asp:TextBox runat="server" Width="250px" ID="txttoname"></asp:TextBox><asp:TextBox
                                    ID="txttoname_hidden" runat="server" Width="14px" Style="display: none">
                                </asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttoname"
                            ErrorMessage="Required." ValidationGroup="a"></asp:RequiredFieldValidator>
                            </td>
                        </table>
                    </td>
                </tr>
                <tr id="tr_1" runat="server">
                    <td>
                        <table width="100%">
                            <td style="width: 110px; text-align: left;">
                                <span id="Span2" class="Ecoheadtxt" style="text-align: right;">Existing From Name</span>
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; height: 37px; width: 290px">
                                <strong><span id="litSegment" runat="server" style="color: Maroon"></span></strong>
                            </td>
                        </table>
                    </td>
                </tr>
                <tr id="tr_2" runat="server">
                    <td>
                        <table width="100%">
                            <td style="width: 110px; text-align: left;">
                                <span id="Span3" class="Ecoheadtxt" style="text-align: right;">Existing To Name</span>
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; height: 37px; width: 290px">
                                <strong><span id="litSegment1" runat="server" style="color: Maroon"></span></strong>
                            </td>
                        </table>
                    </td>
                </tr>
                <tr id="tr_3" runat="server">
                    <td>
                        <table width="100%">
                            <td style="width: 110px; text-align: left;">
                                <span id="Span5" class="Ecoheadtxt" style="text-align: right;">Existing Multiplier</span>
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; height: 37px; width: 290px">
                                <strong><span id="litSegment2" runat="server" style="color: Maroon"></span></strong>
                            </td>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <td style="width: 110px; text-align: left;">
                                <span id="Span1" class="Ecoheadtxt" style="text-align: right;">Insert Multiplier :</span>
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; height: 37px; width: 290px">
                                <asp:TextBox runat="server" Width="250px" ID="txtproduct" onkeypress="return noNumbers(event)"></asp:TextBox><asp:TextBox
                                    ID="txtproduct_hidden" runat="server" Width="14px" Style="display: none">
                                </asp:TextBox>
                            </td>
                        </table>
                    </td>
                </tr>
                <tr style="height: 10px;">
                    <td>
                        <table>
                            <td style="width: 80px; text-align: left;">
                            </td>
                            <td class="Ecoheadtxt" style="text-align: left; height: 37px; width: 300px">
                            </td>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%">
                            <td style="width: 80px;">
                                &nbsp;
                            </td>
                            <td align="left" id="td_yes" runat="server" style="width: 40px;">
                                <asp:Button ID="btnYes" runat="server" CssClass="btn" Text="Save" Width="120px" OnClick="btnYes_Click"
                                    ValidationGroup="a" />
                            </td>
                            <td style="width: 20px;">
                                &nbsp;
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
