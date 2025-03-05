<%@ page language="C#" autoeventwireup="true" inherits="Reports_frm_ReportProfitLoss, App_Web_yvy99of_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

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
    
    function  HideExport()
    {
      document.getElementById("ShowExport").style.display="none";
    
    }
     function btnAddsubscriptionlist_click()
        {
            var userid = document.getElementById('txtsegselected');
            if(userid.value != '')
            {
                var ids = document.getElementById('txtsegselected_hidden');
                var listBox = document.getElementById('lstSegment');
                var tLength = listBox.length;
                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('txtsegselected');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('txtsegselected');
            s.focus();
            s.select();
        }
        
          function clientselectionfinal()
	    {
	        var listBoxSubs = document.getElementById('lstSegment');
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
            document.getElementById('TdFilter').style.visibility='hidden';
//	        document.getElementById('TdSelect').style.visibility='visible';
//	        document.getElementById('rdAll').checked='true';
	    }
	    
	     function btnRemovefromsubscriptionlist_click()
        {
            
            var listBox = document.getElementById('lstSegment');
            var tLength = listBox.length;
            
            var arrTbox = new Array();
            var arrLookup = new Array();
            var i;
            var j = 0;
            for (i = 0; i < listBox.options.length; i++) 
            {
                if (listBox.options[i].selected && listBox.options[i].value != "") 
                {
                    
                }
                else 
                {
                    arrLookup[listBox.options[i].text] = listBox.options[i].value;
                    arrTbox[j] = listBox.options[i].text;
                    j++;
                }
            }
            listBox.length = 0;
            for (i = 0; i < j; i++) 
            {
                var no = new Option();
                no.value = arrLookup[arrTbox[i]];
                no.text = arrTbox[i];
                listBox[i]=no;
            }
        }
          function MainAll(obj1,obj2)
        {
            document.getElementById('cmbsearchOption').value=obj1;
            if(obj2=='all')
            {
                
                document.getElementById('TdFilter').style.visibility='hidden';
//	            document.getElementById('TdSelect').style.visibility='hidden';
            }
            else    
            {
                document.getElementById('TdFilter').style.visibility='visible';
//	            document.getElementById('TdSelect').style.visibility='visible';
            }
        }
       function MainAllBranch(obj)
       {
        if(obj=='all')
            {
                
                document.getElementById('TdFilterBranch').style.visibility='hidden';
//	            document.getElementById('TdSelectBranch').style.visibility='hidden';
            }
            else    
            {
                document.getElementById('TdFilterBranch').style.visibility='visible';
//	            document.getElementById('TdSelectBranch').style.visibility='visible';
            }
       }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
        window.frameElement.Width = document.body.scrollWidth;
    }
    function ShowMainAccountName(obj1,obj2,obj3)
 {
     var cmb=document.getElementById("cmbsearchOption");
     var obj4=cmb.value;
    ajax_showOptions(obj1,obj2,obj3,obj4);
   
 }
 
