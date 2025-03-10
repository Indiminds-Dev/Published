<%@ page language="C#" autoeventwireup="true" inherits="management_MainAccountHead, App_Web_1jeyysc_" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1.Export, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <style type="text/css">
	
	/* Big box with list of options */
	#ajax_listOfOptions{
		position:absolute;	    /* Never change this one */
		width:50px;	        /* Width of box */
		height:auto;	        /* Height of box */
		overflow:auto;	        /* Scrolling features */
		border:1px solid Blue;	/* Blue border */
		background-color:#FFF;	/* White background color */
		text-align:left;
		font-size:0.9em;
		z-index:100;
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
		z-index:900;
	}
	#ajax_listOfOptions_iframe{
		background-color:#F00;
		position:absolute;
		z-index:10;
	}
	
	form{
		display:inline;
	}
	
	</style>
 <%--<script type="text/javascript" src="../JSFUNCTION/loaddata1.js">
   
    </script>--%>

    <link rel="stylesheet" href="../windowfiles/dhtmlwindow.css" type="text/css" />

    <script type="text/javascript" src="../windowfiles/dhtmlwindow.js"></script>

    <link rel="stylesheet" href="../modalfiles/modal.css" type="text/css" />

    <script type="text/javascript" src="../modalfiles/modal.js"></script>
    <script language="javascript" type="text/javascript">
   function SignOff()
    {
        window.parent.SignOff();
    }
    function height()
    {
        if(document.body.scrollHeight>=900)
            window.frameElement.height = document.body.scrollHeight+200;
        else
            window.frameElement.height = '900px';
        window.frameElement.Width = document.body.scrollWidth;
    }
  
    function EndCall(obj)
    {
        height();
    }
     function CallList(obj1,obj2,obj3)
     {
        FieldName='Label1';
        ajax_showOptions(obj1,obj2,obj3);
     }
    function Load(obj)
    {
        alert(obj);
        document.getElementById("tdsrate").style.display = 'none';
        document.getElementById("tdsrate1").style.display = 'none';       
        document.getElementById("fbtrate").style.display = 'none';
        document.getElementById("fbtrate1").style.display = 'none';
    }
    
    function LoadSubledger(obj,obj1,obj2,obj3)
    {
        if(obj1!='None')
        {
            var aaaa=obj;
            url1="frm_Subledger.aspx?id="+aaaa+"&name="+obj1+"&accountType="+obj2+"&accountcode="+obj3;
            parent.OnMoreInfoClick(url1,"Modify Sub Ledger",'990px','520px',"Y");  
        }
   
    }
    
     function AccopuntType(obj)
     {
        if(obj=='0')
        {

        document.getElementById("tdBankCashType").style.display = 'inline';
        document.getElementById("tdBankCashType1").style.display = 'inline';
        document.getElementById("tdBankAccountNo").style.display = 'inline';
        document.getElementById("tdBankAccountNo1").style.display = 'inline';
        document.getElementById("tdBankAccountType").style.display = 'inline';
        document.getElementById("tdBankAccountType1").style.display = 'inline';
        document.getElementById("tdSubledgertype").style.display = 'none';
        document.getElementById("tdSubledgertype1").style.display = 'none';
        document.getElementById("tdExchangeSeg").style.display = 'inline';
        document.getElementById("tdExchangeSeg1").style.display = 'inline';
        document.getElementById("tddepretion").style.display = 'none';
        }
        else
        {
        
        document.getElementById("tdBankCashType").style.display = 'none';
        document.getElementById("tdBankCashType1").style.display = 'none';
        document.getElementById("tdBankAccountNo").style.display = 'none';
        document.getElementById("tdBankAccountNo1").style.display = 'none';
        document.getElementById("tdBankAccountType").style.display = 'none';
        document.getElementById("tdBankAccountType1").style.display = 'none';
        document.getElementById("tdSubledgertype").style.display = 'inline';
        document.getElementById("tdSubledgertype1").style.display = 'inline';
        document.getElementById("tdExchangeSeg").style.display = 'none';
        document.getElementById("tdExchangeSeg1").style.display = 'none';
        document.getElementById("tddepretion").style.display = 'none';
        }
      }
    
    function BankAccountType(obj)
    {
       if(obj=='2')
        {
           
            document.getElementById("tdExchangeSeg").style.display = 'none';
            document.getElementById("tdExchangeSeg1").style.display = 'none';           
             
        }
        else if(obj=='A')
        {
             document.getElementById("tdExchangeSeg").style.display = 'none';
            document.getElementById("tdExchangeSeg1").style.display = 'none';
        }
        else
        {
            
            document.getElementById("tdExchangeSeg").style.display='inline';
            document.getElementById("tdExchangeSeg1").style.display='inline';
        }
    }
        
    function ExchangeSegment(obj)
    {
       
      if(obj=='A')
        {                  
            document.getElementById("trExchange").style.display = 'none';
            document.getElementById("trExchange1").style.display = 'none';            
        }
        else if(obj=='S')
        {
            document.getElementById("trExchange").style.display='inline';
            document.getElementById("trExchange1").style.display='inline';
            comboSegment.PerformCallback();
            
        }
        else
        { 
            
              document.getElementById("trExchange").style.display='inline';
              document.getElementById("trExchange1").style.display='inline';
              comboSegment.SetValue(obj);     
              document.getElementById('hdSegment').value=obj       
        }
     }    
    
    function TDSApplicableFun(obj)
    {
       if(obj==1)
        {
             document.getElementById("tdsrate").style.display = 'inline';
             //document.getElementById("tdsrate1").style.display = 'inline'; 
        }
        else
        {
              document.getElementById("tdsrate").style.display = 'none';
             //document.getElementById("tdsrate1").style.display = 'none'; 
        }
    }
    
    function FBTApplicableFun(obj)
    {
       if(obj==1)
        {
             document.getElementById("fbtrate").style.display = 'inline';
             document.getElementById("fbtrate1").style.display = 'inline'; 
        }
        else
        {
            document.getElementById("fbtrate").style.display = 'none';
            document.getElementById("fbtrate1").style.display = 'none';
        }
    }
    function BankCashType(obj)
    {
      
        if(obj=='0')
        {
            document.getElementById("tdBankAccountType").style.display = 'inline';
            document.getElementById("tdBankAccountType1").style.display = 'inline';
            document.getElementById("tdBankAccountNo").style.display = 'inline';
            document.getElementById("tdBankAccountNo1").style.display = 'inline';
            document.getElementById("tdSubledgertype").style.display = 'none';
            document.getElementById("tdSubledgertype1").style.display = 'none';
            //Added Later
            document.getElementById("tdtdsapprate").style.display = 'none';
            document.getElementById("tdtdsapprate1").style.display = 'none';
            document.getElementById("tdfbtapprate").style.display = 'none';
            document.getElementById("tdfbtapprate1").style.display = 'none';
            document.getElementById("tdroi").style.display = 'none';
            document.getElementById("tdroi1").style.display = 'none';
            document.getElementById("tdExchangeSeg").style.display='inline';
            document.getElementById("tdExchangeSeg1").style.display='inline';
            document.getElementById("tddepretion").style.display = 'none';
            document.getElementById("trCompanyName").style.display = 'inline';
        }      
        else 
        {
              if(obj=='1')
               {
                   document.getElementById("tdBankAccountType").style.display = 'none';
                   document.getElementById("tdBankAccountType1").style.display = 'none';
                   document.getElementById("tdBankAccountNo").style.display = 'none';
                   document.getElementById("tdBankAccountNo1").style.display = 'none';
                   document.getElementById("tdSubledgertype").style.display = 'none';
                   document.getElementById("tdSubledgertype1").style.display = 'none';
                    //Added Later
                    document.getElementById("tdtdsapprate").style.display = 'none';
                    document.getElementById("tdtdsapprate1").style.display = 'none';
                    document.getElementById("tdfbtapprate").style.display = 'none';
                    document.getElementById("tdfbtapprate1").style.display = 'none';
                    document.getElementById("tdroi").style.display = 'none';
                    document.getElementById("tdroi1").style.display = 'none';
                    document.getElementById("tdExchangeSeg").style.display='none';
                    document.getElementById("tdExchangeSeg1").style.display='none';
                    document.getElementById("tddepretion").style.display = 'none';
                    document.getElementById("trCompanyName").style.display = 'inline';
               }
               else if(obj=='2')
               {
                    document.getElementById("tdBankAccountType").style.display = 'none';
                   document.getElementById("tdBankAccountType1").style.display = 'none';
                   document.getElementById("tdBankAccountNo").style.display = 'none';
                   document.getElementById("tdBankAccountNo1").style.display = 'none';
                   document.getElementById("tdSubledgertype").style.display = 'inline';
                   document.getElementById("tdSubledgertype1").style.display = 'inline';
                    //Added Later
                    document.getElementById("tdtdsapprate").style.display = 'none';
                    document.getElementById("tdtdsapprate1").style.display = 'none';
                    document.getElementById("tdfbtapprate").style.display = 'none';
                    document.getElementById("tdfbtapprate1").style.display = 'none';
                    document.getElementById("tdroi").style.display = 'none';
                    document.getElementById("tdroi1").style.display = 'none';
                    document.getElementById("tdExchangeSeg").style.display='none';
                    document.getElementById("tdExchangeSeg1").style.display='none';
                    document.getElementById("tddepretion").style.display = 'inline';
                   //  document.getElementById("trCompanyName").style.display = 'none';
               }
               else
               {
                   document.getElementById("tdBankAccountType").style.display = 'none';
                   document.getElementById("tdBankAccountType1").style.display = 'none';
                   document.getElementById("tdBankAccountNo").style.display = 'none';
                   document.getElementById("tdBankAccountNo1").style.display = 'none';
                   document.getElementById("tdSubledgertype").style.display = 'inline';
                   document.getElementById("tdSubledgertype1").style.display = 'inline';
                   //Added Later
                    document.getElementById("tdtdsapprate").style.display = 'inline';
                    document.getElementById("tdtdsapprate1").style.display = 'inline';
                    document.getElementById("tdfbtapprate").style.display = 'inline';
                    document.getElementById("tdfbtapprate1").style.display = 'inline';
                    document.getElementById("tdroi").style.display = 'inline';
                    document.getElementById("tdroi1").style.display = 'inline';
                    document.getElementById("tdExchangeSeg").style.display='none';
                     document.getElementById("tdExchangeSeg1").style.display='none';
                     document.getElementById("tddepretion").style.display = 'none';
                    // document.getElementById("trCompanyName").style.display = 'none';
               }
            
        }
            
    }
    function SubLedgerTypeFun(obj)
    {
        if(obj=='11')
        {
            document.getElementById("addCustomLedger").style.display = 'inline';
        }
        else     
        {
            document.getElementById("addCustomLedger").style.display = 'none';
        }
    }
    function aaa(obj)
    {
       document.getElementById("Subledger").style.display = 'inline';
       document.getElementById("main").style.display = 'none';
    }
    function ShowHideFilter(obj)
    {
        var chk=document.getElementById("chkSysAccount");
        if(chk.checked==true)
            grid.PerformCallback(obj+'~T');
        else
            grid.PerformCallback(obj+'~F');
    }
    
    function Show(Keyvalue) {
        var url = "frm_OpeningBalance.aspx?id="+Keyvalue+"";
        popup.SetContentUrl(url);

        popup.Show();
    }
    function showhistory(obj)
    {
    
        var URL='Contact_Document.aspx?idbldng='+obj;
       
        //parent.OnMoreInfoClick(URL,"Modify Contact Details",'10px','10px',"Y");
        editwin=dhtmlmodal.open("Editbox", "iframe", URL, "Document", "width=1000px,height=400px,center=0,resize=1,top=-1", "recal");                 
        editwin.onclose=function()
             {
                 grid.PerformCallback();
             }

    }
    function ShowAssetDetail(KeyVal,Val)
    {
        var url= "AssetDetail.aspx?id="+Val+"";
        parent.OnMoreInfoClick(url,"Asset Details",'990px','510px',"Y");
//        editwin=dhtmlmodal.open("Editbox", "iframe", url,"Add/Modify AssetDetail" , "width=900px,height=500px,center=1,resize=1,scrolling=2,top=500", "recal")
//        document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='hidden';
//        editwin.onclose=function()
//         {
//         document.getElementById('ctl00_ContentPlaceHolder1_Headermain1_cmbSegment').style.visibility='visible';
//         }
//         return false;
    }

    function ShowError(obj)
    {
       if(obj!="a" && obj!="b")
       {
            var objVal=obj.split('~')
            AccopuntType(objVal[0]);
            BankCashType(objVal[1]);
            BankAccountType(objVal[2]);
            var code=objVal[3].toUpperCase(); 
            if(code=='SYSTM')
            {
               // txtAccountNo.SetEnabled(false);
                txtAccountCode.SetEnabled(false);
                ASPxComboBox1.SetEnabled(false);
                ASPxComboBox2.SetEnabled(false);
                txtBankAccountNo.SetEnabled(false);
                ASPxComboBox3.SetEnabled(false);
                CmbSubLedgerType.SetEnabled(false);
                rbSegment.SetEnabled(false);
                //txtRateofIntrest.SetEnabled(false);
                FBTApplicable.SetEnabled(false);
                txtFBTRate.SetEnabled(false);
                TDSApplicable.SetEnabled(false);
                txtTDSRate.SetEnabled(false);
            }
            txtAccountCode.SetEnabled(false);
            if(objVal[4]!="" && objVal[4]!="0")
            {
                rbSegment.SetValue('S');
                ExchangeSegment(objVal[4]);                               
            }
       }
       
    }
    function updateEditorText() {
        var code=txtAccountCode.GetText().toUpperCase();
        if(code=='SYSTM')
        {
            alert('You Can not Enter This Code,This is Reserve Code ');
            txtAccountCode.SetText('');
        }
    } 
    function GridDelete(obj1,obj2)
    {        
        var answer = confirm ("Are You Sure You Want To Delete ?");
        if (answer)
        {
            var answer1 = confirm ("Are You Really Sure ?");
            if(answer1)
            {
                var answer2 = confirm ("Are You Really Sure ?");
                if(answer2)
                {
                    var obj3=obj1+'~'+obj2;
                    combo.PerformCallback(obj3);
                }
            }
        }                    
    }
    function ShowError1(obj)
    {
       if(obj=="b")
       {
            alert('Transaction Exists for this Code. Deletion Not Allowed !!');
            return false;
       }
       else
       {
            var chk=document.getElementById("chkSysAccount");
            if(chk.checked==true)        
                grid.PerformCallback('T');
            else
                grid.PerformCallback('F');
       }
    }
    function CompanyExchange(obj)
    {
        comboSegment.PerformCallback();
    }
    function SegmentID1(obj)
    {
        
        document.getElementById("hdSegment").value=obj;
    }
    function CallTdsAccount(objid,objfunc,objevant)
    {
        FieldName='Label1';
       // alert(objid);
        ajax_showOptions(objid,objfunc,objevant);
    }
    function checkChange(obj)
    {
        if(obj==true)
            grid.PerformCallback('T');
        else
            grid.PerformCallback('F');
    }
    function SetSegValue(segval)
        {
        
            document.getElementById("hdSegment").value=segval;
        
        }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="Off">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099;">Main Account Details</span></strong>
                </td>
            </tr>
            <tr>
                <td>
                    <table width="100%">
                        <tr>
                            <td style="text-align: left; vertical-align: top">
                                <table>
                                    <tr>
                                        <td id="ShowFilter">
                                            <a href="javascript:ShowHideFilter('s');"><span style="color: #000099; text-decoration: underline">
                                                Show Filter</span></a>
                                        </td>
                                        <td id="Td1">
                                            <a href="javascript:ShowHideFilter('All');"><span style="color: #000099; text-decoration: underline">
                                                All Records</span></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkSysAccount" runat="server" Checked="True" /><span style="color: #3300cc">Hide
                                    System Accounts</span></td>
                            <td class="gridcellright">
                                <dxe:ASPxComboBox ID="cmbExport" runat="server" AutoPostBack="true" BackColor="Navy"
                                    Font-Bold="False" ForeColor="White" OnSelectedIndexChanged="cmbExport_SelectedIndexChanged"
                                    ValueType="System.Int32" Width="130px">
                                    <Items>
                                        <dxe:ListEditItem Text="Select" Value="0" />
                                        <dxe:ListEditItem Text="PDF" Value="1" />
                                        <dxe:ListEditItem Text="XLS" Value="2" />
                                        <dxe:ListEditItem Text="RTF" Value="3" />
                                        <dxe:ListEditItem Text="CSV" Value="4" />
                                    </Items>
                                    <ButtonStyle BackColor="#C0C0FF" ForeColor="Black">
                                    </ButtonStyle>
                                    <ItemStyle BackColor="Navy" ForeColor="White">
                                        <HoverStyle BackColor="#8080FF" ForeColor="White">
                                        </HoverStyle>
                                    </ItemStyle>
                                    <Border BorderColor="White" />
                                    <DropDownButton Text="Export">
                                    </DropDownButton>
                                </dxe:ASPxComboBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="MainAccountGrid" runat="server" AutoGenerateColumns="False"
                        KeyFieldName="MainAccount_ReferenceID" ClientInstanceName="grid" DataSourceID="MainAccount"
                        Width="995px" OnRowUpdating="MainAccountGrid_OnRowUpdating" OnCustomCallback="MainAccountGrid_CustomCallback"
                        OnRowValidating="MainAccountGrid_OnRowValidating" OnHtmlDataCellPrepared="MainAccountGrid_OnHtmlDataCellPrepared"
                        OnRowInserting="MainAccountGrid_OnRowInserting" OnHtmlEditFormCreated="MainAccountGrid_HtmlEditFormCreated"
                        OnStartRowEditing="MainAccountGrid_StartRowEditing" OnHtmlRowCreated="MainAccountGrid_HtmlRowCreated"
                        OnCustomJSProperties="MainAccountGrid_CustomJSProperties" >
                        <ClientSideEvents EndCallback="function(s,e) { ShowError(s.cpInsertError);

                                        }
