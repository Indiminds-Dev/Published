<%@ page language="C#" autoeventwireup="true" inherits="management_DematPositionForNseCM, App_Web_psdiigfa" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Delivery Posting </title>
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

    function Page_Load()///Call Into Page Load
            {
                 height();
            }
   function height()
        {
            if(document.body.scrollHeight>=350)
            {
                window.frameElement.height = document.body.scrollHeight;
            }
            else
            {
                window.frameElement.height = '350px';
            }
            window.frameElement.width = document.body.scrollwidth;
        }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
   function fnAlert(obj)
   {
       alert(obj);
       height();
   }
    function FunCallAjaxList(objID,objEvent)
        {
           var strQuery_Table = '';
           var strQuery_FieldName = '';
           var strQuery_WhereClause = '';
           var strQuery_OrderBy='';
           var strQuery_GroupBy='';
           var CombinedQuery='';
            
             strQuery_Table = "Master_Settlements";
             strQuery_FieldName = "distinct top 10 RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)+'  ' + REPLACE(CONVERT(VARCHAR(9), settlements_StartDateTime, 6), ' ', '-') AS [DD-Mon-YY],RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)";
             strQuery_WhereClause = " settlements_exchangesegmentid='<%=Session["ExchangeSegmentID"]%>' and  Settlements_FinYear='<%=Session["LastFinYear"]%>' and ((RTRIM(settlements_Number)+RTRIM(settlements_TypeSuffix)) like (\'%RequestLetter%') or CONVERT(VARCHAR(9), settlements_StartDateTime, 6) like (\'%RequestLetter%')) ";

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
        FieldName='lstSlection';
     </script>
 

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="36000">
            </asp:ScriptManager>

           <script language="javascript" type="text/javascript"> 
   var prm = Sys.WebForms.PageRequestManager.getInstance(); 
   prm.add_initializeRequest(InitializeRequest); 
   prm.add_endRequest(EndRequest); 
   var postBackElement; 
   function InitializeRequest(sender, args) 
   { 
      if (prm.get_isInAsyncPostBack()) 
         args.set_cancel(true); 
            postBackElement = args.get_postBackElement(); 
         $get('UpdateProgress1').style.display = 'block'; 
   } 
   function EndRequest(sender, args) 
   { 
          $get('UpdateProgress1').style.display = 'none'; 
 
   } 
            </script>

             <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center; height: 20px;">
                    <strong><span id="SpanHeader" style="color: #000099">Delivery Posting </span></strong></td>

           
            </tr>
        </table>
            <table class="TableMain100">
                <tr>
                    <td align="center">
                        <table>
                            <tr>
                                <td>
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Settlement Number :
                                            </td>
                                            <td>
                                                <asp:TextBox ID="txtSettNo" runat="server" Font-Size="10px" onkeyup="FunCallAjaxList(this,event)"
                                                    Width="200Px"></asp:TextBox>
                                            </td>
                                            <td style="display: none;">
                                                <asp:TextBox ID="txtSettNo_hidden" runat="server" Font-Size="10px" Width="200Px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Generate Type :
                                            </td>
                                            <td colspan="2" align="left">
                                                <asp:DropDownList ID="dllGenerate" runat="server" Width="100px" Font-Size="10px">
                                                    <asp:ListItem Value="1">Generate</asp:ListItem>
                                                    <asp:ListItem Value="2">Delete</asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td valign="top" colspan="3">
                                                <asp:Button ID="BtnGeneRate" runat="server" CssClass="btnUpdate" Height="20px" Text="Generate"
                                                    Width="150px" OnClick="BtnGeneRate_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
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
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnGeneRate" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            
            
        </div>
    </form>
</body>
</html>

