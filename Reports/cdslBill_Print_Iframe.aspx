<%@ page language="C#" autoeventwireup="true" async="true" inherits="Reports_cdslBill_Print_Iframe, App_Web_arnfzykg" title="Untitled Page" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <script type="text/javascript" src="../CentralData/JSScript/GenericJScript.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>
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
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="load()">

    <script language="javascript" type="text/javascript">
       
        function OnMoreInfoClick()
        {
 	     var URL='cdslBill_GroupSelection.aspx';
	     ParentWindowShow(URL,'Charge Groups');
        }
        function btnAddsubscriptionlist_click()
        {
            var userid = document.getElementById('txtClient_hidden');
            if(userid.value != '')
            {
                var ids = document.getElementById('txtClient_hidden');
                var listBox = document.getElementById('lstSuscriptions');
                var tLength = listBox.length;
                 
                var no = new Option();
                no.value = ids.value;
                no.text = userid.value;
                listBox[tLength]=no;
                var recipient = document.getElementById('txtClient_hidden');
                recipient.value='';
            }
            else
                alert('Please search name and then Add!')
            var s=document.getElementById('txtClient');
            s.value='';
            s.focus();
            s.select();
        } 
        function btnRemovefromsubscriptionlist_click()
        {
            
            var listBox = document.getElementById('lstSuscriptions');
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
        function PageLoad()
         {
             FieldName='lstSuscriptions';
             tdHeader.style.display='none';
             tdFooter.style.display='none';
             document.getElementById('<%=txtHeader.ClientID %>').style.display="none";
             document.getElementById('<%=txtHeader_hidden.ClientID %>').style.display="none";
             document.getElementById('<%=txtFooter.ClientID %>').style.display="none";
             document.getElementById('<%=txtFooter_hidden.ClientID %>').style.display="none";
             
             document.getElementById('<%=txtHeader.ClientID%>').value ='';
             document.getElementById('<%=txtHeader_hidden.ClientID %>').value ='';
             document.getElementById('<%=txtFooter.ClientID%>').value ='';
             document.getElementById('<%=txtFooter_hidden.ClientID %>').value ='';
             
             document.getElementById('txtClient_hidden').style.display="none";
             document.getElementById('Div1').style.display="none";
             document.getElementById('txtEmpName_hidden').style.display='none';
             document.getElementById('tdvalue').style.display='none';
             document.getElementById('tdempname').style.display='none';
             document.getElementById('txtdigitalName_hidden').style.display='none'; 
             HideShow("trGeneratePDF","H");
             rsltChk=0; 
               hide('tdtxtname');
               hide('tdList');
               hide('displayAll');
               hide('tdP');  
               show('tdS');
               hide('trGpmType');
               hide('trDigitalSign');
               hide('tr_isin');
               hide('trDuplex');
               height();

            var arrDp = window.location.search.split('=');
            Dp = arrDp[1];
            SpanHeader.innerText = Dp + ' Bill Printing';
            
//    //iframe1.src = "cdslBill_Print_Iframe.aspx?type=" + Dp;
//    document.getElementById('f').style.display='none'

         } 
         function ResetNoSignature()
         { 
            document.getElementById('txtEmpName_hidden').value = '';
            document.getElementById('txtEmpName_hidden').style.display='none';
            
            document.getElementById('txtEmpName').value = '';
            show('tdempname');
            show('tdvalue');
            document.getElementById('txtEmpName').focus(); 
         }
        
         function CallAjax1(obj1,obj2,obj3,obj)
         { 

             if ((obj == 'H')||(obj == 'F'))
             {
                 var obj4 = obj;
                 ajax_showOptions(obj1,obj2,obj3,obj4);
             }
             else
             {
                if (window.location.search.split('=')[1]=='NSDL')
                    {
                    var obj4 = '<%=DpId %>';
                 
                    ajax_showOptions(obj1,obj2,obj3,obj4);
                    }
                else
                    ajax_showOptions(obj1,obj2,obj3);
             }
         }
         
       
        function show(obj1)
        {
            //alert(obj1);
             document.getElementById(obj1).style.display='inline';
        }
        function hide(obj1)
        {
            //alert(obj1);
             document.getElementById(obj1).style.display='none';
        }
    
        function fnClients(s)
        {
          document.getElementById('txtClient_hidden').value=""; 
           if(s=='A')
            {
                hide('tdtxtname'); 
                hide('tdList'); 
                document.getElementById('txtClient_hidden').style.display="none";
                document.getElementById('txtClient').value=""; 
            }
            if(s=='S')
            {
                show('tdtxtname'); 
                show('tdList'); 
                document.getElementById('txtClient_hidden').style.display="none";
            } 
        }
    
        function fnGroups(s)
        {
         if(s=='S')
            {
            
            OnMoreInfoClick();
            }
            else
            {
            document.getElementById('groupid').value="";
            }
            
            height();
        }
    
        function clientselectionfinal()
	    {
	        var listBoxSubs = document.getElementById('lstSuscriptions');
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
            }
	        document.getElementById('benid').value=listIDs;
	        document.getElementById('Div1').style.display="inline"; 
        } 
       function done()
        {
         hide('tdtxtname');
         hide('tdList'); 
        }
        function segchose(segment)
        {
            if(segment=='NSDL')
              show('tr_isin');
            else
              hide('tr_isin');
                
        }
        
        function ShowHideButton(s)
        {
         
          if(s=='rbPrint')
           {  
              hide('tdS');  
              show('tdP');
              //show('trGpmType');
              show('tdempname');
              hide('trDigitalSign');
              show('trDuplex');
              if('<%=Session["userlastsegment"]%>'=='9')
               show('tr_isin');
              else
               hide('tr_isin');
                
            }
            else if(s=='rbScreen')
             {
              hide('tdP');  
              show('tdS');
              hide('tdempname');
              hide('trDigitalSign');
              hide('trDuplex');
              hide('tr_isin');
              
             }
           else
            {
             
           // show('trGpmType');
            hide('tdempname');
            show('trDigitalSign');
            //hide('tr_isin');
             if('<%=Session["userlastsegment"]%>'=='9')
               show('tr_isin');
              else
               hide('tr_isin');
            }
         height();
       }
        
        function afterPartialPostBack()
        {
         document.getElementById('Div1').style.display="none";
         
       if(!document.getElementById('rbDigital').checked)
        {
        
            if(rsltChk==1)
            {   
             hide('displayAll');
             document.getElementById('f').style.display='none';
             alert('No Result Found.');
             rsltChk=0;
            }
            else
            {
             show('displayAll');
             hide('Search');
             document.getElementById('f').style.display='inline';
           
            }
           
        }
       
         height();   
        } 
        function showProgress()
        { 
         document.getElementById('Div1').style.display="inline";
        }
        
        function hideProg()
        { 
        document.getElementById('Div1').style.display="none";
        }
        
        function FillValues(s)
        {
         document.getElementById('groupid').value=s;
         parent.editwin.close();
        }
        
        function FillValuesgpm(s)
        {
         document.getElementById('groupid').value=s;
         parent.editwin.close();
         } 
        function popupClose2()
        {
         document.getElementById('groupid').value="";
         rbgrp.SetValue('A');
         parent.editwin.close(); 
        }
        
        function showSearch()
        { 
        show('Search');
        } 
        function noResult(v)
        {
         rsltChk=v;
        }
        function checkChange()
        {
             var checkbox=document.getElementById('chkSignature')
              if(checkbox.checked)
                {
                 document.getElementById('tdvalue').style.display='inline';
                 document.getElementById('txtEmpName').focus();
                }
              else
                {
                 document.getElementById('tdvalue').style.display='none';
                 document.getElementById('txtEmpName_hidden').value="";
                 document.getElementById('txtEmpName').value="";
                }
         
         }
        function openGroupPopUp(obj)
        {   
          document.getElementById('groupid').value='';
              if (obj=='G')
               {    
                 cmbgpm.SelectIndex(0,true);
                 show('trGpmType');
               }
              else if(obj=='GroupCode')
                {
                   OnMoreInfoClick(); 
                   hide('trGpmType');
                }
                else
                {
                   hide('trGpmType');
                }
        }
      function bindChkBox(obj)
       {
         if(obj!='NA')
           {
              var URL='CdslBill_GroupMaster.aspx?type='+obj;
	          ParentWindowShow(URL, 'Groups');
	       }
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
            window.frameElement.width = document.body.scrollWidth;
        }

        function ShowFilter()
        {
       
        showSearch();
        height();
        //document.getElementById('iframe1').contentWindow.showSearch(); 
        }
         function ParentWindowShow(objURL,title)
        {
          parent.OnMoreInfoClick(objURL,title,'940px','450px',"Y");
        }
        
        function HeaderFooter(obj)
        {
            if (obj.name == 'chbHeader')
            {
                if (obj.checked)
                {
                    document.getElementById('<%=txtHeader.ClientID%>').style.display='inline';
                    tdHeader.style.display = 'inline';
                    document.getElementById('<%=txtHeader.ClientID%>').focus();
                }
                else
                {
                    document.getElementById('<%=txtHeader.ClientID%>').value ='';
                    document.getElementById('<%=txtHeader_hidden.ClientID%>').value ='';
                    tdHeader.style.display = 'none';
                }
            }
            else if (obj.name == 'chbFooter')
            {
                if (obj.checked)
                {
                    document.getElementById('<%=txtFooter.ClientID%>').style.display='inline';
                    tdFooter.style.display = 'inline';
                    document.getElementById('<%=txtFooter.ClientID%>').focus();
                }
                else
                {
                    document.getElementById('<%=txtFooter.ClientID%>').value ='';
                    document.getElementById('<%=txtFooter_hidden.ClientID%>').value ='';
                    tdFooter.style.display = 'none';
                }
            }
            
        }
        
        function changeamount(s)
        {
               
            if(s=='rbBillAmount1')
                {
                    cwithdraw.SetEnabled(true);
                
                }
            else if(s=='rbBillAmount2')
                {
                    cwithdraw.SetEnabled(false);
                }
         }
         function keyVal(obj)
         {
           var WhichCall=obj.split("~")[4];
           if(WhichCall=="DIGISIGN")
           {
                var isEtoken=obj.split("~")[2]; 
                if(isEtoken=="E")
                {
                    HideShow("trGenerate","H");
                    HideShow("trGeneratePDF","S");
                }
                else
                {
                    HideShow("trGenerate","S");
                    HideShow("trGeneratePDF","H");
                }
           }
         }
    </script>

    <form id="form1" runat="server" autocomplete="off">
        <asp:HiddenField ID="benid" runat="server" />
        <asp:HiddenField ID="groupid" runat="server" />
        <asp:HiddenField ID="gpm" runat="server" />
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" colspan="0" style="text-align: center;">
                    <strong><span id="SpanHeader" style="color: #000099"></span></strong>
                </td>
                <td class="EHEADER" width="10%" id="f">
                    <a href="javascript:void(0);" onclick="ShowFilter();"><span style="color: Blue; text-decoration: underline;
                        font-size: 8pt; font-weight: bold">Filter</span></a>
                </td>
            </tr>
        </table>
        <table border="0" id="Search">
            <tr>
                <td style="width: 160px">
                    <dxe:ASPxComboBox ID="cmbMonth" Width="160px" runat="server" Font-Size="10px" ValueType="System.String"
                        Font-Bold="False" SelectedIndex="0">
                        <items>
                            <dxe:ListEditItem Text="January" Value="Jan"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="February" Value="Feb"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="March" Value="Mar"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="April" Value="Apr"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="May" Value="May"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="June" Value="Jun"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="July" Value="Jul"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="August" Value="Aug"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="September" Value="Sep"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="October" Value="Oct"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="November" Value="Nov"></dxe:ListEditItem>
                            <dxe:ListEditItem Text="December" Value="Dec"></dxe:ListEditItem>
                        </items>
                        <buttonstyle width="60px">
                        </buttonstyle>
                        <dropdownbutton text="Month">
                        </dropdownbutton>
                    </dxe:ASPxComboBox>
                </td>
                <td style="width: 100px; text-align: center">
                    <asp:RadioButton ID="rbBillAmount1" Checked="true" GroupName="billamount" onclick="changeamount(this.value)" runat="server" /> <span>Bill Amount >=</span>
                </td>
                <td style="width: 210px">
                    <table border="0" width="100%">
                        <tr>
                            <td>
                            
                    <dxe:ASPxTextBox ID="txtbilAmt" ClientInstanceName="cwithdraw" runat="server" Width="60px"
                        TabIndex="1" HorizontalAlign="Right" Text="0.01">
                        <masksettings mask="&lt;0..9999999999g&gt;.&lt;00..99&gt;" includeliterals="DecimalSymbol" />
                        <validationsettings errordisplaymode="None">
                        </validationsettings>
                    </dxe:ASPxTextBox>
                    </td>
                    <td>
                   <asp:RadioButton ID="rbBillAmount2" onclick="changeamount(this.value)" GroupName="billamount" runat="server" /><span>Only Zero Bill Amount</span>
                         </td>
                        </tr>
                    </table>
                </td>
                <td style="width: 35px; text-align:right">
                    Clients:
                </td>
                <td style="width: 106px">
                    <dxe:ASPxRadioButtonList ID="rbUser" runat="server" SelectedIndex="0" ItemSpacing="10px"
                        RepeatDirection="Horizontal" TextWrap="False" Font-Size="10px" TabIndex="2">
                        <items>
                            <dxe:ListEditItem Text="All" Value="A" />
                            <dxe:ListEditItem Text="Specific" Value="S" />
                        </items>
                        <clientsideevents valuechanged="function(s, e) {fnClients(s.GetValue());}" />
                        <border borderwidth="0px" />
                    </dxe:ASPxRadioButtonList>
                </td>
                <td id="tdtxtname" style="text-align: left">
                    <asp:TextBox ID="txtClient_hidden" runat="server" Width="14px"></asp:TextBox><asp:TextBox
                        ID="txtClient" runat="server" Width="220px" Font-Size="11px" Height="20px" TabIndex="3"></asp:TextBox><br />
                    <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                        style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a>
                </td>
            </tr>
         
            <tr>
                <td>
                    <dxe:ASPxComboBox ID="cmbBillGenerationOrder" Width="160px" runat="server" Font-Size="10px"
                        ValueType="System.String" Font-Bold="False" SelectedIndex="0" TabIndex="4">
                        <items>
                            <dxe:ListEditItem Value="PinCode" Text="Area Wise"></dxe:ListEditItem>
                            <dxe:ListEditItem Value="BranchID" Text="Branch Wise"></dxe:ListEditItem>
                            <dxe:ListEditItem Value="GroupCode" Text="Charge Basket Wise"></dxe:ListEditItem>
                            <dxe:ListEditItem Value="G" Text="Group Wise"></dxe:ListEditItem>
                        </items>
                        <clientsideevents valuechanged="function(s, e) {
	                                        openGroupPopUp(s.GetValue());
                                        }"></clientsideevents>
                        <buttonstyle width="60px">
                        </buttonstyle>
                        <dropdownbutton text="Bill Order">
                        </dropdownbutton>
                    </dxe:ASPxComboBox>
                </td>
                <td colspan="3">
                    <div id="trGpmType">
                        <dxe:ASPxComboBox ID="cmbBillGroupType" Width="170px" runat="server" Font-Size="10px"
                            ValueType="System.String" Font-Bold="False" SelectedIndex="0" ClientInstanceName="cmbgpm"
                            TabIndex="5">
                            <clientsideevents valuechanged="function(s, e) {
	                    bindChkBox(s.GetValue());
                    }"></clientsideevents>
                            <buttonstyle width="60px">
                            </buttonstyle>
                            <dropdownbutton text="Group Type">
                            </dropdownbutton>
                        </dxe:ASPxComboBox>
                    </div>
                </td>
                <td>
                </td>
                <td rowspan="4" id="tdList" valign="top">
                    <asp:ListBox ID="lstSuscriptions" runat="server" Font-Size="10px" Height="80px" Width="220px">
                    </asp:ListBox><br />
                    <a id="A2" href="javascript:void(0);" onclick="done();"><span style="color: #000099;
                        text-decoration: underline; font-size: 10pt;">Done</span></a> <a id="A1" href="javascript:void(0);"
                            onclick="btnRemovefromsubscriptionlist_click()"><span style="color: #cc3300; text-decoration: underline;
                                font-size: 8pt;">Remove</span></a>
                </td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chbHeader" runat="server" onclick="HeaderFooter(this);" /></td>
                                        <td>
                                            Use Header</td>
                                        <td id="tdHeader">
                                            <asp:TextBox ID="txtHeader" runat="server" Font-Size="10px" Width="200px"
                                            onkeyup="CallAjax(this,'GetHeaderFooter',event,'H');"></asp:TextBox>
                                            <asp:TextBox ID="txtHeader_hidden" runat="server" Width="14px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:CheckBox ID="chbFooter" runat="server" onclick="HeaderFooter(this);"/></td>
                                        <td>
                                            Use Footer</td>
                                        <td id="tdFooter">
                                            <asp:TextBox ID="txtFooter" runat="server" Font-Size="10px" Width="200px"
                                            onkeyup="CallAjax(this,'GetHeaderFooter',event,'F');"></asp:TextBox>
                                            <asp:TextBox ID="txtFooter_hidden" runat="server" Width="14px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:RadioButton ID="rbScreen" runat="server" onclick="ShowHideButton(this.value)"
                                    GroupName="a" Checked="True" TabIndex="6" />Screen &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:RadioButton ID="rbPrint" runat="server" GroupName="a" onclick="ShowHideButton(this.value)"
                                    TabIndex="7" />Print
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:RadioButton ID="rbDigital" runat="server" GroupName="a" onclick="ShowHideButton(this.value)"
                                    TabIndex="10" />Digitally Signed Document</td>
                        </tr>
                    </table>
                </td>
                <td colspan="4">
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    <table align="left">
                        <tr style="text-align: left" id="tdempname">
                            <td style="width: 100px" colspan="2">
                                Add Signatory:
                                <input id="chkSignature" type="checkbox" onclick="checkChange()" runat="server" tabindex="8" /></td>
                            <td id="tdvalue">
                                Employee:
                                <asp:TextBox ID="txtEmpName" runat="server" TabIndex="9" Width="200px"></asp:TextBox>
                                <asp:TextBox ID="txtEmpName_hidden" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="text-align: left" id="trDigitalSign">
                            <td colspan="2">
                                Employee :
                            </td>
                            <td>
                                <asp:TextBox ID="txtdigitalName" runat="server" TabIndex="11" Width="250px"></asp:TextBox>
                                <asp:TextBox ID="txtdigitalName_hidden" runat="server" TabIndex="11" Width="100px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr style="text-align: left" id="trDuplex">
                            <td colspan="3">
                                Duplex Printing(Back-To-Back)&nbsp;<asp:CheckBox ID="chkDuplex" runat="server" />
                            </td>
                           
                        
                        </tr>
                        <tr style="text-align: left" id="tr_isin">
                            <td colspan="3">
                                Show holding of ISIN without having any transaction for the period&nbsp;<asp:CheckBox ID="chkisin" runat="server" />
                            </td>
                           
                        
                        </tr>
                    </table>
                </td>
            </tr>
            <tr id="trGenerate">
                <td id="tdS">
                    <dxe:ASPxButton ID="btnShow" runat="server" AutoPostBack="True" OnClick="btnShow_Click"
                        Text="Generate" TabIndex="12">
                        <clientsideevents click="function(s, e) {
	                            clientselectionfinal();
                            }" />
                    </dxe:ASPxButton>
                </td>
                <td id="tdP">
                    <dxe:ASPxButton ID="btnShow1" runat="server" AutoPostBack="True" OnClick="btnShow_Click"
                        Text="Generate" TabIndex="13">
                        <clientsideevents click="function(s, e) {
	                            clientselectionfinal();hideProg();
                            }" />
                    </dxe:ASPxButton>
                </td>
                <td>
                </td>
            </tr>
            <tr id="trGeneratePDF">
                <td id="td1">
                    <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="True" OnClick="btnShow_Click"
                        Text="Click to Generate" TabIndex="12">
                        <clientsideevents click="function(s, e) {
	                            clientselectionfinal();
                            }" />
                    </dxe:ASPxButton>
                </td>
             </tr>
        </table>
        <asp:ScriptManager runat="server" ID="s1" AsyncPostBackTimeout="360000">
        </asp:ScriptManager>

        <script language="javascript" type="text/javascript">

        function load() 

        {
           Sys.WebForms.PageRequestManager.getInstance().add_endRequest(afterPartialPostBack);
        }
        </script>

        <div id="displayAll">
            <asp:UpdatePanel runat="server" ID="u1">
                <ContentTemplate>
                    <table width="100%" border="1" bordercolor="blue">
                        <tr>
                            <td align="center">
                                <table id="tblpage" cellspacing="0" cellpadding="0" runat="server" width="100%">
                                    <tr>
                                        <td width="20" style="padding: 5px">
                                            <asp:LinkButton ID="ASPxFirst" runat="server" Font-Bold="True" ForeColor="maroon"
                                                OnClick="btnFirst" OnClientClick="javascript:showProgress();">First</asp:LinkButton></td>
                                        <td width="25">
                                            <asp:LinkButton ID="ASPxPrevious" runat="server" Font-Bold="True" ForeColor="Blue"
                                                OnClick="btnPrevious" OnClientClick="javascript:showProgress();">Previous</asp:LinkButton></td>
                                        <td width="20" style="padding: 5px">
                                            <asp:LinkButton ID="ASPxNext" runat="server" Font-Bold="True" ForeColor="maroon"
                                                OnClientClick="javascript:showProgress();" OnClick="btnNext">Next</asp:LinkButton></td>
                                        <td width="20">
                                            <asp:LinkButton ID="ASPxLast" runat="server" Font-Bold="True" ForeColor="Blue" OnClientClick="javascript:showProgress();"
                                                OnClick="btnLast">Last</asp:LinkButton></td>
                                        <td align="right">
                                            <asp:Label ID="listRecord" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <span style="color: red; text-align: center; display: none" id="norecord" class="Ecoheadtxt"
                                    runat="server"><strong>No Transaction Found</strong></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="0" width="100%" style="text-align: left">
                                    <tr style="font-size: 12px; font-family: Calibri">
                                        <td>
                                            Client Id :
                                        </td>
                                        <td>
                                            <asp:Label ID="boid" runat="server" Font-Bold="True"></asp:Label></td>
                                        <td>
                                            Category:</td>
                                        <td>
                                            <asp:Label ID="category" runat="server" Font-Bold="True"></asp:Label></td>
                                        <td>
                                            Status:
                                        </td>
                                        <td>
                                            <asp:Label ID="status" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                        <td>
                                            Bill Number:
                                        </td>
                                        <td>
                                            <asp:Label ID="billNumber" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Name of Holders:</td>
                                        <td colspan="7">
                                            <asp:Label ID="holders" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="9" style="height: 12px">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="lblTransction" runat="server" Text="0"></asp:Label>
                                                        of
                                                        <asp:Label ID="lblTotalTransction" runat="server" Text="0"></asp:Label>
                                                        Transactions
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnTransFirst" runat="server" OnClientClick="javascript:showProgress();"
                                                            Font-Bold="True" ForeColor="maroon" OnClick="btnTransFirst_Click">First</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnTransPrevious" runat="server" OnClientClick="javascript:showProgress();"
                                                            Font-Bold="True" ForeColor="Blue" OnClick="btnTransPrevious_Click">Previous</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnTransnNext" runat="server" Font-Bold="True" ForeColor="maroon"
                                                            OnClientClick="javascript:showProgress();" OnClick="btnTransnNext_Click">Next</asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:LinkButton ID="btnTransnLast" runat="server" OnClientClick="javascript:showProgress();"
                                                            Font-Bold="True" ForeColor="Blue" OnClick="btnTransLast_Click">Last</asp:LinkButton>
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
                                <div id="display" runat="server">
                                </div>
                            </td>
                        </tr>
                        <tr id="tdsummary" runat="server">
                            <td style="height: 38px">
                                <table width="100%">
                                    <tr valign="top">
                                        <td align="left" style="width: 25%">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <div id="accounts" runat="server" style="border: solid 1px balck;">
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            <div id="summary" runat="server">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblTransction1" runat="server" Text="0"></asp:Label>
                                            of
                                            <asp:Label ID="lblTotalTransction1" runat="server" Text="0"></asp:Label>
                                            Transactions
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnTransFirst1" runat="server" OnClientClick="javascript:showProgress();"
                                                Font-Bold="True" ForeColor="maroon" OnClick="btnTransFirst_Click">First</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnTransPrevious1" OnClick="btnTransPrevious_Click" runat="server"
                                                Font-Bold="True" ForeColor="Blue">Previous</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnTransnNext1" OnClick="btnTransnNext_Click" runat="server"
                                                Font-Bold="True" ForeColor="maroon">Next</asp:LinkButton>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="btnTransnLast1" runat="server" OnClientClick="javascript:showProgress();"
                                                Font-Bold="True" ForeColor="Blue" OnClick="btnTransLast_Click">Last</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnShow" EventName="Click"></asp:AsyncPostBackTrigger>
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div id='Div1' style='position: absolute; font-family: arial; font-size: 30; left: 50%;
            top: 20%; height: 80; width: 150;'>
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
    </form>
</body>
</html>
