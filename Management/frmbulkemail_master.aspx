<%@ page language="C#" autoeventwireup="true" inherits="management_frmbulkemail_master, App_Web_yq8u0p-o" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title></title>
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
        <script type="text/javascript" src="../JSFUNCTION/init.js"></script>
	<script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js" ></script>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>
    <script language="javascript" type="text/javascript">
         function SignOff()
            {
            window.parent.SignOff()
            }
        function height()
            {
                window.frameElement.height = document.body.scrollHeight;
                window.frameElement.widht = document.body.scrollWidht;
            }
   </script>
        <script type="text/javascript" >

    function AtTheTimePageLoad()
    {
        FieldName='cmbBodySource';
        
       
       //_____________________
       document.getElementById("FormSubscription").style.display='none';
       document.getElementById("FormTemplate").style.display='none';
       document.getElementById("FormGrid").style.display='inline';
       document.getElementById("trDateTime").style.display='none';
    }
    function frmOpenNewWindow_custom(location,v_height,v_weight,top,left)
    {   
       window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ top +",left="+ left +",location=no,directories=no,menubar=no,toolbar=no,status=no,scrollbars=yes,resizable=no,dependent=no'");       
    } 
    function BodySourceChange()
    {
        //alert('s');
        var sourcecombo = document.getElementById("cmbBodySource");
        if(sourcecombo.value == '0')
            document.getElementById("trMessageBody").style.display='inline';
        else
            document.getElementById("trMessageBody").style.display='none';
    }
    
    
    //function is called on changing focused row
    function OnGridFocusedRowChanged() {
        // Query the server for the "bem_id" fields from the focused row 
        // The values will be returned to the OnGetRowValues() function     
        grid.GetRowValues(grid.GetFocusedRowIndex(), 'bem_id', OnGetRowValues);
    }
    //Value array contains "bem_id" field values returned from the server 
    function OnGetRowValues(values) 
    {
        RowId=values;
        
    }
   
    function btnCreate_click()
    {
        document.getElementById("FormSubscription").style.display='none';
        document.getElementById("FormTemplate").style.display='inline';
        document.getElementById("FormGrid").style.display='none';
        
        var cmbSendingOption = document.getElementById("cmbSendingOption");
        if(cmbSendingOption.value=='0')
            document.getElementById("tdSendingTime").style.display='none';
        else
            document.getElementById("tdSendingTime").style.display='inline';
        
       var ListBoxUserAll = document.getElementById("ListBoxUserAll");
       ListBoxUserAll.length=0;
       document.getElementById("trMessageBody").style.display='inline';
       
            var txtDescription = document.getElementById("txtDescription");
            txtDescription.value = '';
            var txtSubject = document.getElementById("txtSubject");
            txtSubject.value = '';
            var txtMessageHeader = document.getElementById("txtMessageHeader");
            txtMessageHeader.value = '';
            var cmbBodySource = document.getElementById("cmbBodySource");
            cmbBodySource.value = '0';
            var txtMessageBody = document.getElementById("txtMessageBody");
            txtMessageBody.value = '';
            var txtMessageFooter = document.getElementById("txtMessageFooter");
            txtMessageFooter.value = '';
            var txtReplyTo = document.getElementById("txtReplyTo");
            txtReplyTo.value = '';
            var txtSenderName = document.getElementById("txtSenderName");
            txtSenderName.value = '';
            var txtSenderEmail = document.getElementById("txtSenderEmail");
            txtSenderEmail.value = '';
            
       document.getElementById("txtDescription").focus();
       document.getElementById("txtRecipients_hidden").style.display='none';
       document.getElementById("txtsubscriptionID_hidden").style.display='none';
       document.getElementById("btnupdate").style.display='none';
       document.getElementById("btnSave").style.display='inline';
       RowId='0';
    }
    function btnModify_click()
    {
        document.getElementById("FormSubscription").style.display='none';
        document.getElementById("FormTemplate").style.display='inline';
        document.getElementById("FormGrid").style.display='none';
        document.getElementById("btnupdate").style.display='inline';
        document.getElementById("btnSave").style.display='none';
        var senddata='Edit~' + RowId;
        CallServer(senddata,"");
    }
    function btnDelete_click()
    {
        document.getElementById("FormSubscription").style.display='none';
        document.getElementById("FormTemplate").style.display='none';
        document.getElementById("FormGrid").style.display='inline';
        var senddata='Delete~' + RowId;
        CallServer(senddata,"");
    }
    
    function btnEditsubscription_click()
    {
        document.getElementById("FormSubscription").style.display='inline';
        document.getElementById("FormTemplate").style.display='none';
        document.getElementById("FormGrid").style.display='none';
    }
    function btnCalcel_click()
    {
        document.getElementById("FormSubscription").style.display='none';
        document.getElementById("FormTemplate").style.display='none';
        document.getElementById("FormGrid").style.display='inline';
        EmptyFields();
    }
    
    function btnRemovefromsubscriptionlist_click()
    {
        var listBox = document.getElementById("lstSuscriptions");
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
        //var listBox1 = document.getElementById("ListBoxUserAll");
        listBox.length = 0;
        for (i = 0; i < j; i++) 
        {
            var no = new Option();
            no.value = arrLookup[arrTbox[i]];
            no.text = arrTbox[i];
            listBox[i]=no;
        }
    }
    function btnAddsubscriptionlist_click()
    {
        var userid = document.getElementById("txtsubscriptionID");
        if(userid.value != '')
        {
            var ids = userid.value.split(',');
            var listBox = document.getElementById("lstSuscriptions");
            var tLength = listBox.length;
            //alert(tLength);
            
            var no = new Option();
            no.value = ids[1];
            no.text = ids[0];
            listBox[tLength]=no;
            var recipient = document.getElementById("txtsubscriptionID");
            recipient.value='';
        }
        else
            alert('Please search name and then Add!')
    }
    
    function btnAddToList_click()
    {
        var userid = document.getElementById("txtRecipients");
        var ids = userid.value.split(',');
        var listBox = document.getElementById("ListBoxUserAll");
        var tLength = listBox.length;
        //alert(tLength);
        
        var no = new Option();
        no.value = ids[1];
        no.text = ids[0];
        listBox[tLength]=no;
        var recipient = document.getElementById("txtRecipients");
        recipient.value='';
    }
    function btnRemoveToList_click()
    {
        var listBox = document.getElementById("ListBoxUserAll");
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
        //var listBox1 = document.getElementById("ListBoxUserAll");
        listBox.length = 0;
        for (i = 0; i < j; i++) 
        {
            var no = new Option();
            no.value = arrLookup[arrTbox[i]];
            no.text = arrTbox[i];
            listBox[i]=no;
        }
    }
    
    function btnSave_click()
    {
        save('New');
    }
    function save(obj)
    {
        var txtDescription = document.getElementById("txtDescription");
        if(txtDescription.value == '')
        {
            alert('Please Fill Description!');
            txtDescription.focus();
            return false;
        }
        else
        {
            var filter = /^.+"/;
            if (filter.test(txtDescription.value))
            {
                alert('Description can not have " character!'); 
                document.getElementById("txtDescription").focus();
                return false;
            }            
        }
        var txtSubject = document.getElementById("txtSubject");
        if(txtSubject.value == '')
        {
            alert('Please Fill Email Subject!');
            txtSubject.focus();
            return false;
        }
        else
        {
            var filter = /^.+"/;
            if (filter.test(txtSubject.value))
            {
                alert('Subject can not have " character!'); 
                document.getElementById("txtSubject").focus();
                return false;
            }            
        }
        var txtMessageHeader = document.getElementById("txtMessageHeader");
        if(txtMessageHeader.value == '')
        {
            alert('Please Fill Message Header!');
            txtMessageHeader.focus();
            return false;
        }
        else
        {
            var filter = /^(.|\n)+"/;
            if (filter.test(txtMessageHeader.value))
            {
                alert('Message Header can not have " character!'); 
                document.getElementById("txtMessageHeader").focus();
                return false;
            }            
        }
        var cmbBodySource = document.getElementById("cmbBodySource");
        var txtMessageBody = document.getElementById("txtMessageBody");
        if(cmbBodySource.value == '0')
        {
            if(txtMessageBody.value == '')
            {
                alert('Please Fill Message Body!');
                txtMessageBody.focus();
                return false;
            }
            else
            {   
                var str = txtMessageBody.value;
                //alert(str);
                var filter = /^(.|\n)+"/;
                if (filter.test(txtMessageBody.value))
                {
                    alert('Message Body can not have " character!'); 
                    document.getElementById("txtMessageBody").focus();
                    return false;
                }            
            }
        }
        var txtMessageFooter = document.getElementById("txtMessageFooter");
        if(txtMessageFooter.value == '')
        {
            alert('Please Fill Message Footer!');
            txtMessageFooter.focus();
            return false;
        }
        else
        {
            var filter = /^(.|\n)+"/;
            if (filter.test(txtMessageFooter.value))
            {
                alert('Message Footer can not have " character!'); 
                document.getElementById("txtMessageFooter").focus();
                return false;
            }            
        }
        var txtReplyTo = document.getElementById("txtReplyTo");
        if(txtReplyTo.value == '')
        {
            alert('Please Fill Email ID for Reply To!');
            document.getElementById("txtReplyTo").focus();
            return false;
        }
        else
        {
            var filter=/^.+@.+\..{2,3}$/;
            if (filter.test(txtReplyTo.value))
            {
            }
            else
            {
                alert('Input valid \'reply To\' E-mail ID!');
                txtReplyTo.value=''; 
                document.getElementById("txtReplyTo").focus();
                return false;   
            }
        }
        
        var txtSenderName = document.getElementById("txtSenderName");
        if(txtSenderName.value == '')
        {
            alert('Please Fill Sender Display Name!');
            txtSenderName.focus();
            return false;
        }
        else
        {
            var filter = /^.+"/;
            if (filter.test(txtSenderName.value))
            {
                alert('Sender name can not have " character!'); 
                document.getElementById("txtSenderName").focus();
                return false;
            }            
        }
        var txtSenderEmail = document.getElementById("txtSenderEmail");
        if(txtSenderEmail.value == '')
        {
            alert('Please Fill Sender Email ID!');
            txtSenderEmail.focus();
            return false;
        }
        else
        {
            var filter=/^.+@.+\..{2,3}$/;
            if (filter.test(txtSenderEmail.value))
            {
            }
            else
            {
                alert('Input valid sender E-mail ID!');
                txtSenderEmail.value='';  
                txtSenderEmail.focus(); 
                return false; 
            }
        }
        var cmbSendingOption = document.getElementById("cmbSendingOption");
        var cmbhoure = document.getElementById("cmbhoure");
        var cmbminute = document.getElementById("cmbminute");
        var cmbampm = document.getElementById("cmbampm");
        var txtStartDate = document.getElementById("txtStartDate");
        if(txtStartDate.value == '')
        {
            alert('Please Fill Start Date!');
            txtStartDate.focus();
            return false;
        }
        var txtEndDate = document.getElementById("txtEndDate");
        if(txtEndDate.value == '')
        {
            alert('Please Fill End Date!');
            txtEndDate.focus();
            return false;
        }
        
      var listBox = document.getElementById("ListBoxUserAll");
     
       var tLength = listBox.length;
         
        var userlist = '0';
        var i = 0;
        if(tLength > 0)
        {
            for (i = 0; i < tLength; i++) 
            {
                if( userlist == '0')
                {
                    userlist = listBox.options[i].value;
                }
                else
                {    
                    userlist += ',' + listBox.options[i].value;
                }
            }
        }
        alert(userlist);
        if(obj=='New')
        {
            var sendItems = 'Save~' + txtDescription.value + '~' + txtSubject.value + '~' + txtMessageHeader.value + '~' + cmbBodySource.value + '~' + txtMessageBody.value + '~' + txtMessageFooter.value + '~' + txtReplyTo.value + '~dummy~' + txtSenderName.value + '~' + txtSenderEmail.value+ '~' + cmbSendingOption.value + '~' + cmbhoure.value + '~' + cmbminute.value + '~' + cmbampm.value + '~' + txtStartDate.value + '~' + txtEndDate.value + '~' + userlist;
            //alert(sendItems);
            CallServer(sendItems,"");
        }
        if(obj=='Edit')
        {
            var sendItems = 'Update~' + txtDescription.value + '~' + txtSubject.value + '~' + txtMessageHeader.value + '~' + cmbBodySource.value + '~' + txtMessageBody.value + '~' + txtMessageFooter.value + '~' + txtReplyTo.value + '~dummy~' + txtSenderName.value + '~' + txtSenderEmail.value+ '~' + cmbSendingOption.value + '~' + cmbhoure.value + '~' + cmbminute.value + '~' + cmbampm.value + '~' + txtStartDate.value + '~' + txtEndDate.value + '~' + userlist + '~' + RowId;
            //alert(sendItems);
            CallServer(sendItems,"");
        }
    }
    function EmptyFields()
    {
        var txtDescription = document.getElementById("txtDescription");
        txtDescription.value = '';
        var txtSubject = document.getElementById("txtSubject");
        txtSubject.value = '';
        var txtMessageHeader = document.getElementById("txtMessageHeader");
        txtMessageHeader.value = '';
        var cmbBodySource = document.getElementById("cmbBodySource");
        cmbBodySource.value='0';
        var txtMessageBody = document.getElementById("txtMessageBody");
        txtMessageBody.value='';
        var txtMessageFooter = document.getElementById("txtMessageFooter");
        txtMessageFooter.value = '';
        var chkDefaultFooter = document.getElementById("chkDefaultFooter");
        chkDefaultFooter.checked = false;
        var txtReplyTo = document.getElementById("txtReplyTo");
        txtReplyTo.value = '';
        var txtUnsubscribeEmailid = document.getElementById("txtUnsubscribeEmailid");
        txtUnsubscribeEmailid='';
        var txtSenderName = document.getElementById("txtSenderName");
        txtSenderName.value='';

        var txtSenderEmail = document.getElementById("txtSenderEmail");
        txtSenderEmail.value = '';

        var cmbSendingOption = document.getElementById("cmbSendingOption");
        var cmbhoure = document.getElementById("cmbhoure");
        var cmbminute = document.getElementById("cmbminute");
        var cmbampm = document.getElementById("cmbampm");
        var listBox = document.getElementById("ListBoxUserAll");
        listBox.length=0;
    }
    function SendingMailOption(obj)
    {
        if(obj=='0')
            document.getElementById("tdSendingTime").style.display='none';
        else
            document.getElementById("tdSendingTime").style.display='inline';
    }
    function btnUpdate_click()
    {
        save('Edit');
    }