" />
                        <Templates>
                            <EditForm>
                                <table style="text-align: left; width: 100%; background-color: #ffdead;" border="0" id="main">
                                    <tr id="trAccountName">
                                        <td style="text-align: left;">
                                            Account Name :</td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="txtAccountNo" ClientInstanceName="txtAccountNo" runat="server"
                                                Text='<%#Bind("AccountName") %>' Width="203px" MaxLength="100">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" ErrorText="Select Account Name" />
                                                </ValidationSettings>
                                            </dxe:ASPxTextBox>
                                        </td>
                                        <td style="text-align: left; ">
                                            Account Code :</td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxTextBox ID="txtAccountCode" ClientInstanceName="txtAccountCode" runat="server"
                                                Text='<%#Bind("AccountCode") %>' Width="203px" MaxLength="10">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" ErrorText="Select Account Code" />
                                                </ValidationSettings>
                                                <ClientSideEvents KeyPress="function(s,e){window.setTimeout('updateEditorText()', 10);}" />
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr id="trAccountGroup">
                                        <td style="text-align: left; ">
                                            Account Type :</td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="ASPxComboBox1" ClientInstanceName="ASPxComboBox1" runat="server"
                                                ValueType="System.String" Value='<%#Bind("AccountType") %>' Width="203px" EnableIncrementalFiltering="true">
                                                <Items>
                                                    <dxe:ListEditItem Text="Asset" Value="Asset"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Liability" Value="Liability"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Income" Value="Income"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Expenses" Value="Expences"></dxe:ListEditItem>
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" ErrorText="Select Account Name" />
                                                </ValidationSettings>
                                                <ClientSideEvents ValueChanged="function(s,e){
                                                                                          var indexr = s.GetSelectedIndex();
                                                                                          AccopuntType(indexr)
                                                                                         }" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: left; ">
                                            Account Group :</td>
                                        <td style="text-align: left;">
                                            <dxe:ASPxComboBox ID="combAccountGroup" ClientInstanceName="combAccountGroup" runat="server"
                                                ValueType="System.String" EnableIncrementalFiltering="true" Width="203px" DataSourceID="AllAccountGroup"
                                                TextField="AccountGroup" ValueField="ID" Value='<%#Bind("AccountGroup") %>'>
                                            </dxe:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr id="trBankCashType">
                                        <td style="text-align: left; " id="tdBankCashType">
                                            Asset Type :</td>
                                        <td style="text-align: left;" id="tdBankCashType1">
                                            <dxe:ASPxComboBox ID="ASPxComboBox2" ClientInstanceName="ASPxComboBox2" runat="server"
                                                ValueType="System.String" Value='<%#Bind("BankCashType") %>' EnableIncrementalFiltering="true"
                                                Width="203px" SelectedIndex="0">
                                                <Items>
                                                    <dxe:ListEditItem Text="Bank" Value="Bank" />
                                                    <dxe:ListEditItem Text="Cash" Value="Cash" />
                                                    <dxe:ListEditItem Text="Fixed Asset" Value="Fixed Asset" />
                                                    <dxe:ListEditItem Text="Other" Value="Other" />
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" ErrorText="Select Account Name" />
                                                </ValidationSettings>
                                                <ClientSideEvents ValueChanged="function(s,e){
                                                                                           var indexr = s.GetSelectedIndex();
                                                                                           BankCashType(indexr)
                                                                                         }" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: left; " id="tdBankAccountNo">
                                            Bank Account No :</td>
                                        <td style="text-align: left;" id="tdBankAccountNo1">
                                            <dxe:ASPxTextBox ID="txtBankAccountNo" ClientInstanceName="txtBankAccountNo" runat="server"
                                                Text='<%#Bind("BankAccountNo") %>' Width="203px" MaxLength="20">
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr id="trCompanyName">
                                        <td style="text-align: left; " id="td2">
                                            Company Name :</td>
                                        <td style="text-align: left;" id="td3">
                                    
                                         <dxe:ASPxComboBox ID="comboCompanyName" ClientInstanceName="comboCompanyName" runat="server"
                                                ValueType="System.String" DataSourceID="SqlCompany" ValueField="cmp_internalId"
                                                TextField="cmp_name"  EnableIncrementalFiltering="true"
                                                Width="203px">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" ErrorText="Select Account Name" />
                                                </ValidationSettings>
                                                <ClientSideEvents ValueChanged="function(s,e){CompanyExchange(s.GetValue());
                                                                                          }" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: left; " id="td4">
                                        </td>
                                        <td style="text-align: left;" id="td5">
                                        </td>
                                    </tr>
                                    <tr id="trBaAccountType">
                                        <td style="text-align: left; " id="tdBankAccountType">
                                            Bank Account Type :</td>
                                        <td style="text-align: left;" id="tdBankAccountType1">
                                            <dxe:ASPxComboBox ID="ASPxComboBox3" ClientInstanceName="ASPxComboBox3" runat="server"
                                                ValueType="System.String" Value='<%#Bind("BankAccountType") %>' Width="203px"
                                                SelectedIndex="0" EnableIncrementalFiltering="true">
                                                <Items>
                                                    <dxe:ListEditItem Text="Clearing" Value="Clearing"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Client" Value="Client"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Own" Value="Own"></dxe:ListEditItem>
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" ErrorText="Select Account Name" />
                                                </ValidationSettings>
                                                <ClientSideEvents ValueChanged="function(s,e){
                                                                                            var indexr = s.GetSelectedIndex();
                                                                                            BankAccountType(indexr)
                                                                                          }" />
                                            </dxe:ASPxComboBox>
                                        </td>
                                        <td style="text-align: left; " id="tdSubledgertype">
                                            Sub-Ledger Type :</td>
                                        <td style="text-align: left;" id="tdSubledgertype1">
                                            <dxe:ASPxComboBox ID="CmbSubLedgerType" ClientInstanceName="CmbSubLedgerType" runat="server"
                                                ValueType="System.String" EnableIncrementalFiltering="true" Value='<%#Bind("SubLedgerType") %>'
                                                Width="203px" AutoPostBack="true">
                                                <Items>
                                                    <dxe:ListEditItem Text="None" Value="None"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Customers" Value="Customers "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Employees" Value="Employees"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Sub Brokers" Value="Sub Brokers "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Relationship Partners" Value="Relationship Partners"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Business Partners" Value="Business Partners"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Franchisees" Value="Franchisees"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Vendors" Value="Vendors "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Data Vendors" Value="Data Vendors"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Recruitment Agents" Value="Recruitment Agents "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Agents" Value="Agents"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Custom" Value="Custom"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Products-Equity" Value="Products-Equity"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Products-Commodity " Value="Products-Commodity  "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Products-MF" Value="Products-MF"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Products-Insurance" Value="Products-Insurance "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Products-ConsumerFinance" Value="Products-ConsumerFinance"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="RTAs" Value="RTAs "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="MFs" Value="MFs"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="AMCs" Value="AMCs "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Insurance Cos" Value=" Insurance Cos"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Consumer Finance Cos " Value="Consumer Finance Cos  "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Custodians" Value="Custodians "></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="NSDL Clients" Value="NSDL Clients"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="CDSL Clients" Value="CDSL Clients"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Consultants" Value="Consultants"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Share Holder" Value="Share Holder"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Debtors" Value="Debtors"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Creditors" Value="Creditors"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Brokers" Value="Brokers"></dxe:ListEditItem>
                                                    <%--New Work 17/06/2024--%>
                                                    <dxe:ListEditItem Text="Investors" Value="Investors"></dxe:ListEditItem>
                                                    <dxe:ListEditItem Text="Fund Managers" Value="Fund Managers"></dxe:ListEditItem>
                                                    <%--End of New Work 17/06/2024--%>
                                                </Items>
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" ErrorText="Select Subledger Type." />
                                                </ValidationSettings>
                                                <ClientSideEvents ValueChanged="function(s,e){
                                                                                                                    var indexr = s.GetSelectedIndex();
                                                                                                                    SubLedgerTypeFun(indexr)
                                                                                                                    }" />
                                            </dxe:ASPxComboBox>
                                    </tr>
                                    <tr id="trsubledgertype">
                                        <td style="text-align: left; " id="tdExchangeSeg">
                                            Exchange Segment :</td>
                                        <td style="text-align: left;" id="tdExchangeSeg1">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="text-align: left;">
                                                        <dxe:ASPxRadioButtonList ID="rbSegment" ClientInstanceName="rbSegment" runat="server"
                                                            SelectedIndex="0" ItemSpacing="0px" RepeatDirection="Horizontal" TextWrap="False"
                                                            Font-Size="10px" ValueField='<%#Bind("ExchengSegment")%>' ValueType="System.String">
                                                            <Items>
                                                                <dxe:ListEditItem Text="All" Value="A" />
                                                                <dxe:ListEditItem Text="Specific" Value="S" />
                                                            </Items>
                                                            <ClientSideEvents ValueChanged="function(s,e){   var indexr = s.GetValue();
                                                                                                       ExchangeSegment(indexr)
                                                                                                     }" />
                                                            <Border BorderWidth="0px" />
                                                        </dxe:ASPxRadioButtonList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: left; " id="tdroi">
                                            Rate Of Interest (P/a) :</td>
                                        <td style="text-align: left;" id="tdroi1">
                                            <dxe:ASPxTextBox ID="txtRateofIntrest" ClientInstanceName="txtRateofIntrest" runat="server"
                                                Text='<%#Bind("RateOfIntrest") %>' Width="203px">
                                                <MaskSettings Mask="<0..9999g>.<00..99>" ErrorText="None" IncludeLiterals="DecimalSymbol" />
                                            </dxe:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr id="trExchengSegment11">
                                        <td style="text-align: left; padding-left: 10px; display: none;" id="trExchange">
                                            Segment Name :</td>
                                        <td style="text-align: left; display: none;" id="trExchange1" colspan="4">
                                            <dxe:ASPxComboBox ID="comboSegment" ClientInstanceName="comboSegment" runat="server"
                                                ValueType="System.String" DataSourceID="SqlSegment" ValueField="exch_internalId"
                                                TextField="Exchange" EnableIncrementalFiltering="true" Width="203px" OnCallback="comboSegment_Callback">
                                                <ValidationSettings>
                                                    <RequiredField IsRequired="True" ErrorText="Select Account Name" />
                                                </ValidationSettings>
                                                <ClientSideEvents ValueChanged="function(s,e){
                                                                                            SegmentID1(s.GetValue());
                                                                                          }" EndCallback="function(s,e){SetSegValue(s.GetValue());}" />
                                                      
                                            </dxe:ASPxComboBox>
                                            <%--<asp:TextBox ID="txtSpefificExchange_hidden" runat="server" Visible="false"></asp:TextBox>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" id="tdfbtapprate">
                                            FBT Applicable :</td>
                                        <td style="text-align: left;" id="tdfbtapprate1">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxCheckBox ID="FBTApplicable" ClientInstanceName="FBTApplicable" runat="server"
                                                            Width="50px" Checked='<%# Container.Grid.IsNewRowEditing ? false : Container.Grid.GetRowValues(Container.VisibleIndex, "FBTApplicable") %>' />
                                                    </td>
                                                    <td id="fbtrate1">
                                                        FBT Rate :
                                                    </td>
                                                    <td id="fbtrate2">
                                                        <dxe:ASPxTextBox ID="txtFBTRate" ClientInstanceName="txtFBTRate" runat="server" Text='<%#Bind("FBTRate") %>'
                                                            Width="100px" MaskSettings-Mask="<0..9999g>.<00..99>" ValidationSettings-ErrorDisplayMode="None"
                                                            MaskSettings-IncludeLiterals="DecimalSymbol">
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="text-align: left; " id="tdtdsapprate">
                                            TDS Type :</td>
                                        <td style="text-align: left;" id="tdtdsapprate1">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="txtTdsType" runat="server" Width="300px" Font-Size="10px" Text='<%#Bind("TDSApplicable") %>'
                                                            onkeyup="CallTdsAccount(this,'SearchTdsTcsCode',event)"></asp:TextBox>
                                                        <asp:HiddenField ID="txtTdsType_hidden" runat="server" Value='<%#Bind("TDSRate") %>' />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr id="tddepretion">
                                        <td style="text-align: left; ">
                                            Depreciation :
                                        </td>
                                        <td style="text-align: left;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dxe:ASPxTextBox ID="txtDepreciation" ClientInstanceName="txtDepreciation" runat="server"
                                                            Text='<%#Bind("Depreciation") %>' Width="100px" MaskSettings-Mask="<0..9999g>.<00..99>"
                                                            ValidationSettings-ErrorDisplayMode="None" MaskSettings-IncludeLiterals="DecimalSymbol">
                                                        </dxe:ASPxTextBox>
                                                    </td>
                                                    <td>
                                                        %</td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                </table>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <controls></controls>
                                            <dxwgv:ASPxGridViewTemplateReplacement ID="Editors" runat="server" ColumnID="" ReplacementType="EditFormEditors">
                                            </dxwgv:ASPxGridViewTemplateReplacement>
                                            <div style="text-align: center; padding: 2px 2px 2px 2px; font-weight: bold;">
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                                <dxwgv:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                                    runat="server">
                                                </dxwgv:ASPxGridViewTemplateReplacement>
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </EditForm>
                        </Templates>
                        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                        <Styles>
                            <Header CssClass="gridheader" SortingImageSpacing="5px" ImageSpacing="5px">
                            </Header>
                            <FocusedRow CssClass="gridselectrow">
                            </FocusedRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <FocusedGroupRow CssClass="gridselectrow">
                            </FocusedGroupRow>
                        </Styles>
                        <Settings ShowHorizontalScrollBar="true" />
                        <SettingsPager NumericButtonCount="20" PageSize="10" ShowSeparators="True">
                        </SettingsPager>
                        <Columns>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="AccountType" Width="20px" VisibleIndex="1">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellright">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="7"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="BankCashType" VisibleIndex="3" Width="30px">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellright">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="9"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="BankAccountType" VisibleIndex="5" Width="30px">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
                                </PropertiesComboBox>
                                <CellStyle CssClass="gridcellright">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="11"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataComboBoxColumn Visible="False" FieldName="ExchengSegment" VisibleIndex="7" Width="30px">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" VisibleIndex="4"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="0" FieldName="AccountCode" Width="20px"
                                Caption="Account Code">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="3"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="AccountGroup" Width="20px" Caption="Account Group"
                                VisibleIndex="2">
                                <PropertiesComboBox ValueType="System.String" TextField="AccountGroup" ValueField="ID"
                                    EnableIncrementalFiltering="True" DataSourceID="AllAccountGroup">
                                </PropertiesComboBox>
                                <Settings FilterMode="DisplayText"></Settings>
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="5"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="3" FieldName="AccountName" Caption="Account Name" Width="20px">
                                <CellStyle Wrap="False" CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="1"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="4" FieldName="BankAccountNo" Width="20px"
                                Caption="Bank Account No">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="13"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataComboBoxColumn FieldName="SubLedgerType" VisibleIndex="5" Width="30px">
                                <PropertiesComboBox ValueType="System.String" EnableIncrementalFiltering="True">
                                </PropertiesComboBox>
                                <Settings FilterMode="DisplayText"></Settings>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="2"></EditFormSettings>
                            </dxwgv:GridViewDataComboBoxColumn>
                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="4" FieldName="TDSApplicable" Width="30px">
                                <EditFormSettings Visible="False" VisibleIndex="6"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="6" FieldName="TDSRate" Width="30px"
                                Caption="TDS Rate">
                                <EditFormSettings Visible="False" VisibleIndex="10"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataCheckColumn Visible="False" VisibleIndex="8" FieldName="FBTApplicable" Width="30px">
                                <EditFormSettings Visible="False" VisibleIndex="8"></EditFormSettings>
                            </dxwgv:GridViewDataCheckColumn>
                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="10" FieldName="FBTRate" Width="30px"
                                Caption="FBT Rate">
                                <EditFormSettings Visible="False" VisibleIndex="12"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="15" FieldName="RateOfIntrest" Width="30px"
                                Caption="Rate Of Interest (P/a)">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="15"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="15" FieldName="Depreciation" Width="30px"
                                Caption="Depretiation">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="15"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Visible="False" VisibleIndex="15" FieldName="BankCompany" Width="30px"
                                Caption="BankCompany">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormSettings Visible="False" VisibleIndex="15"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewCommandColumn VisibleIndex="6" Caption="Edit" Width="30px">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <HeaderTemplate>
                                    <a href="javascript:void(0);" onclick="grid.AddNewRow()"><span style="color: #000099;
                                        text-decoration: underline">Add New</span></a>
                                </HeaderTemplate>
                                <EditButton Visible="True">
                                </EditButton>
                            </dxwgv:GridViewCommandColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="7" FieldName="openingBalance" Caption="Opening DR/CR" Width="30px">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <DataItemTemplate>
                                    <%-- <a href="javascript:void(0);" id="aaa" style="color:#000099;" runat="server">Add/Edit </a>--%>
                                    <dxe:ASPxHyperLink ID="hlink" runat="server" Text="Add/Edit">
                                    </dxe:ASPxHyperLink>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="8" Width="30px">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <DataItemTemplate>
                                    <a href="javascript:void(0);" onclick="GridDelete('<%#Eval("AccountCode") %>','<%#Eval("SubLedgerType") %>')">
                                        <span style="color: #000099; text-decoration: underline">Delete</span></a>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn VisibleIndex="9" FieldName="openingBalance" Caption="Asset Detail" Width="30px">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <DataItemTemplate>
                                    <%-- <a href="javascript:void(0);" id="aaa" style="color:#000099;" runat="server">Add/Edit </a>--%>
                                    <dxe:ASPxHyperLink ID="AviewLink" runat="server" Text="Asset Detail">
                                    </dxe:ASPxHyperLink>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn VisibleIndex="10" FieldName="openingBalance" Caption="Document" Width="30px">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <DataItemTemplate>

                                    <dxe:ASPxHyperLink ID="hlink2" runat="server" Text="Document">
                                    </dxe:ASPxHyperLink>
                                </DataItemTemplate>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsEditing PopupEditFormHeight="400px" PopupEditFormHorizontalAlign="Center"
                            PopupEditFormModal="True" PopupEditFormVerticalAlign="WindowCenter" PopupEditFormWidth="500px" />
                        <SettingsText PopupEditFormCaption="Add/Modify Main Account" ConfirmDelete="Are you sure You Want To Delete ?" />
                        <Settings ShowGroupedColumns="True" ShowGroupPanel="True" />
                    </dxwgv:ASPxGridView>
                    &nbsp;
                    <dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ContentUrl="frm_OpeningBalance.aspx"
                        CloseAction="CloseButton" Top="100" Left="250" ClientInstanceName="popup" Height="350px"
                        Width="430px" HeaderText="Add Opening Balance">
                    </dxpc:ASPxPopupControl>
                    <asp:HiddenField ID="hdSegment" runat="server" />
                </td>
            </tr>
            <tr>
                <td style="display: none">
                    <dxe:ASPxComboBox ID="ASPxComboBox4" ClientInstanceName="combo" runat="server" OnCallback="ASPxComboBox4_Callback"
                        OnCustomJSProperties="ASPxComboBox4_CustomJSProperties">
                        <ClientSideEvents EndCallback="function(s,e) { ShowError1(s.cpInsertError1); }" />
                    </dxe:ASPxComboBox>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="MainAccount" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:CRMConnectionString %>" 
             SelectCommand="">
          </asp:SqlDataSource>
        <dxwgv:ASPxGridViewExporter ID="exporter" runat="server">
        </dxwgv:ASPxGridViewExporter>
        <asp:SqlDataSource ID="AllAccountGroup" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="Select AccountGroup_Name as Name, cast([AccountGroup_ReferenceID]  as varchar(100)) as ID ,AccountGroup_Name as AccountGroup  from Master_AccountGroup"></asp:SqlDataSource>
   <%--     <asp:SqlDataSource ID="SqlCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="select cmp_internalId,cmp_name from tbl_master_company where cmp_internalId in(select distinct exch_compId from tbl_master_companyExchange)">
        </asp:SqlDataSource>--%>
        
             <asp:SqlDataSource ID="SqlCompany" runat="server" ConnectionString="<%$ ConnectionStrings:crmConnectionString %>"
            SelectCommand="">
            
        </asp:SqlDataSource>
        
        
        <asp:SqlDataSource ID="SqlSegment" runat="server" ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:crmConnectionString %>" SelectCommand="">
           
        </asp:SqlDataSource>
    </form>
</body>
</html>
