<%@ page language="C#" autoeventwireup="true" inherits="management_SUBBRKGCALCULATION, App_Web_ng-agpzn" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>BRKG CALCULATION</title>
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
                FnActionChange('0');
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
   function Delete()
    {        
        var answer = confirm ("Are You Sure You Want To Delete ?");
        if (answer==true)
        {
            var answer1 = confirm ("Are You Really Sure ?");
            if(answer1==true)
            {
                var answer2 = confirm ("Are You Really Sure ?");
                
                if(answer2==true)
                {
               
                    document.getElementById('BtnDelete').click();
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        else
        {
        return false;
        } 
                
    }
    
  function FnActionChange(obj)
    {
        if(obj=="0")
        {
            Show('Td_GeneRate');
            Hide('Td_Remove');
        }
        else
        {
            Hide('Td_GeneRate');
            Show('Td_Remove');
        }
        Hide('showFilter');
    }
    function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
    function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
            }
  
    function FunCallAjaxList(objID,objEvent)
        {
               var strQuery_Table = '';
               var strQuery_FieldName = '';
               var strQuery_WhereClause = '';
               var strQuery_OrderBy='';
               var strQuery_GroupBy='';
               var CombinedQuery='';
            
                strQuery_Table = " tbl_master_contact";
                strQuery_FieldName = " distinct top 10 isnull(rtrim(cnt_firstName),'')+' '+isnull(rtrim(cnt_middlename),'')+' '+isnull(rtrim(cnt_lastName),'')+' ['+isnull(rtrim(cnt_SHORTNAME),'')+']' ,cnt_internalID";
                strQuery_WhereClause = " ( cnt_SHORTNAME like (\'RequestLetter%') or CNT_FIRSTNAME like (\'RequestLetter%')) and cnt_branchid in (<%=Session["userbranchHierarchy"]%>)";
                 
                if(document.getElementById('ddlType').value=="Sub Broker")
                      strQuery_WhereClause = strQuery_WhereClause+ " and cnt_internalid like 'SB%' ";
                 else if(document.getElementById('ddlType').value=="Relationship Partner")
                      strQuery_WhereClause = strQuery_WhereClause+ " and cnt_internalid like 'RA%' ";
                  
                
                 CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                 ajax_showOptions(objID,'GenericAjaxList',objEvent,replaceChars(CombinedQuery));
           
        }

       function replaceChars(entry) 
       {
            out = "+"; // replace this
            add = "--"; // with this
            temp = "" + entry; // temporary holder

            while (temp.indexOf(out)>-1) 
            {
                pos= temp.indexOf(out);
                temp = "" + (temp.substring(0, pos) + add + 
                temp.substring((pos + out.length), temp.length));
            }
            return temp;
      }       
      function FnCommission(obj)
      {
        if(obj=="a")
            Hide('showFilter');
         else
         {
            Show('showFilter');
            document.getElementById('cmbsearchOption').value='Commission';
         }
        
      }
     function btnAddsubscriptionlist_click()
    {
    
        var userid = document.getElementById('txtSelectionID');
        if(userid.value != '')
        {
            var ids = document.getElementById('txtSelectionID_hidden');
            var listBox = document.getElementById('lstSlection');
            var tLength = listBox.length;


            var no = new Option();
            no.value = ids.value;
            no.text = userid.value;
            listBox[tLength]=no;
            var recipient = document.getElementById('txtSelectionID');
            recipient.value='';
        }
        else
            alert('Please search name and then Add!')
            var s=document.getElementById('txtSelectionID');
            s.focus();
            s.select();
           
  }
    function clientselectionfinal()
	        {
	            var listBoxSubs = document.getElementById('lstSlection');
	          
                var cmb=document.getElementById('cmbsearchOption');
                var listIDs='';
                var i;
                if(listBoxSubs.length > 0)
                {  
                           
                    for(i=0;i<listBoxSubs.length;i++)
                    {
                        if(listIDs == '')
                            listIDs = listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                        else
                            listIDs += ',' + listBoxSubs.options[i].value+';'+listBoxSubs.options[i].text;
                    }
                    var sendData = cmb.value + '~' + listIDs;
                    CallServer(sendData,"");
                   
                }
	            var i;
                for(i=listBoxSubs.options.length-1;i>=0;i--)
                {
                    listBoxSubs.remove(i);
                }
            
                Hide('showFilter');
                document.getElementById('BtnScreen').disabled=false;
	        }
	 function FnExport()
	 {
	 document.getElementById('BtnExport').click();
	 }          
       FieldName='lstSlection';
 </script>
  <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
                
                var j=rValue.split('~');

                document.getElementById('HiddenField_Commission').value = j[1];
        }
        </script> 

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE">
    <form id="form1" runat="server" autocomplete="off">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server" AsyncPostBackTimeout="3600">
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
                    <td class="EHEADER" colspan="0" style="text-align: center; height: 22px;">
                        <strong><span id="SpanHeader" style="color: #000099">Sub Brokerage & Commission Calculations</span></strong>
                    </td>
                </tr>
            </table>
            <table id="tab2">
                <tr>
                    <td valign="top" class="gridcellleft">
                        <table>
                            <tr>
                                <td id="Td_DateWise" valign="top">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Period :</td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="DtFromDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="150px" ClientInstanceName="DtFromDate">
                                                    <DropDownButton Text="From">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                            <td>
                                                <dxe:ASPxDateEdit ID="DtToDate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                                    Font-Size="10px" Width="150px" ClientInstanceName="DtToDate">
                                                    <DropDownButton Text="To">
                                                    </DropDownButton>
                                                </dxe:ASPxDateEdit>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="gridcellleft">
                        <table border="10" cellpadding="1" cellspacing="1">
                            <tr valign="top">
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Posting Date :</td>
                                <td>
                                    <dxe:ASPxDateEdit ID="dtdate" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                        Font-Size="10px" Width="150px" ClientInstanceName="dtdate">
                                        <DropDownButton Text="For">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td class="gridcellleft" bgcolor="#B7CEEC">
                                    Action :</td>
                                <td>
                                    <asp:DropDownList ID="ddlAction" runat="server" Width="150px" Font-Size="10px" onchange="FnActionChange(this.value)">
                                        <asp:ListItem Value="0">Generate</asp:ListItem>
                                        <asp:ListItem Value="1">Delete</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr valign="top">
                    <td class="gridcellleft">
                        <table>
                            <tr valign="top">
                                <td style="height: 201px">
                                    <table border="10" cellpadding="1" cellspacing="1">
                                        <tr>
                                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                                Commission For :</td>
                                            <td>
                                                <asp:DropDownList ID="ddlType" runat="server" Width="150px" Font-Size="10px">
                                                    <asp:ListItem Value="Sub Broker">Sub Broker</asp:ListItem>
                                                    <asp:ListItem Value="Relationship Partner">Relationship Partner</asp:ListItem>
                                                </asp:DropDownList></td>
                                            <td>
                                                <asp:RadioButton ID="rdbCommissionAll" runat="server" Checked="True" GroupName="e"
                                                    onclick="FnCommission('a')" />
                                                All</td>
                                            <td>
                                                <asp:RadioButton ID="rdCommissionSelected" runat="server" GroupName="e" onclick="FnCommission('b')" />Selected
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="gridcellleft" id="Td_GeneRate">
                                                <asp:Button ID="BtnScreen" runat="server" Text="Generate" CssClass="btnUpdate" Height="23px"
                                                    Width="101px" OnClick="BtnScreen_Click"  /></td>
                                            <td id="Td_Remove" colspan="3">
                                                <asp:Button ID="BtnDelete" runat="server" CssClass="btnUpdate" Height="23px" Text="Remove"
                                                    Width="100px" OnClientClick="javascript:return Delete();" OnClick="BtnDelete_Click"  />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="height: 201px">
                                    <table border="10" cellpadding="1" cellspacing="1" id="showFilter">
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="320px" onkeyup="FunCallAjaxList(this,event)"></asp:TextBox></td>
                                            <td>
                                                <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                    Enabled="false">
                                                    <asp:ListItem Value="Commission">Commission</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                <a id="P4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                        style="color: #009900; font-size: 8pt;"> </span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="120px" Width="400px">
                                                </asp:ListBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center">
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <a id="P1" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                                                text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                        </td>
                                                        <td>
                                                            <a id="P2" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                                                <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table>
                <tr>
                    <td>
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
                                                            <font size='2' face='Tahoma'><strong align='center'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Loading..</strong></font></td>
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
                <tr style="display:none;">
                    <td>
                        <asp:HiddenField ID="HiddenField_Commission" runat="server" />
                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>
<asp:Button ID="BtnExport" runat="server" Text="BtnExport" CssClass="btnUpdate" Height="23px" Width="101px" OnClick="BtnExport_Click" 
                          
                          
                           />
</td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="BtnScreen" EventName="Click" />
                                <asp:AsyncPostBackTrigger ControlID="BtnDelete" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
     

    </form>
</body>
</html>