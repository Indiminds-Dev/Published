<%@ page language="C#" autoeventwireup="true" inherits="Segments_AllSeg_UciUpload, App_Web_tu-en7gd" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxCallbackPanel"
    TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPanel"
    TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxClasses"
    TagPrefix="dxw" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1" Namespace="DevExpress.Web.ASPxGridView"
    TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1" Namespace="DevExpress.Web.ASPxPopupControl"
    TagPrefix="dxpc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="U1">
    <title>UCI File Upload</title>
    <!--External Styles-->
    <link type="text/css" href="../../../CentralData/CSS/GenericCss.css" rel="Stylesheet" />
    <!--External Scripts file-->
    <!-- Ajax List Requierd-->
    <link type="text/css" href="../../../CentralData/CSS/GenericAjaxStyle.css" rel="Stylesheet" />

    <script type="text/javascript" src="../../../CentralData/JSScript/GenericAjaxList.js"></script>

    <script type="text/javascript" src="../../../CentralData/JSScript/init.js"></script>

    <!--Other Script-->

    <script type="text/javascript" src="../../../CentralData/JSScript/GenericJScript.js"></script>

    <script type="text/javascript">
    function Page_Load()
    { 
       HideShow('Container2','H');
       HideShow('RowNew_EmlMB','H');  
       HideShow('RowNew_Adhaar','H');  
       HideShow('RowNew_Address','H');  
       HideShow('BR','H');                                                                    
        Height('300','300');   
    } 
    function spanshowhide(value)     
    {
        if(value=='show')
            {
                HideShow('spanoptianal','S');
                HideShow('AvlBatchlbl','H');
                HideShow('AvlBatchtxt','H');
                HideShow('AvlBatchNote','H');
                HideShow('Row-1_new','S');
                //SetValue('divbatch','abcd');
                GetObjectID('divbatch').innerHTML='BAT User No.';
            }
        else
            {
                HideShow('spanoptianal','H');
                HideShow('AvlBatchlbl','S');
                HideShow('AvlBatchtxt','S');
                HideShow('AvlBatchNote','S');
                HideShow('Row-1_new','H');
                //                    SetValue('divbatch','BatchNumber');
                GetObjectID('divbatch').innerHTML='Batch Number';
                
            }
    }
    function accounttypehowhide(accounttypeval)
    {
        if(accounttypeval=='show')
           HideShow('Row-1_new','S');
        else
            HideShow('Row-1_new','H');
    }
    function SignOff()
    {
        window.parent.SignOff();
    }
    function Reset()
    {       
       
       SetValue('HDNClient','');            
       Height('300','300');                           
    }
    function DateChange(positionDate)
    {
        var FYS='<%=Session["FinYearStart"]%>';
        var FYE='<%=Session["FinYearEnd"]%>';
        var LFY='<%=Session["LastFinYear"]%>';
        DevE_CheckForFinYear(positionDate,FYS,FYE,LFY);                    
    }
    function ChangeDateFormat_SetCalenderValue(obj)
    {       
        var SelectedDate = new Date(obj);
        var monthnumber = SelectedDate.getMonth();
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getYear();            
        var changeDateValue=new Date(year, monthnumber, monthday);
        return changeDateValue;            
    }
    function AccountTypeChange(val)
    {
        if(val=="O")
        {
            if('<%=Session["ExchangeSegmentID"]%>'=='4' || '<%=Session["ExchangeSegmentID"]%>'=='5' || '<%=Session["ExchangeSegmentID"]%>'=='6')
                window.location='../../../management/BSE_UCCUpload.aspx';
            else
                window.location='../../../management/UCCUpload.aspx';
        }
    }
    function ChangeDateFormat_CalToDB(obj)
    {
        var SelectedDate = new Date(obj);            
        var monthnumber = SelectedDate.getMonth() + 1;
        var monthday    = SelectedDate.getDate();
        var year        = SelectedDate.getFullYear();            
        var changedDateValue=year+'-'+monthnumber+'-'+monthday;
        return changedDateValue;
    }
    function fn_Client(obj)
    {  
    
        var fromDate=ChangeDateFormat_CalToDB(cdtDate.GetValue());
        var toDate=ChangeDateFormat_CalToDB(cdtToDate.GetValue());
        if(obj=="A")
        {
            GetObjectID('<%=lstSelection.ClientID%>').length=0;
            HideShow('Container2','H');
            HideShow('Row4','S');
            //CallServer("CallAjax-Client",""); 
            CallServer("CallAjax-Client@"+fromDate+'@'+toDate,"");
        }
        else if(obj=="S")
        {               
            if(GetObjectID('Container2').style.display=="inline")
            {                
               cRblClient.SetSelectedIndex(0);     
               lnkBtnAddFinalSelection();                        	
            }
            else
            {
               HideShow('Container2','S');
               HideShow('Row4','H');
               CallServer("CallAjax-Client@"+fromDate+'@'+toDate,""); 
               //GetObjectID('txtSelectionID').focus();
            } 
        }                         
    }        
    function NORECORD()
    {            
        alert('No Record Found !!!');  
        Reset();                    
    }
    function ErrorMsg(msg)
    {            
        if(msg=="ClientErr")
            alert("There is No Proper Client Selection!!!");           
    }
    function BtnShow_Click()
    {
        if('<%=Session["ExchangeSegmentID"]%>'=='4' || '<%=Session["ExchangeSegmentID"]%>'=='5' || '<%=Session["ExchangeSegmentID"]%>'=='6')
        {
            cCbpSuggestISIN.PerformCallback("Generate");
            HideShow("LoadingDiv", "S");
        }
        else
        {
            if(GetValue('txtBatch')!='')
                cCbpSuggestISIN.PerformCallback("Generate");
            else
                {
                    alert('Please Select Batch Number');
                    GetObjectID('txtBatch').focus();
                }
        }

    }
    function btndownload_Click()
    {
        GetObjectID('BtnForExportEvent').click();
    }
    function btnexcell_Click()
    {
        GetObjectID('BtnForExportEvent1').click();
    }
        function CbpSuggestISIN_EndCallBack() {
            HideShow("LoadingDiv", "H");
            if (cCbpSuggestISIN.cpall == "error") {
                alert('There are few problem for generating. Please Contact To Service Provider');
            }
            else if (cCbpSuggestISIN.cpall == "norecord") {
                alert('No Record To Generate');
            }
            else {
                cPopUp_ScripAlert.Show();
                document.getElementById('<%=B_Total.ClientID %>').innerHTML = cCbpSuggestISIN.cpall;
                document.getElementById('<%=B_Success.ClientID %>').innerHTML = cCbpSuggestISIN.cpsuccess;
                document.getElementById('<%=B_Error.ClientID %>').innerHTML = cCbpSuggestISIN.cpfail;
                document.getElementById('<%=B_Filename.ClientID %>').innerHTML = cCbpSuggestISIN.cpfile;
                var all = cCbpSuggestISIN.cpall;
                var suc = cCbpSuggestISIN.cpsuccess;
                var fail = cCbpSuggestISIN.cpfail;
                if (all == "0" || suc == "0") {
                    HideShow('divbtndownload', 'H');
                    HideShow('divbtnexcell', 'S');
                }
                if (fail == "0") {
                    HideShow('divbtndownload', 'S');
                    HideShow('divbtnexcell', 'H');
                }
            }

        }
         
         
    </script>

  <!-- CallAjax and Receive Server Script-->

  <script language="javascript" type="text/javascript">       
    FieldName='none';
    function btnAddToList_click()
    {
        var txtName = GetObjectID('txtSelectionID');
        if(txtName != '')
        {
            var txtId = GetValue('txtSelectionID_hidden');
            var listBox = GetObjectID('lstSelection');
            var listLength = listBox.length;               
            var opt = new Option();
            opt.value = txtId;
            opt.text = txtName.value;
            listBox[listLength]=opt;
            txtName.value='';
        }
        else
            alert('Please Search Name And Then Add!');
        txtName.focus();
        txtName.select();   
    }
    function lnkBtnAddFinalSelection()
    {
        var listBox = GetObjectID('lstSelection');         
        var listID='';
        var i;
        if(listBox.length > 0)
        {                             
            for(i=0;i<listBox.length;i++)
            {
                if(listID == '')
                    listID = listBox.options[i].value+'!'+listBox.options[i].text;
                else
                    listID += '^' + listBox.options[i].value+'!'+listBox.options[i].text;
            }
            CallServer(listID,"");  
            var j;
            for(j=listBox.options.length-1;j>=0;j--)
            {
                listBox.remove(j);
            } 
            HideShow('Container2','H');
            HideShow('Row4','S');                    
        }
        else if((GetObjectID('Container2').style.display=="inline") && (listBox.length == 0))
        { 
            if(cRblClient.GetSelectedIndex()==1)
            {             
                 alert("Please Select Atleast One Client Item!!!");
            }                        
        }
    }
    function lnkBtnRemoveFromSelection()
    {   
        var listBox = GetObjectID('lstSelection');
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
    function string_contains(containerString, matchBySubString)
    {
        if(containerString.indexOf(matchBySubString) == -1)
        {
            return false;
        }
        else
        {
            return true;
        }
    } 
    function AccTypeChange()
    {
        if(cddlAccountTypebse.GetValue()=='M')
        {
            HideShow('RowNew_EmlMB','S');
            HideShow('RowNew_Adhaar','S');
            HideShow('RowNew_Address','S');
            HideShow('BR','S'); 
            //New Work 29/03/2022
            CRDLabel1.SetText('Modify Date');
            //End of New Work 29/03/2022
        }
        else if(cddlAccountTypebse.GetValue()=='N')
        {
            HideShow('RowNew_EmlMB','H');
            HideShow('RowNew_Adhaar','H');
            HideShow('RowNew_Address','H');
            HideShow('BR','H'); 
            //New Work 29/03/2022
            CRDLabel1.SetText('Registration Date');
            //End of New Work 29/03/2022
        }
        Height('300','300');  
    }         
    function ReceiveServerData(rValue)
    {            
        var Data=rValue.split('@');                
        if(Data[1]!="undefined")
        {
            if(Data[0]=='Client')
            { 
               SetValue('HDNClient',Data[1]);
            }                                       
        } 
        if(Data[0]=='AjaxQuery')
        {                
            AjaxComQuery = Data[1];
            //New Work 29/03/2022
//            var AjaxList_TextBox=GetObjectID('txtSelectionID');
            var AjaxList_TextBox = document.getElementById('<%=txtSelectionID.ClientID%>');
            //End of New Work 29/03/2022
            AjaxList_TextBox.value='';
            //New Work 29/03/2022
//            AjaxList_TextBox.attachEvent('onkeyup',CallGenericAjaxJS);
            //End of New Work 29/03/2022
         }              
    }
    function CallGenericAjaxJS(e)
    {
        //New Work 29/03/2022
//        var AjaxList_TextBox=GetObjectID('txtSelectionID');
        var AjaxList_TextBox = document.getElementById('<%=txtSelectionID.ClientID%>');
        //End of New Work 29/03/2022
        AjaxList_TextBox.focus();
        AjaxComQuery=AjaxComQuery.replace("\'","'");
        var GenericAjaxListAspxPath = '../../../CentralData/Pages/GenericAjaxList.aspx';
        
        ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',e,replaceChars(AjaxComQuery),'Main',GenericAjaxListAspxPath);
    }       
    
    //New Work 29/03/2022
    function FunClientScrip(objID,objListFun,objEvent)
        {
          var AjaxList_TextBox = document.getElementById('<%=txtSelectionID.ClientID%>');
        AjaxList_TextBox.focus();
        AjaxComQuery=AjaxComQuery.replace("\'","'");
        var GenericAjaxListAspxPath = '../../../CentralData/Pages/GenericAjaxList.aspx';
        
        ajax_showOptions(AjaxList_TextBox,'GenericAjaxList',objEvent,replaceChars(AjaxComQuery),'Main',GenericAjaxListAspxPath);
        }
    //End of New Work 29/03/2022
   </script>

   <style type="text/css">       
        #MainFull { padding:5px; width:995px}
         #Container1 { width: 500px; padding:5px}
        .SplitCont {height:200px;overflow-y:scroll;}
        .tab{border:1px solid #555; padding:5px; vertical-align:bottom; background-color:#ddd; float:left;}
        .tab-Selected{border:1px solid #555; padding:7px; vertical-align:bottom; background-color:#aeaeae;; float:left;}
        .LableWidth { width:110px;}
        .ContentWidth { width:170px; height:21px;}
        .labelCont { font-size:13px; margin-top:7px;}      
        .btnRight { margin-right:18px; float:right;} 
        .txt_left { text-align:left;}
        .txt_right { text-align:right;}                                           
   </style>
</head>
<body>
    <form id="form1" runat="server" autocomplete="off">
        <div id="Header" class="Header">
            UCI File Upload</div>
        <div id="Row0" class="Row">
            <div id="Container1" class="container">
            <div id="Row-1" class="Row">
                    <div id="Div2" class="LFloat_Lable LableWidth">
                        UCI Format</div>
                    <div class="LFloat_Content ContentWidth">
                         <dxe:ASPxComboBox ID="ddlAccountType" Width="160px" runat="server" Font-Size="13px"
                            ValueType="System.String" ClientInstanceName="cddlAccountType" Font-Bold="False"
                            SelectedIndex="0" TabIndex="0">
                            <Items>
                                <dxe:ListEditItem Text="NEW" Value="N" />
                                <dxe:ListEditItem Text="OLD" Value="O" />
                            </Items>
                            <ClientSideEvents ValueChanged="function(s, e) {AccountTypeChange(s.GetValue());}" />
                            <Paddings PaddingBottom="0px"></Paddings>
                        </dxe:ASPxComboBox>
                                
                    </div>
                    <br class="clear" />
                </div>
                <br class="clear" />
                <div id="Row-1_new" class="Row">
                    <div id="Div2_new" class="LFloat_Lable LableWidth">
                        Account Type</div>
                  <div class="LFloat_Content ContentWidth">
                         <dxe:ASPxComboBox ID="ddlAccountTypebse" Width="160px" runat="server" Font-Size="13px"
                                    ValueType="System.String" ClientInstanceName="cddlAccountTypebse" Font-Bold="False"
                                    SelectedIndex="0" TabIndex="0">
                                    <Items>
                                        <dxe:ListEditItem Text="NEW" Value="N" />
                                        <dxe:ListEditItem Text="MODIFY" Value="M" />
                                    </Items>
                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {AccTypeChange();}" />
                                    <Paddings PaddingBottom="0px"></Paddings>
                         </dxe:ASPxComboBox>
                                
                    </div>
                    <br class="clear" />
                </div>
                <br class="clear" />
                <div id="RowNew_EmlMB" class="Row">
                    <div id="RowNew_EmlMB_Col1" class="LFloat_Lable LableWidth" style="width: 295px">
                       <dxe:ASPxCheckBox id="CbMdfyMblEml" runat="server" ClientInstanceName="cCbMdfyMblEml" BackColor="Transparent">
                            <%--New Work 29/03/2022--%>
                            <%--<ClientSideEvents CheckedChanged="OnAllCheckedChanged"></ClientSideEvents>--%>
                            <%--End of New Work 29/03/2022--%>
                       </dxe:ASPxCheckBox>
                        Modify MobileNo.,Email & Address Only</div>
                   <br class="clear" />
                </div>
                <br id="BR" class="clear" />
                <div id="RowNew_Adhaar" class="Row">
                    <div id="Div3" class="LFloat_Lable LableWidth" style="width: 295px">
                       <dxe:ASPxCheckBox id="CbMdfAdh" runat="server" ClientInstanceName="cCbMdfAdh" BackColor="Transparent">
                            
                       </dxe:ASPxCheckBox>
                        Modify Adhaar Only</div>
                   <br class="clear" />
                </div>
		<br id="BR" class="clear" />
                <div id="RowNew_Address" class="Row">
                    <div id="Div4" class="LFloat_Lable LableWidth" style="width: 295px">
                       <dxe:ASPxCheckBox id="CbMdfAdd" runat="server" ClientInstanceName="cCbMdfAdd" BackColor="Transparent">
                            
                       </dxe:ASPxCheckBox>
                        Modify Address Only</div>
                   <br class="clear" />
                </div>

                <br id="BR1" class="clear" />
                <div id="Row1" class="Row">
                    <%--End of New Work 29/03/2022--%>
                    <%--<div id="Row1_Col1" class="LFloat_Lable LableWidth">
                        Registration Date</div>--%>
                    <div id="Row1_Col1" class="LFloat_Lable LableWidth">
                        <dxe:ASPxLabel ID="RDLabel1" runat="server" Text="Registration Date" ClientInstanceName="CRDLabel1" Font-Size="13px"></dxe:ASPxLabel>
                    </div>
                    <%--End of New Work 29/03/2022--%>
                    <div id="Row1_Col2" class="LFloat_Content ContentWidth">
                        <dxe:ASPxDateEdit ID="dtDate" runat="server" Width="170px" EditFormat="Custom" ClientInstanceName="cdtDate"
                            EditFormatString="dd-MM-yyyy" UseMaskBehavior="True">
                            <DropDownButton Text="Regn.From ">
                            </DropDownButton>
                            <%--<ClientSideEvents DateChanged="function(s,e){DateChangeForFrom(dtDate,dtToDate);}" />
                                <ClientSideEvents DateChanged="function(s,e){DateChange(dtDate);}"></ClientSideEvents>--%>
                        </dxe:ASPxDateEdit>
                    </div>
                    <div id="Row1_Col3" class="Content ContentWidth">
                        <dxe:ASPxDateEdit ID="dtToDate" runat="server" Width="170px" EditFormat="Custom"
                            ClientInstanceName="cdtToDate" EditFormatString="dd-MM-yyyy" UseMaskBehavior="True"
                            >
                            <DropDownButton Text="Regn.To">
                            </DropDownButton>
                           <%-- <ClientSideEvents DateChanged="function(s,e){DateChangeForTo(dtDate,dtToDate);}" />
                                <ClientSideEvents DateChanged="function(s,e){DateChange(dtToDate);}"></ClientSideEvents>--%>
                        </dxe:ASPxDateEdit>
                    </div>
                    <br class="clear" />
                </div>
                <div id="Row2" class="Row">
                    <div id="Row2_Col1" class="LFloat_Lable LableWidth">
                        Client</div>
                    <div class="LFloat_Content ContentWidth">
                        <dxe:ASPxRadioButtonList ID="RblClient" runat="server" SelectedIndex="0" ItemSpacing="20px"
                            RepeatDirection="Horizontal" Paddings-PaddingTop="1px" TextWrap="False" Font-Size="12px"
                            ClientInstanceName="cRblClient">
                            <Items>
                                <dxe:ListEditItem Text="All" Value="A" />
                                <dxe:ListEditItem Text="Specific" Value="S" />
                            </Items>
                            <ClientSideEvents ValueChanged="function(s, e) {fn_Client(s.GetValue());}" />
                            <Border BorderWidth="0px" />
                        </dxe:ASPxRadioButtonList>
                    </div>
                    <br class="clear" />
                </div>
                <br class="clear" />
                <div id="Row3" class="Row">
                    <div class="LFloat_Lable LableWidth" id="divbatch">
                        Batch Number </div>
                    <div class="LFloat_Content">
                        <asp:TextBox ID="txtBatch" runat="server" Width="20px" MaxLength="2" onkeypress="return onlyNumbers();"></asp:TextBox>
                    </div>
                    <span id="spanoptianal" style="color:Maroon;font-size:12px;"> ( Optional )</span>
                   
                </div>
                <br class="clear" />
                <div id="Row4" class="Row">
                    <div id="AvlBatchlbl" class="LFloat_Lable" style="font-size: 12px; width: 200px; color: Blue">
                        Next Available Batch No For Today is
                    </div>
                    <div id="AvlBatchtxt" runat="server" style="color: Green">
                    </div>
                </div>
                 <br class="clear" />
                <div id="Row5" class="Row">
                    <div id="AvlBatchNote" style="font-size: 12px; width: 280px; color: Red">
                        (Note : For Current Date Max Batch Number Must Be 99.You Can Reuse Batch Number In Case
                        Of Failure. Also Note That A Single Batch Will Have Only Top 99 Client Entries. That Means, You Need
                        To Generate Multiple Batches If Number Of Clients Is More Than 99.)
                    </div>
                </div>
                <br class="clear" />
                <div id="Row6" class="Row btnRight">
                    <br class="clear" />
                    <dxe:ASPxButton ID="BtnShow" runat="server" AutoPostBack="False" Text="Generate"
                        Width="85px">
                        <ClientSideEvents Click="function (s, e) {BtnShow_Click();}" />
                    </dxe:ASPxButton>
                </div>
            </div>
            
            <div id="Container2" class="container">
                <div id="C2_Row0" class="Row">
                    <div id="C2_Row0_Col1" class="LFloat_Content">
                        <%--New Work 29/03/2022--%>
                        <%--<asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="323px" TabIndex="0"></asp:TextBox>--%>
                        <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" Width="323px" TabIndex="0" onkeyup="FunClientScrip(this,'GenericAjaxList',event)"></asp:TextBox>
                        <%--End of New Work 29/03/2022--%>
                    </div>
                    <div id="C2_Row0_Col2" class="LFloat_Lable">
                        <a href="javascript:void(0);" tabindex="0" onclick="btnAddToList_click()"><span class="lnkBtnAjax green">
                            Add to List</span></a>
                    </div>
                </div>
                <div id="C2_Row1" class="Row">
                    <div id="C2_Row1_Col1" class="LFloat_Content finalSelectedBox">
                        <asp:ListBox ID="lstSelection" runat="server" Font-Size="12px" Height="100px" Width="410px"
                            TabIndex="0"></asp:ListBox>
                    </div>
                </div>
                <div id="C2_Row2" class="Row">
                    <div id="C2_Row2_Col1" class="LFloat_Lable">
                        <a href="javascript:void(0);" tabindex="0" onclick="lnkBtnAddFinalSelection()"><span
                            class="lnkBtnAjax blue">Done</span></a>&nbsp;&nbsp; <a href="javascript:void(0);"
                                tabindex="0" onclick="lnkBtnRemoveFromSelection()"><span class="lnkBtnAjax red">Remove</span></a>
                    </div>
                </div>
            </div>
        </div>
        <div style="display: none;">
            <asp:TextBox ID="txtSelectionID_hidden" runat="server"></asp:TextBox>
            <asp:HiddenField ID="HDNClient" runat="server" />
            <asp:Button ID="BtnForExportEvent" runat="server" OnClick="cmbExport_SelectedIndexChanged"
                BackColor="#DDECFE" BorderStyle="None" />
            <asp:Button ID="BtnForExportEvent1" runat="server" OnClick="cmbExport1_SelectedIndexChanged"
                BackColor="#DDECFE" BorderStyle="None" />
        </div>
        <dxpc:ASPxPopupControl ID="PopUp_ScripAlert" runat="server" ClientInstanceName="cPopUp_ScripAlert"
            Width="600px" HeaderText="UCI UPLOAD DETAILS FOR CLIENT" PopupHorizontalAlign="Center"
            Height="100px" PopupVerticalAlign="Middle" CloseAction="CloseButton" Modal="True">
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <dxcp:ASPxCallbackPanel ID="CbpSuggestISIN" runat="server" ClientInstanceName="cCbpSuggestISIN"
                        BackColor="White" OnCallback="CbpSuggestISIN_Callback">
                        <ClientSideEvents EndCallback="CbpSuggestISIN_EndCallBack" />
                        <PanelCollection>
                            <dxp:panelcontent runat="server">
                                <div style="font-weight: bold; color: black; background-color: gainsboro; border-right: silver thin solid;
                                    border-top: silver thin solid; border-left: silver thin solid; border-bottom: silver thin solid;">
                                    Total No Of Client : <b style="text-align: right" id="B_Total" runat="server"></b>
                                    <br />
                                    <br />
                                    Data Matched Client : <b style="text-align: right;color:Green;" id="B_Success" runat="server">
                                    </b>
                                    <br />
                                    <br />
                                    Data Mis-Matched Client : <b style="text-align: right;color:Red" id="B_Error" runat="server">
                                    </b>
                                    <br />
                                    <br />
                                    File Name: <b style="text-align: right; color: Maroon;" id="B_Filename"
                                        runat="server"></b>
                                </div>
                                <br />
                                <br />
                                <div class="left" id="divbtndownload">
                                    <dxe:ASPxButton ID="btndownload" runat="server" AutoPostBack="False" Text="Download File">
                                        <ClientSideEvents Click="function (s, e) {btndownload_Click();}" />
                                    </dxe:ASPxButton>
                                </div>
                                <div id="divbtnexcell" style="margin-left: 100px;">
                                    <dxe:ASPxButton ID="btnexcell" runat="server" AutoPostBack="False" Text="Export Mismatched Client">
                                        <ClientSideEvents Click="function (s, e) {btnexcell_Click();}" />
                                    </dxe:ASPxButton>
                                </div>
                            </dxp:panelcontent>
                        </PanelCollection>
                        <LoadingPanelStyle Cursor="wait" Font-Bold="True" ForeColor="Gray">
                        </LoadingPanelStyle>
                    </dxcp:ASPxCallbackPanel>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
            <HeaderStyle BackColor="LightGray" ForeColor="Black" />
        </dxpc:ASPxPopupControl>
        <div id='LoadingDiv' style='display:none;position: absolute; font-family: arial; font-size: 30; left: 50%; top: 20%; background-color: white; layer-background-color: white; height: 80; width: 150;'>
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
    </form>
</body>
</html>