</script>
<script type="text/ecmascript" >
    function FooterChange(obj)
    {   
        if(obj==true)
        {
            CallServer('disclaimer',"");
        }
        if(obj==false)
        {
            document.getElementById("txtMessageFooter").disabled =false;
            var foot = document.getElementById("txtMessageFooter");
            foot.value = '';
        }
        
    }

    function btnEditsubscription_click()
    {
        document.getElementById("FormSubscription").style.display='inline';
        document.getElementById("FormTemplate").style.display='none';
        document.getElementById("FormGrid").style.display='inline';
        document.getElementById("txtsubscriptionID_hidden").style.display='none';
        var sendData = 'Subscriptionlist~' + RowId;
        //alert(sendData);
        CallServer(sendData,"");
    }
    function btnSaveSubscription_click()
    {
        var listBoxSubs = document.getElementById("lstSuscriptions");
        
        var listIDs='';
        var i;
        if(listBoxSubs.length > 0)
        {
            for(i=0;i<listBoxSubs.length;i++)
            {
                if(listIDs == '')
                    listIDs = listBoxSubs.options[i].value;
                else
                    listIDs += ',' + listBoxSubs.options[i].value;
            }
            var sendData = 'SaveSubscriptionlist~' + RowId + '~' + listIDs;
            CallServer(sendData,"");
        }
        else
            alert('Add User in listBox by searching from \"Subscribe user\" text box!');
    }


    function ReceiveServerData(rValue)
    {
        var DATA = rValue.split('~'); 
        //alert(rValue); 
        if(DATA[0]=='disclaimer')
        {
            if(DATA[1] != 'N')
            {
                var foot = document.getElementById("txtMessageFooter");
                foot.value = DATA[1];
                document.getElementById("txtMessageFooter").disabled =true;
            }
            else
            {
                alert('No disclaimer Present in the system!!');
            }
        }
        if(DATA[0]=='Subscriptionlist')
        {
            var listBoxSubs = document.getElementById("lstSuscriptions");
            if(DATA[1]!='N')
            {
                listBoxSubs.length=0;
                var lenth = DATA.length;
                //alert(lenth);
                var i;
                for(i=1; i<lenth; i++)
                {
                    var idWname = DATA[i].split(',');
                    var opt = new Option();
                    opt.text = idWname[1];
                    opt.value = idWname[0];
                    listBoxSubs[i-1] = opt;
                }
            }
            else
                listBoxSubs.length=0;
        }
        if(DATA[0]=='SaveSubscriptionlist')
        {
            alert(DATA[1]);
            grid.PerformCallback();
            document.getElementById("FormSubscription").style.display='none';
            var listBoxSubs = document.getElementById("lstSuscriptions");
            listBoxSubs.length=0;
        }
        if(DATA[0]=='Delete')
        {
            if(DATA[1] == 'Y')
            {
                alert(DATA[2]);
                grid.PerformCallback();
            }
            else
                alert(DATA[1]);
        }
        if(DATA[0]=='Edit')
        {
            var items = DATA[1].split('"');
            var txtDescription = document.getElementById("txtDescription");
            txtDescription.value = items[0];
            var txtSubject = document.getElementById("txtSubject");
            txtSubject.value = items[1];
            var txtMessageHeader = document.getElementById("txtMessageHeader");
            txtMessageHeader.value = items[2];
            var cmbBodySource = document.getElementById("cmbBodySource");
            cmbBodySource.value = items[3];
            var txtMessageBody = document.getElementById("txtMessageBody");
            if(items[3]=='0')
                txtMessageBody.value = items[4];
            else
                document.getElementById("trMessageBody").style.display='none';
            var txtMessageFooter = document.getElementById("txtMessageFooter");
            txtMessageFooter.value = items[5];
            var txtReplyTo = document.getElementById("txtReplyTo");
            txtReplyTo.value = items[6];
            var txtSenderName = document.getElementById("txtSenderName");
            txtSenderName.value = items[7];
            var txtSenderEmail = document.getElementById("txtSenderEmail");
            txtSenderEmail.value = items[8];
            var cmbSendingOption = document.getElementById("cmbSendingOption");
            cmbSendingOption.value = items[9];
            if(items[9]=='1')
                document.getElementById("tdSendingTime").style.display='inline';
            else
                document.getElementById("tdSendingTime").style.display='none';
            var am_pm = items[10].split(' ');
            var h_m = am_pm[0].split(':');
            var cmbhoure = document.getElementById("cmbhoure");
            cmbhoure.value = h_m[0];
            var cmbminute = document.getElementById("cmbminute");
            cmbminute.value = h_m[1];
            var cmbampm = document.getElementById("cmbampm");
            cmbampm.value = am_pm[1];
            document.getElementById("txtRecipients_hidden").style.display='none';
            
            var ListBoxUserAll = document.getElementById("ListBoxUserAll");
            ListBoxUserAll.length=0;
            var DATAlist = DATA[2].split('!');
            var lenth = DATAlist.length;
            var i;
            for(i=0; i<lenth; i++)
            {
                    var idWname = DATAlist[i].split(',');
                    var opt = new Option();
                    opt.text = idWname[1];
                    opt.value = idWname[0];
                    ListBoxUserAll[i] = opt;
            }
            
        }
        if(DATA[0]=='Save')
        {
            if(DATA[1]!='Y')
                alert(DATA[1]);
            else
            {
                alert('Successfully Updated!');
                EmptyFields();
                AtTheTimePageLoad();
                grid.PerformCallback();
            }
        }
        if(DATA[0]=='Update')
        {
            if(DATA[1]!='Y')
                alert(DATA[1]);
            else
            {
                alert('Successfully Updated!');
                EmptyFields();
                AtTheTimePageLoad();
                grid.PerformCallback();
            }
        }

    }
