<%@ page language="C#" autoeventwireup="true" inherits="management_frm_AddEditBranchGroup, App_Web_bfdn6hbr" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
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

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
    
         <script language="javascript" type="text/javascript">
            FieldName=null;
            
            function height()
                {
                
                    if(document.body.scrollHeight>=500)
                        window.frameElement.height = document.body.scrollHeight;
                    else
                        window.frameElement.height = '850px';
                    window.frameElement.Width = document.body.scrollWidth;
                }
            
            function GetBranches(obj1,obj2,obj3)
                {
                   var strQuery_Table = "tbl_master_branch";
                   var strQuery_FieldName = "top 10 (isnull(branch_description,\'\')+ \'-[\'+ isnull(branch_code,\'\') + \']\') as Branch,branch_id";
                   var strQuery_WhereClause = " (branch_description Like (\'%RequestLetter%\') or branch_code Like (\'%RequestLetter%\')) and branch_id not in (select BranchGroupMembers_BranchID from trans_branchgroupmembers)";
                   var strQuery_OrderBy='';
                   var strQuery_GroupBy='';
                   var CombinedQuery=new String(strQuery_Table+"$"+strQuery_FieldName+"$"+strQuery_WhereClause+"$"+strQuery_OrderBy+"$"+strQuery_GroupBy);
                   ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery)); 
                
                }
         function replaceChars(entry) {
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
         
         function btnAddBranch()
        {
            var userid = document.getElementById('txtBranch');
            if(userid.value != '')
            {
                var ids = document.getElementById('txtBranch_hidden');
                var listBox = document.getElementById('lstBranches');
                var tLength = listBox.length;
                //
                var i;
                if(tLength>0)
                    {
                        for(i=0;i<tLength;i++)
                           {
                          
                             if(listBox[i].value==ids.value)
                                {
                                    alert('This Branch is Already Added !');
                                   
                                    return false;
                                }                                                            
                           
                           }                    
                    
                    }
                //
                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('txtBranch');
                recipient.value='';
                
                 var listIDs='';
                 if(listBox.length > 0)
                    {                
                        for(i=0;i<listBox.length;i++)
                        {
                            if(listIDs == '')
                                listIDs = listBox.options[i].value+';'+listBox.options[i].text;
                            else
                                listIDs += ',' + listBox.options[i].value+';'+listBox.options[i].text;
                        }
                       
                       // var sendData = cmb.value + '~' + listIDs;
                        CallServer(listIDs,"");
                       
                    }
                 
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('txtBranch');
            s.focus();
            s.select();
        } 
        
          function Branchselectionfinal()
	    {
	    
	        var listBoxSubs = document.getElementById('lstBranches');
	       // var cmb=document.getElementById('cmbsearchOption');
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
               
               // var sendData = cmb.value + '~' + listIDs;
                CallServer(listIDs,"");
               
            }
//	        var i;
            for(i=listBoxSubs.options.length-1;i>=0;i--)
            {
                listBoxSubs.remove(i);
            }
           
           // document.getElementById('TdFilter').style.visibility='hidden';
           // document.getElementById('TdFilter1').style.visibility='hidden';
	        

	    }
	    
	    function btnRemoveBranch()
            {
                
                var listBox = document.getElementById('lstBranches');
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
                
                 var listIDs='';
                 var k;
                if(listBox.length > 0)
                {                
                    for(k=0;k<listBox.length;k++)
                    {
                        if(listIDs == '')
                            listIDs = listBox.options[k].value+';'+listBox.options[k].text;
                        else
                            listIDs += ',' + listBox.options[k].value+';'+listBox.options[k].text;
                    }
                   
                   // var sendData = cmb.value + '~' + listIDs;
                    CallServer(listIDs,"");
                   
                }
                    
            }
	    
	    
	    function ReceiveServerData(rValue)
        {
            
            var Data=rValue.split('~');
            var NoItems=Data[0].split(';');
            var a='';
            if(NoItems.length>1)
            {
                
                var NoItemsDis=Data[1].split(',');
                for(i=0;i<NoItemsDis.length;i++)
                {
                    if(i==0)
                    {
//                        var a=NoItemsDis[i];
                          var Dis=NoItemsDis[i].split(';');
                           a=Dis[1];                   
                    }
                    else
                    {
                        var Dis=NoItemsDis[i].split(';');
                         a=a+','+Dis[1];                     
                    }
                     
                }
            }             
                   
        } 
	    
	   function CheckValid()
	        {
	           var Nameval=document.getElementById('txtName').value; 
	           var Codeval=document.getElementById('txtCode').value;
	           var listBox = document.getElementById('lstBranches');
	            if(Nameval!='')
	                if(Codeval!='')
	                   return true;    
	                  else
	                    {
	                       alert('Please Insert BranchGroup Code !'); 
	                       return false;
	                    }
	             else
	                {
	                    alert('Please Insert BranchGroup Name');
	                    return false;
	                }                       
	        
	        } 
	        
	    function EditBranch(branchtext,branchvalue)
        {
                            
                var listBox = document.getElementById('lstBranches');
                var tLength = listBox.length;
                var no = new Option();
                no.value = branchvalue;
                no.text = branchtext;
                listBox[tLength]=no;            
            
        } 
         function ClosePage()
            {
                 parent.editwin.close();
                
            }
         </script>
    
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <div>
        <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center; height: 20px;">
                        <strong><span style="color: #000099">Add/Edit Branch Groups</span></strong>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                       <table >
                            <tr>
                                <td align="left" style="width:110px">
                                   BranchGroup Name
                                </td>
                                <td align="left" style="padding-left:5px">
                                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                </td>
                                <td>
                                   
                                </td>
                                <td>
                                    
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    BranchGroup Code
                                </td>
                                <td align="left" style="padding-left:5px">
                                    <asp:TextBox ID="txtCode" runat="server"></asp:TextBox>
                                </td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                            <td valign="top" align="left" style="padding-top:7px">Add Branch</td>
                                <td align="left" colspan="3">
                                        
                                          <table>
                                                    <tr>
                                                        <td>
                                                            <asp:TextBox ID="txtBranch" runat="server" onkeyup="GetBranches(this,'GenericAjaxList',event)" Width="128px"></asp:TextBox><asp:HiddenField
                                                                ID="txtBranch_hidden" runat="server" />
                                                            <a id="A4" href="javascript:void(0);" onclick="btnAddBranch()"><span
                                                                style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                                    style="color: #009900; font-size: 8pt;">&nbsp;</span>
                                                        </td>
                                                        <td id="TdFilter1" style="height: 23px; display:none">
                                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Width="85px" Font-Size="11px"
                                                                Enabled="false">
                                                                <asp:ListItem>Branch</asp:ListItem>
                                                               
                                                            </asp:DropDownList></td>
                                                    </tr>
                                                </table>
                                                <table cellpadding="0" cellspacing="0" id="TdSelect">
                                                    <tr>
                                                        <td>
                                                            <asp:ListBox ID="lstBranches" runat="server" Font-Size="10px" Height="90px" Width="253px">
                                                            </asp:ListBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center">
                                                            <table cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td style="height: 14px">
                                                                        
                                                                    </td>
                                                                    <td>
                                                                        <a id="A1" href="javascript:void(0);" onclick="btnRemoveBranch()">
                                                                            <span style="color: #cc3300; text-decoration: underline; font-size: 8pt;">Remove</span></a>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                    </tr>
                                                </table>
                                </td>
                            
                            </tr>
                            <tr>
                                <td></td>
                                <td align="left" colspan="3">
                                    <asp:Button ID="btnSubmit" runat="Server" Text="Submit" OnClientClick="return CheckValid()" OnClick="btnSubmit_Click" />
                                </td>
                            </tr>
                       </table> 
                    </td>
                </tr>
        </table>
    </div>
    </form>
</body>
</html>
