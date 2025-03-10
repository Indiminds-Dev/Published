<%@ page language="C#" autoeventwireup="true" inherits="management_splittrades, App_Web_yf04ozfw" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Split Trades</title>
     <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
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
      function Page_Load()///Call Into Page Load
            {   
                Hide('td_grid');
                Hide('showFilter');
                height();
            }
      function Hide(obj)
            {
             document.getElementById(obj).style.display='none';
            }
  function Show(obj)
            {
             document.getElementById(obj).style.display='inline';
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
    function FunClientScrip(objID,objListFun,objEvent,ObjType)
        {
                var date1 = dtfor.GetDate();
                var date2;
                if(date1 != null) 
                  {
                   date2 =parseInt(date1.getMonth()+1)+'-'+date1.getDate()+'-'+ date1.getFullYear();
                  }
         if(ObjType=='ScripRespectToClient')
         {
           if(document.getElementById('txtClient_hidden').value=='')
           {
                alert('Please Select Client !!');
                Hide('showFilter');
                document.getElementById('rdbScripall').checked=true;
           }
           else
           {
                  ObjType='ScripRespectToClient'+'~'+document.getElementById('txtClient_hidden').value+'~'+date2;
                  ajax_showOptions(objID,objListFun,objEvent,ObjType);
           }   
         }
        else
        {
             ajax_showOptions(objID,objListFun,objEvent,ObjType);
        }
   }
    function btncheck()
    {
         if(document.getElementById('txtClient_hidden').value=='')
           {
                alert('Please Select Client !!');
           }
         else if(document.getElementById('txtScrip_hidden').value=='' && document.getElementById('rdbScripselected').checked==true)
           {
                alert('Please Select Scrip !!');
           }
           else
           {
                Show('td_grid');
                grid.PerformCallback();
                height();
                
           }
    }
    function txtblur(obj)
    {
        if(obj=='Client')
        {
         if(document.getElementById('txtClient').value=='')
           {
               document.getElementById('txtClient_hidden').value='';
           }
        }
        if(obj=='Scrip')
        {
         if(document.getElementById('txtScrip').value=='')
           {
               document.getElementById('txtScrip_hidden').value='';
           }
        }
    }
  
    function OnMoreInfoClick(KeyValue)
        {
         var url="splittradespopup.aspx?id="+KeyValue;
         var header='Split Trades For '+document.getElementById('txtClient').value;
          parent.OnMoreInfoClick(url,header,'800px','450px',"Y");
       
        }
    function callback()
    {
        ddlcalback.PerformCallback();
        grid.PerformCallback();
       
    }
     function fn_Category(obj)
      {
            
           var arrayOfCheckBoxes= obj.getElementsByTagName("input");
           var files = "";
           var chkcategory="BB";
           for(var i=0;i<arrayOfCheckBoxes.length;i++)
            {
                if(arrayOfCheckBoxes[i].checked)
                {
                    files = arrayOfCheckBoxes[i];
                    var ref = files.parentNode.getElementsByTagName('label');
                    if(ref[0].innerHTML=='ALL')
                    {
                        chkcategory='ALL';
                    }
                   
                }
            }
            if(chkcategory=='ALL')
            {
               arrayOfCheckBoxes[1].disabled=true;
               arrayOfCheckBoxes[1].checked=false;
               arrayOfCheckBoxes[2].disabled=true;
               arrayOfCheckBoxes[2].checked=false;
               arrayOfCheckBoxes[3].disabled=true;
               arrayOfCheckBoxes[3].checked=false;
            }
            else
            {
               arrayOfCheckBoxes[1].disabled=false;
               arrayOfCheckBoxes[2].disabled=false;
               arrayOfCheckBoxes[3].disabled=false;
            }
      }
      function fnScrip(obj)
        {
             if(obj=="a")
                Hide('showFilter');
             else
             {
                  var cmb=document.getElementById('cmbsearchOption');
                  cmb.value='ScripRespectToClient';
                  Show('showFilter');
             }
             selecttion();
             height();
        }
         function btnAddsubscriptionlist_click()
            {
            
                var cmb=document.getElementById('cmbsearchOption');
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
                document.getElementById('btnshow').disabled=false;
	        }
	     
	        
	   function btnRemovefromsubscriptionlist_click()
            {
                
                var listBox = document.getElementById('lstSlection');
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
    
        FieldName='lstSlection';
        </script>
        <script type="text/ecmascript">   
       function ReceiveServerData(rValue)
        {
               
                var j=rValue.split('~');
        
            if(j[0]=='ScripRespectToClient')
            {
                document.getElementById('txtScrip_hidden').value = j[1];
            }


        }
        </script>
</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server" autocomplete="off">
    <div>
   

        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;" colspan="2">
                    <strong><span style="color: #000099">Split Trades</span></strong>
                </td>
            
            </tr>
        </table>
        <table class="TableMain100">
            <tr valign="top">
                <td>
                    <table border="1" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Date:
                            </td>
                            <td>
                                <dxe:ASPxDateEdit ID="dtFor" runat="server" EditFormat="Custom" UseMaskBehavior="True"
                                    Font-Size="10px" Width="108px" ClientInstanceName="dtfor">
                                    <DropDownButton Text="For">
                                    </DropDownButton>
                                </dxe:ASPxDateEdit>
                            </td>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Client:
                            </td>
                            <td>
                                <asp:TextBox ID="txtClient" onfocusout="txtblur('Client');" runat="server" Width="200px"
                                    Font-Size="10px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event,'Clients')"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" bgcolor="#B7CEEC">
                                            Scrip:</td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripall" runat="server" Checked="True" GroupName="e" onclick="fnScrip('a')" />
                                            All
                                        </td>
                                        <td>
                                            <asp:RadioButton ID="rdbScripselected" runat="server" GroupName="e" onclick="fnScrip('b')" />Selected
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="gridcellleft" bgcolor="#B7CEEC">
                                Trade Category :</td>
                            <td colspan="3">
                                <asp:CheckBoxList ID="chktradecategory" runat="server" RepeatDirection="Horizontal"
                                    Width="150px" onclick="fn_Category(this)">
                                    <asp:ListItem Text="ALL" Value="ALL" ></asp:ListItem>
                                    <asp:ListItem Text="EXC" Value="EXC" ></asp:ListItem>
                                    <asp:ListItem Text="ASN" Value="ASN" ></asp:ListItem>
                                    <asp:ListItem Text="EXP" Value="ALL" ></asp:ListItem>
                                </asp:CheckBoxList></td>
                        </tr>
                          <tr>
                             <td class="gridcellleft"  colspan="4"> <input id="btn_show" type="button" value="Show" onclick="btncheck()" class="btnUpdate" style="height:23px;width:101px;"/></td></tr>
                        <tr>
                            <td style="display: none;" colspan="2">
                                <dxe:ASPxComboBox ID="cmbcalback" runat="server" ClientInstanceName="ddlcalback"
                                    OnCallback="cmbcalback_Callback">
                                </dxe:ASPxComboBox>
                            </td>
                            <td style="display: none;" colspan="2">
                                <asp:TextBox ID="txtClient_hidden" runat="server" Width="5px"></asp:TextBox>
                                <asp:TextBox ID="txtScrip_hidden" runat="server" Width="5px"></asp:TextBox>
                                                        <asp:TextBox ID="txtSelectionID_hidden" runat="server" Font-Size="12px" Width="150px"></asp:TextBox>

                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table width="100%" id="showFilter">
                        <tr>
                            <td style="text-align: left; vertical-align: top; height: 134px;">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="gridcellleft" style="vertical-align: top; text-align: left; height: 21px;"
                                            id="TdFilter">
                                            <span id="spanunder"></span><span id="spanclient"></span>
                                            <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="150px" onkeyup="FunClientScrip(this,'ShowClientFORMarginStocks',event,'ScripRespectToClient')"></asp:TextBox>
                                            <asp:DropDownList ID="cmbsearchOption" runat="server" Font-Size="11px" Width="70px"
                                                Enabled="false">
                                                <asp:ListItem>ScripRespectToClient</asp:ListItem>
                                            </asp:DropDownList>
                                            <a id="A4" href="javascript:void(0);" onclick="btnAddsubscriptionlist_click()"><span
                                                style="color: #009900; text-decoration: underline; font-size: 8pt;">Add to List</span></a><span
                                                    style="color: #009900; font-size: 8pt;"> </span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:ListBox ID="lstSlection" runat="server" Font-Size="10px" Height="90px" Width="290px">
                                            </asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <a id="A2" href="javascript:void(0);" onclick="clientselectionfinal()"><span style="color: #000099;
                                                            text-decoration: underline; font-size: 10pt;">Done</span></a>&nbsp;&nbsp;
                                                    </td>
                                                    <td>
                                                        <a id="A1" href="javascript:void(0);" onclick="btnRemovefromsubscriptionlist_click()">
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
                <td id="td_grid">
                    <dxwgv:ASPxGridView ID="grdSplittrades" runat="server" ClientInstanceName="grid"
                        KeyFieldName="customertrades_id" Width="100%" AutoGenerateColumns="False" OnCustomCallback="grdSplittrades_CustomCallback">
                        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                        <Styles>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                       <SettingsPager NumericButtonCount="20" Visible="False" Mode="ShowAllRecords">
                        </SettingsPager>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="customertrades_id" FieldName="customertrades_id"
                                Visible="False" VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" VisibleIndex="0" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Flag" FieldName="Flag" VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" VisibleIndex="1" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Scrip" FieldName="instrument" VisibleIndex="1"
                                Width="50%">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" VisibleIndex="1" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Terminal Id" FieldName="TERMINALID" VisibleIndex="2">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" VisibleIndex="1" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Time" FieldName="Tradetime" VisibleIndex="3">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Left" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" VisibleIndex="1" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Category" FieldName="tradecategory" VisibleIndex="4">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" VisibleIndex="1" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Qty" FieldName="UnitPriceQuantity" VisibleIndex="5">
                                <CellStyle CssClass="gridcellleft" HorizontalAlign="Right">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" VisibleIndex="2" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Rate" FieldName="MktRate" VisibleIndex="6">
                                <CellStyle HorizontalAlign="Right" CssClass="gridcellleft">
                                </CellStyle>
                                <EditFormCaptionStyle HorizontalAlign="Right" Wrap="False">
                                </EditFormCaptionStyle>
                                <EditFormSettings Visible="False" VisibleIndex="5" />
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Modify" Width="5%" VisibleIndex="7">
                                <DataItemTemplate>
                                    <a href="#" onclick="OnMoreInfoClick('<%# Container.KeyValue %>')">Split
                                </DataItemTemplate>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <SettingsEditing Mode="PopupEditForm" PopupEditFormHorizontalAlign="Center" PopupEditFormHeight="600px"
                            PopupEditFormVerticalAlign="TopSides" PopupEditFormWidth="900px" />
                        <Settings ShowGroupPanel="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