</script>
   </head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
<table  class="TableMain100">
    <tr>
        <td class="EHEADER" colspan="2" style="text-align:center;" >
            <strong><span style="color: #000099">Bulk Email Template</span></strong>
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top; text-align:left; width: 88px;">
            <table>
                <tr>
                    <td style="width: 64px">
                        <input id="btnNew" type="button" value="Create" class="btnUpdate" onclick="btnCreate_click()" style="width: 80px;" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 64px">
                        <input id="btnModify" type="button" value="Modify" class="btnUpdate" onclick="btnModify_click()" style="width: 80px;" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 64px">
                        <input id="btnDelete" type="button" value="Delete" class="btnUpdate" onclick="btnDelete_click()" style="width: 80px;" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 64px">
                        <input id="btnEditsubscription" type="button" value="Subscription" class="btnUpdate" onclick="btnEditsubscription_click()" style="width: 80px;" />
                    </td>
                </tr>
            </table>
        </td>
        <td style="vertical-align:top; text-align:left">
            <asp:Panel ID="Panel1" runat="server" Width="100%" BorderColor="white" BorderWidth="1px">
                <table class="TableMain100">
                    <tr id="FormGrid">
                        <td>
                            <dxwgv:ASPxGridView ID="GridBulkTemplate" ClientInstanceName="grid" KeyFieldName="bem_id" runat="server" AutoGenerateColumns="False" Width="100%" OnCustomCallback="GridBulkTemplate_CustomCallback">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="Description" FieldName="bem_description" VisibleIndex="0">
                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Subject" FieldName="bem_subject" VisibleIndex="1">
                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="In Use Date" FieldName="bem_inusedate" VisibleIndex="2" Width="20%">
                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Use Until" FieldName="bem_useuntil" VisibleIndex="3" Visible="False">
                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Subscription" FieldName="subscription" VisibleIndex="4" Visible="False">
                                        <CellStyle CssClass="gridcellleft"></CellStyle>
                                        <EditFormSettings Visible="False" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataColumn Caption="Subscription" FieldName="subs" VisibleIndex="3" Width="8%">
                                         <DataItemTemplate>
                                             <a href="javascript:void(0);" onclick="subscription_click('<%# Container.KeyValue %>');" ><%# Eval("subscription")%></a>
                                         </DataItemTemplate>
                                     </dxwgv:GridViewDataColumn>
                                </Columns>
                                <Styles>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                </Styles>
                                <SettingsPager NumericButtonCount="20" PageSize="20" ShowSeparators="True">
                                    <FirstPageButton Visible="True">
                                    </FirstPageButton>
                                    <LastPageButton Visible="True">
                                    </LastPageButton>
                                </SettingsPager>
                                <SettingsBehavior AllowFocusedRow="True" AllowSort="False" />
                                <ClientSideEvents FocusedRowChanged="function(s, e) { OnGridFocusedRowChanged(); }"  />
                                
                            </dxwgv:ASPxGridView>
                        </td>
                    </tr>
                    <tr id="FormTemplate">
                        <td>
                            <table class="TableMain100">
                                <tr>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Description:</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:TextBox ID="txtDescription" runat="server" Font-Size="12px" Width="250px"></asp:TextBox></td>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Email Subject:</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:TextBox ID="txtSubject" runat="server" Font-Size="12px" Width="245px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="gridcellright" style="width: 111px; height: 60px;">
                                        <span style="color: #000099">Message Header:</span>
                                    </td>
                                    <td class="gridcellleft" colspan="3" style="height: 60px">
                                        <asp:TextBox ID="txtMessageHeader" runat="server" Font-Size="12px" Height="50px" TextMode="MultiLine"
                                            Width="80%"></asp:TextBox>&nbsp;
                                       <a href="#" onclick="frmOpenNewWindow_custom('frmreservedword.aspx?type=receipent&control=window.opener.document.aspnetForm.txtMessageHeader.value','200','400','200','300')">
                                           <span style="color: #000099; text-decoration: underline">Use Reserved Word</span></a>
                                   </td>
                                </tr>
                                <tr>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Body Content Source:</span>
                                    </td>
                                    <td class="gridcellleft" colspan="3">
                                        <asp:DropDownList ID="cmbBodySource" runat="server" Font-Size="10px" Width="253px">
                                            <asp:ListItem Value="0">Use Text</asp:ListItem>
                                            <asp:ListItem Value="1">Use File</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr id="trMessageBody">
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Message Body:</span>
                                    </td>
                                    <td class="gridcellleft" colspan="3">
                                        <asp:TextBox ID="txtMessageBody" runat="server" Font-Size="12px" Height="100px" TextMode="MultiLine"
                                            Width="80%"></asp:TextBox>
                                            <a href="#" onclick="frmOpenNewWindow_custom('frmreservedword.aspx?type=receipent,sender&control=window.opener.document.aspnetForm.txtMessageBody.value','200','400','200','300')">
                                           <span style="color: #000099; text-decoration: underline">Use Reserved Word</span></a>
                                    </td>
                                </tr>
                                <tr id="trMessageFooter">
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Message Footer:</span>
                                    </td>
                                    <td class="gridcellleft" colspan="3">
                                        <asp:TextBox ID="txtMessageFooter" runat="server" Font-Size="12px" Height="50px" TextMode="MultiLine"
                                            Width="80%"></asp:TextBox>
                                        <asp:CheckBox ID="chkDefaultFooter" runat="server" Font-Underline="True" Text="Use Default Footer" ForeColor="#000099" Height="50px" Width="98px" /></td>
                                </tr>
                                <tr>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Reply To:</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:TextBox ID="txtReplyTo" runat="server" Font-Size="12px" Width="250px"></asp:TextBox></td>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Subscribing Email Id:</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:TextBox ID="txtRecipients" runat="server" Font-Size="12px" Width="245px"></asp:TextBox>
                                        <asp:TextBox ID="txtRecipients_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                        <a id="A2" href="javascript:void(0);" onclick="btnAddToList_click()"><span style="color: #000099;
                                            text-decoration: underline">Add to List</span></a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Sender Display Name:</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:TextBox ID="txtSenderName" runat="server" Font-Size="12px" Width="250px"></asp:TextBox></td>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Sender Email Id:</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:TextBox ID="txtSenderEmail" runat="server" Font-Size="12px" Width="245px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Sending Option:</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:DropDownList ID="cmbSendingOption" runat="server" Width="253px" Font-Size="10px">
                                            <asp:ListItem Value="0">As an when</asp:ListItem>
                                            <asp:ListItem Value="1">Specific Time Of Day</asp:ListItem>
                                        </asp:DropDownList></td>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Sending Time:</span>
                                    </td>
                                    <td class="gridcellleft" id="tdSendingTime">
                                        <asp:DropDownList ID="cmbhoure" runat="server" Width="40px" Font-Size="10px">            </asp:DropDownList>
                                        <asp:DropDownList ID="cmbminute" runat="server" Width="40px" Font-Size="10px">            </asp:DropDownList>
                                        <asp:DropDownList ID="cmbampm" runat="server" Width="45px" Font-Size="10px">            
                                            <asp:ListItem>AM</asp:ListItem>
                                            <asp:ListItem>PM</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr id="trDateTime">
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Use From:</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:TextBox ID="txtStartDate" runat="server" Font-Size="10px" TabIndex="37" Width="228px"></asp:TextBox>&nbsp;<asp:Image
                                            ID="imgStartDate" runat="server" ImageUrl="~/images/calendar.jpg" /></td>
                                    <td class="gridcellright" style="width: 111px">
                                        <span style="color: #000099">Use Until:</span>
                                    </td>
                                    <td class="gridcellleft">
                                        <asp:TextBox ID="txtEndDate" runat="server" Font-Size="10px" TabIndex="37" Width="223px"></asp:TextBox>&nbsp;<asp:Image
                                            ID="imgEnadDate" runat="server" ImageUrl="~/images/calendar.jpg" /></td>
                                </tr>
                                <tr>
                                    <td class="gridcellright" style="width: 111px">
                                    </td>
                                    <td colspan="2" class="gridcellleft">
                                        <asp:ListBox ID="ListBoxUserAll" runat="server" Font-Size="10px" Height="64px" Width="250px" OnSelectedIndexChanged="ListBoxUserAll_SelectedIndexChanged">
                                        </asp:ListBox>
                                        <a id="A3" href="javascript:void(0);" onclick="btnRemoveToList_click()"><span style="color: #000099;
                                            text-decoration: underline">Remove</span></a></td>
                                    <td class="gridcellleft" style="vertical-align:bottom" >
                                        <input id="btnSave" type="button" value="Save" class="btnUpdate" onclick="btnSave_click()" style="height: 24px; width: 48px;" />
                                        <input id="btnupdate" type="button" value="Save" class="btnUpdate" onclick="btnUpdate_click()" style="height: 24px; width: 48px;" />
                                        <input id="Button1" type="button" value="Cancel" class="btnUpdate" onclick="btnCalcel_click()" style="height: 24px; width: 48px;" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr id="FormSubscription">
                        <td>
                            <table class="TableMain100">
                                <tr>
                                    <td class="gridcellright" style="width: 78px; vertical-align:top;" >
                                        <span style="color: #000099">Subscribe User:</span>
                                    </td>
                                    <td class="gridcellleft" style=" vertical-align:top;">
                                        <asp:TextBox ID="txtsubscriptionID" runat="server" Font-Size="12px" Width="237px"></asp:TextBox>
                                        <asp:TextBox ID="txtsubscriptionID_hidden" runat="server" Font-Size="12px" Width="1px"></asp:TextBox>
                                        <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span style="color: #000099;
                                            text-decoration: underline">Add to List</span></a>
                                    </td>
                                    <td class="gridcellright" style="text-align: left" >
                                        <asp:ListBox ID="lstSuscriptions" runat="server" Font-Size="10px" Height="64px" Width="250px">
                                        </asp:ListBox>
                                        <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()"><span style="color: #000099;
                                            text-decoration: underline">Remove</span></a>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        </td>
                                    <td class="gridcellleft">
                                        <input id="btnSaveSubscription" type="button" value="Save" class="btnUpdate" onclick="btnSaveSubscription_click()" style="height: 24px; width: 48px;" />
                                        <input id="btnCancelSubscription" type="button" value="Cancel" class="btnUpdate" onclick="btnCalcel_click()" style="height: 24px; width: 48px;" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
</table>
</form>
</body>
</html>