function ShowBranchName(obj1,obj2,obj3)
{
 ajax_showOptions(obj1,obj2,obj3,'Branch');    
}
FieldName='lstSegment';
 function SegSelected(obj)
{
//    document.getElementById('showFilter').style.display='inline';
    document.getElementById('cmbsearchOption').value=obj;
//    FocusFiter();
}
function setCombo()
{

    document.getElementById("ShowExport").style.display="inline";
     document.getElementById('ddlExport').value='Ex';
     
}
    </script>

    <script type="text/ecmascript">
        
	    function ReceiveServerData(rValue)
        {
            var Data=rValue.split('~');
             if(Data[0]=='Segment')
            {
                  
                var combo = document.getElementById('litSegment');
                var NoItems=Data[1].split(',');
                var i;
                var val='';
                var seg='';
                for(i=0;i<NoItems.length;i++)
                {
                    var items = NoItems[i].split(';');
                    if(val=='')
                    {
                        seg=items[0];
                        val="'" +items[1]+ "'";
                       
                    }
                    else
                    {
                        seg+=','+items[0];
                        val+=",'"+items[1] +"'";
                      
                    }
                }               
              //  document.getElementById('HdnBranch').value=seg;
                combo.innerText=val;
              //  document.getElementById('HDNSeg').value=val;
                
            }

            if(Data[0]=='Branch')
            {
                //groupvalue=Data[1];
                var combo = document.getElementById('litSegment1');
                combo.innerText==Data[1];
               // document.getElementById('HdnSegment').value=Data[1];
            }    
            
//            var Data=rValue.split('~');
//            var NoItems=Data[1].split(';');
//            var val=''; 
//            for(i=0;i<NoItems.length/2;i++)
//            {
//                if(val=='')
//                    {
//                        val='('+NoItems[i];
//                    }
//                    else
//                    {
//                        val+=','+NoItems[i];
//                    }
//            }
//            val=val+')';
//            if(Data[0]=='Segment')
//            {
//                var combo = document.getElementById('litSegment');
//                combo.innerText=val;
//            }
//            else if(Data[0]=='Branch')
//            {
//                var combo = document.getElementById('litSegment1');
//                combo.innerText=val;
//            }
        } 
            
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td colspan="3" style="font-weight: bold; color: Blue" align="center" class="EHEADER">
                    Profit & Loss Statement</td>
            </tr>
            <tr>
                <td>
                    <table cellspacing="1" cellpadding="2" style="background-color: #B7CEEC; border: solid 1px  #ffffff"
                        border="1">
                        <tr>
                            <td>
                                <asp:Label ID="Label1" runat="server" Text="For the Period:" CssClass="mylabel1"
                                    Width="103px"></asp:Label>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <dxe:aspxdateedit id="AspxFromDate" runat="server" editformat="custom" usemaskbehavior="True">
                                                <buttonstyle width="13px">
                                                </buttonstyle>
                                            </dxe:aspxdateedit>
                                        </td>
                                        <td style="width: 10%" class="rt">
                                            <asp:Label ID="Label2" runat="server" Text="To:" CssClass="mylabel1"></asp:Label>
                                        </td>
                                        <td>
                                            <dxe:ASPxDateEdit ID="AspxTodate" runat="server" EditFormat="custom" UseMaskBehavior="True">
                                                <buttonstyle width="13px">
                                                 </buttonstyle>
                                            </dxe:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Text="Segment:" CssClass="mylabel1"></asp:Label></td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdAll" runat="server" GroupName="k" Checked="true" /></td>
                                        <td>
                                            <%--  <asp:Label ID="Label4" runat="server" Text="All" CssClass="mylabel1"></asp:Label>--%>
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdselected" runat="server" GroupName="k" /></td>
                                        <td>
                                            <%--  <asp:Label ID="Label5" runat="server" Text="Selected" CssClass="mylabel1"></asp:Label>--%>
                                            Selected
                                        </td>
                                        <td>
                                            <span id="litSegment" runat="server" style="color: Maroon" visible="true"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label6" runat="server" Text="Branch:" CssClass="mylabel1"></asp:Label>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:RadioButton ID="rdAllBranch" runat="server" GroupName="R" Checked="true" /></td>
                                        <td>
                                            <%--<asp:Label ID="Label7" runat="server" Text="All" CssClass="mylabel1"></asp:Label>--%>
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdSelectedBranch" runat="server" GroupName="R" /></td>
                                        <td>
                                            <%--<asp:Label ID="Label8" runat="server" Text="Selected" CssClass="mylabel1"></asp:Label>--%>
                                            Selected
                                        </td>
                                        <td>
                                            <span id="litSegment1" runat="server" style="color: Maroon" visible="true"></span>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnShow" OnClick="btnShow_Click" runat="server" CssClass="btnUpdate"
                                    OnClientClick="setCombo()" Text="Show"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </td>
                <td id="TdFilter" style="visibility: hidden" valign="top">
                    <table>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtsegselected" runat="server" Width="200px"></asp:TextBox>
                                <asp:HiddenField ID="txtsegselected_hidden" runat="server" />
                                <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="85px"
                                    Enabled="false">
                                    <asp:ListItem>Branch</asp:ListItem>
                                    <asp:ListItem>Segment</asp:ListItem>
                                </asp:DropDownList>
                                <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                    style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:ListBox ID="lstSegment" runat="server" Font-Size="10px" Height="90px" Width="300px">
                                </asp:ListBox></td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <td>
                                        <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                            text-decoration: underline; font-size: 10pt;">Done</span></a>
                                    </td>
                                    <td>
                                        <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
                                            <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                    </td>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="ShowExport" runat="server">
                <td valign="top" colspan="2" align="right">
                    <asp:DropDownList ID="ddlExport" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlExport_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="Ex">Export</asp:ListItem>
                        <asp:ListItem Value="E">Excel</asp:ListItem>
                        <asp:ListItem Value="P">PDF</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div id="MainContainer" runat="server" class="TableMain100" style="text-align: center"
                        visible="true">
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
