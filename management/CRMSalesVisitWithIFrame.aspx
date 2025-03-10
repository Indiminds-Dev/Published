<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="management_CRMSalesVisitWithIFrame, App_Web_fbvamflg" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />
    <%--<script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>--%>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>

    <script language="javascript" type="text/javascript">
        function OnMoreInfoClick(KeyValue,Id,SalesVisitId)
         {
        
        document.location.href="CRMSalesVisitWithIFrame.aspx?id="+KeyValue + "&id1="+Id + "&id2="+SalesVisitId;
        
//        var url='CRMSalesVisitWithIFrame.aspx?id='+KeyValue + '&id1='+Id + '&id2='+SalesVisitId;
//        parent.OnMoreInfoClick(url,"Modify Lead Details",'940px','450px',"Y");
         }

        function SearchByBranchName(obj1,obj2,obj3)
        {
            ajax_showOptions(obj1,obj2,obj3);
        }
        FieldName='lblFieldName';
        function OnExpensesButtonClick()
        {
             var url='sales_conveyence.aspx';
             parent.OnMoreInfoClick(url,"Modify Lead Details",'940px','450px',"Y");
        }

         function OnMoreInfoClick1(Id) 
         {
            frmOpenNewWindow1("ShowHistory_Phonecall.aspx?id1="+Id,300,800);
         }
         

      function OnButton1ClickModify(url,title) 
        {
            parent.OnMoreInfoClick(url,title,'940px','450px',"Y");
        
        }  
       
      function OnButton3ClickModify(title) 
        {
            var url="ShowHistory_Phonecall.aspx?id1="+Id;
            parent.OnMoreInfoClick(url,title,'940px','450px',"Y");
        
        }       
     
     
         function frmOpenNewWindow1(location,v_height,v_weight)
          {  
              var x=(screen.availHeight-v_height)/2;
              var y=(screen.availWidth-v_weight)/2
              window.open(location,"Search_Conformation_Box","height="+ v_height +",width="+ v_weight +",top="+ x +",left="+ y +",location=no,directories=no,menubar=no,toolbar=no,status=yes,scrollbars=no,resizable=no,dependent=no");       
         } 
   var chkobj;
    var objchk=null;
    function showPanel(obj,msg)
    {
        alert(obj + msg)
    }
    function chkclicked(obj,msg12)
    {
        var txt = document.getElementById("hiddenleadid")
        if (objchk == null)
        {
            objchk = obj;
            objchk.checked = true;
        }
        else
        {
            objchk.checked = false;
            objchk = obj;
            objchk.checked = true;
        }
        txt.value = msg12;
    }
    function adddatetime(obj1,adddays,addtime)
    {        
        var t
        var t1
        var old_date
        var lst_id
        var new_date
        var txt_date
        txt_date=adddays + " " + addtime;
    }
   
   function Changedata123(txtdate,txttime,nowdate,nowtime,cdate,ctime)
    {  
        var a = document.getElementById("txtStartDate")
        a.value = nowdate + " " + nowtime
        var b = document.getElementById("txtEndTime")
        b.value = cdate + " " + ctime
        var drp = document.getElementById("TxtOut")        
        var drpVal =drp.value;        
        var drpVal1=drpVal.split("!");
        if ((drpVal1[1] == 1) || (drpVal1[1] == 2) || (drpVal1[1] == 3) || (drpVal1[1] == 4) || (drpVal1[1] == 5))
        {  
            document.getElementById("lblNextVisitDate").style.display = "block"
            document.getElementById("lblNextVisitPlace").style.display = "block"
        }
        else
        {
            if ((drpVal1[1] == 9) || (drpVal1[1] == 10))
            {
                document.getElementById("txtStartDate").disabled = false
            }
            else
            {
                if ((drpVal1[1] == 11) || (drpVal1[1] == 12))
                {
                    document.getElementById("txtStartDate").disabled = false

                }
                else
                {
                    if (drpVal1[1] == 13)
                    {
                        document.getElementById("txtStartDate").disabled = false

                                         
                    }
                    else
                    {
                        document.getElementById("lblNextVisitDate").style.display = "none"
                        document.getElementById("lblNextVisitPlace").style.display = "none"
                    }          
                }
            }
        } 
    }
    function FillValues(id)
    {

        noofproduct=id;
    }
    function calldispose(Obj,val)
    {
        var str = "frmSalesVisitOutCome.aspx?call="+val+"&obj="+Obj
        frmOpenNewWindow1(str,400,900)
       
        
    }
    function funChangeNext(obj)
        {
            var o = document.getElementById("lblNextVisitDate")
            if (obj.id == 'rdrCall')
            {
                o.innerText = "Next Call Date:"
                document.getElementById("tdnextvisit").style.display = 'none';
                document.getElementById("tdnextvisit1").style.display = 'none';
            }
            else
            {
                o.innerText = "Next Visit Date:"
                document.getElementById("tdnextvisit").style.display = 'inline';
                document.getElementById("tdnextvisit1").style.display = 'inline';
            }
        }
      function BranchOrClient(obj)
      {
         
          if(obj=='C')
          {
            
            document.getElementById("drpVisitPlace").style.display='inline';
            document.getElementById("TdVisitplace").style.display='inline';
            document.getElementById("TdBranch").style.display='none';
          }
          
          else if(obj=='B')
          {
           
            document.getElementById("drpVisitPlace").style.display='none';
            document.getElementById("TdVisitplace").style.display='none';
            document.getElementById("TdBranch").style.display='inline';
          }
      }
      function BranchOrClientN(obj)
      {
        if(obj=='C')
          {
            
            document.getElementById("drpNextVisitPlace").style.display='inline';
            document.getElementById("TdNextvisitplace").style.display='inline';
            document.getElementById("TdnBranch").style.display='none';
          }
          
          else if(obj=='B')
          {
           
            document.getElementById("drpNextVisitPlace").style.display='none';
            document.getElementById("TdNextvisitplace").style.display='none';
            document.getElementById("TdnBranch").style.display='inline';
          }
      }
    function chkOnSaveClick123()
    {
        var drp = document.getElementById("TxtOut");
        var st = drp.value.split("!");
        if ((st[1] == 4) || (st[1] == 12))
        {
            //var sel = document.getElementById('txtProductCount');
            if (noofproduct == 0)
            {
                alert("For confirm sale choose atleast one product");
                return false;
            }
        }
        if ((st[1] == 1) || (st[1] == 2) || (st[1] == 3) || (st[1] == 4) || (st[1] == 8))
        {
            var sel = document.getElementById("drpVisitPlace");
            var sel1=document.getElementById("TdVisitplace");
            if(sel1.style.display=='inline')
            {
                
                if (sel.value == 0) //|| (sel.options.length == 0)
                {
                    alert("Please select the visit address");
                    return false;
                }
            }
        }
        if ((st[1] == 1) || (st[1] == 2) || (st[1] == 3) || (st[1] == 4) || (st[1] == 8) || (st[1] == 11) || (st[1] == 12))
        {
            var sel = document.getElementById("drpNextVisitPlace");
            var sel1= document.getElementById("txtNBranch");
            var obrdr = document.getElementById("rdrVisit");
            var objClient=document.getElementById("rdNClient");
            var objBranch=document.getElementById("rdNBranch");
            if (obrdr.checked == true)
            {
                if(objClient.checked == true)
                {
                    if (sel.value == 0) //|| (sel.options.length == 0)
                    {
                        alert("Please select the next visit address");
                        return false;
                    }
                 }
                 else if(objBranch.checked == true)
                 {
                    
                    if (sel1.value == '') //|| (sel.options.length == 0)
                    {
                        alert("Please select the next visit address");
                        return false;
                    }
                 }
            }
        }
        return true;
    }   
    function All_CheckedChanged()
    {
        grid.PerformCallback()
    }
    function Specific_CheckedChanged()
    {
        grid.PerformCallback()
    }
    function iframesource()
    {
    iFrmInformation.location="calluserinformation.aspx";
    
    }
    function height()
    {
        if(document.body.scrollHeight>=500)
            window.frameElement.height = document.body.scrollHeight;
        else
            window.frameElement.height = '500px';
            window.frameElement.Width = document.body.scrollWidth;
    }
  function SignOff()
        {
        window.parent.SignOff()
        }
  function callback()
    {
        iframesource();
    }
    function callDhtmlFormsParent(val,val1)
    {
        if(val=="ADD")
        {
            parent.OnMoreInfoClick("frmOfferedProduct_New.aspx","ADD PRODUCT","950px","500px","Y");
        }
        else if(val=="UPDATE")
        {
            var url="UpdateOfferedProduct.aspx"+"?"+val1;
            parent.OnMoreInfoClick(url,"UPDATE PRODUCT","950px","500px","Y");
        }
        else if(val=="PHONE/ADD")
        {
            var url="Contact_Correspondence.aspx"+"?"+val1;
            parent.OnMoreInfoClick(url,"Modify Phone/Address","950px","500px","Y");
        }
        else if(val=="LEAD")
        {
           var url="Lead_general.aspx"+"?"+val1;
           parent.OnMoreInfoClick(url,"Modify Lead Details","950px","500px","Y");
        }
         else if(val=="Expences")
        {
           var url="sales_conveyence.aspx";
           parent.OnMoreInfoClick(url,"Expences","950px","500px","N");
        }
        else if(val=="HISTORY")
        {
            var url="ShowHistory_Phonecall.aspx"+"?"+"id1="+val1;
            parent.OnMoreInfoClick(url,"HISTORY","950px","500px","N");
        }
        else if(val=="HISTORY1")
        {
            var url="ShowHistory_Phonecall.aspx";
            parent.OnMoreInfoClick(url,"HISTORY","950px","500px","N");
        }
       
    }
    
    
    </script>

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
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" runat="server">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td class="EHEADER" style="text-align: center;">
                        <strong><span style="color: #000099">Sales Visit</span></strong>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0">
                            <tr id="btntbl" runat="server">
                                <td>
                                    <asp:Button ID="BtnPending" OnClick="BtnPending_Click" runat="server" Height="21px"
                                        CssClass="btnUpdate" Text="Pending/New Visit"></asp:Button>
                                </td>
                                <td>
                                    <asp:Button ID="BtnOpen" runat="server" Text="Open" CssClass="btnUpdate" OnClick="BtnOpen_Click"
                                        Height="21px" Width="87px" /></td>
                                <td>
                                    <asp:Button ID="BtnClosed" runat="server" Text="Closed Non Usable" CssClass="btnUpdate"
                                        OnClick="BtnClosed_Click" Height="21px" /></td>
                                <td>
                                    <asp:Button ID="BtnConfirm" runat="server" Text="Confirm Sale" CssClass="btnUpdate"
                                        OnClick="BtnConfirm_Click" Height="21px" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr id="activityRow" runat="server">
                                <td>
                                    <table style="width: 100%">
                                        <tr>
                                            <td style="width: 66px">
                                                <asp:Label ID="LBLActivity" runat="server" Text="Activities Of :" CssClass="myhypertext"
                                                    Width="66px"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="DDLActivity" runat="server" Width="250px" OnSelectedIndexChanged="DDLActivity_SelectedIndexChanged"
                                                    AutoPostBack="True">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="grdtbl" runat="server">
                                <td style="width: 100%">
                                    <table style="width: 100%">
                                        <tr>
                                            <td colspan="2" style="text-align: left">
                                                <table class="TableMain100" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 30px;">
                                                            <asp:RadioButton ID="Lrd" runat="server" GroupName="a" Checked="True" />
                                                        </td>
                                                        <td style="width: 150px;">
                                                            <asp:Label ID="Label4" runat="server" Text="From Lead Data" Font-Size="X-Small" ForeColor="Blue"></asp:Label>
                                                        </td>
                                                        <td style="width: 30px;">
                                                            <asp:RadioButton ID="Erd" runat="server" GroupName="a" />
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server" Text="From Existing Customer Data" Font-Size="X-Small"
                                                                ForeColor="Blue"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 100%">
                                                <dxwgv:ASPxGridView ID="AspxActivity" runat="server" ClientInstanceName="grid" KeyFieldName="ActId"
                                                    AutoGenerateColumns="False" Width="100%" OnCustomCallback="AspxActivity_CustomCallback">
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Id" VisibleIndex="0">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Name" ReadOnly="True" VisibleIndex="1">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="ActId" Visible="False" VisibleIndex="2">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="SalesVisitId" Visible="False" VisibleIndex="2">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="AssignBy" Visible="False" VisibleIndex="2">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="NextVisitDate" VisibleIndex="2">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Address1" ReadOnly="True" VisibleIndex="3">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="LastOutcome" VisibleIndex="4">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Details" VisibleIndex="5">
                                                            <DataItemTemplate>
                                                                <a href="#" onclick="OnMoreInfoClick('<%# Container.KeyValue %>','<%#Eval("Id") %>','<%#Eval("SalesVisitId") %>')">
                                                                    Show</a>
                                                            </DataItemTemplate>
                                                            <EditFormSettings Visible="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="History" VisibleIndex="6">
                                                            <DataItemTemplate>
                                                                <a href="#" onclick="callDhtmlFormsParent('HISTORY','<%#Eval("Id") %>')">History</a>
                                                            </DataItemTemplate>
                                                            <EditFormSettings Visible="False" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                    <Styles>
                                                        <LoadingPanel ImageSpacing="10px">
                                                        </LoadingPanel>
                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                        </Header>
                                                    </Styles>
                                                    <SettingsPager ShowSeparators="True">
                                                        <FirstPageButton Visible="True">
                                                        </FirstPageButton>
                                                        <LastPageButton Visible="True">
                                                        </LastPageButton>
                                                    </SettingsPager>
                                                </dxwgv:ASPxGridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="showdetailstbl" runat="server">
                                <td colspan="2" style="height: 376px">
                                    <asp:Panel ID="PnlShowDetails" runat="server" Width="100%" Visible="False" CssClass="TableMain100">
                                        <table class="TableMain100" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td>
                                                    <table class="maintable10" style="width: 100%">
                                                        <tr>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label6" runat="server" CssClass="mylabel" Width="58px">Alloated By :</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtAlloatedBy" runat="server" CssClass="EcoheadCon" Width="122px"></asp:Label>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label8" runat="server" CssClass="mylabel" Width="58px">Allotted On :</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtDateOfAllottment" runat="server" CssClass="EcoheadCon" Width="130px"></asp:Label>
                                                                <asp:Label ID="txtTotalNumberofCalls" runat="server" Visible="False" CssClass="EcoheadCon"
                                                                    Width="130px"></asp:Label></td>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label10" runat="server" CssClass="mylabel" Width="58px">Priority :</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtPriority" runat="server" CssClass="EcoheadCon"></asp:Label>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label12" runat="server" CssClass="mylabel" Width="58px">Start By :</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtSeheduleStart" runat="server" CssClass="EcoheadCon"></asp:Label>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label1" runat="server" CssClass="mylabel" Width="58px">Next Call :</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblNextVisit" runat="server" CssClass="EcoheadCon"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label7" runat="server" CssClass="mylabel" Width="58px">End By :</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtSeheduleEnd" runat="server" CssClass="EcoheadCon"></asp:Label>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label9" runat="server" CssClass="mylabel" Width="58px">Started On:</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="txtAcutalStart" runat="server" CssClass="EcoheadCon" Width="130px"></asp:Label>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label11" runat="server" CssClass="mylabel" Width="58px">Instruction :</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblShortNote" runat="server" CssClass="EcoheadCon"></asp:Label>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label13" runat="server" CssClass="mylabel" Width="58px">Last Call :</asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="lblLastVisit" runat="server" CssClass="EcoheadCon"></asp:Label>
                                                            </td>
                                                            <td class="gridcellleft">
                                                                <asp:Label ID="Label14" runat="server" CssClass="mylabel" Width="58px">OutCome :</asp:Label></td>
                                                            <td>
                                                                <asp:Label ID="lblLastOutcome" runat="server" CssClass="EcoheadCon"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="10">
                                                    <table>
                                                        <tr>
                                                            <td class="gridcellleft">
                                                                <asp:Button ID="btnUpdateVisit" Text="Update Visit" CssClass="btnUpdate" runat="server"
                                                                    OnClick="btnUpdateVisit_Click" Height="21px" Width="99px" />
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="btnPhoneFollowUP" Text="Phone Follow Up" CssClass="btnUpdate" runat="server"
                                                                    Width="110px" OnClick="btnPhoneFollowUP_Click" Height="21px" />
                                                            </td>
                                                            <td>
                                                                <input type="button" value="Modify Phone/Address" id="btn_UpdateAddress" class="btnUpdate"
                                                                    style="width: 139px; height: 21px;" onclick="callDhtmlFormsParent('PHONE/ADD','type=modify&requesttype=lead&formtype=lead')" />
                                                            </td>
                                                            <td>
                                                                <input type="button" value="Modify Contact Details" id="btn_UpdateDetails" class="btnUpdate"
                                                                    style="width: 139px; height: 21px;" onclick="callDhtmlFormsParent('LEAD','type=modify&requesttype=lead&formtype=lead')" />
                                                            </td>
                                                            <%--<td>
                                                                <input type="button" id="Button1" name="btnHistory" value="History" class="btnUpdate"
                                                                    onclick="frmOpenNewWindow1('../management/ShowHistory_Phonecall.aspx',300,800);"
                                                                    style="height: 21px" />
                                                            </td>--%>
                                                            <%--   <td>
                                                                <input type="button" value="Modify Phone/Address" id="btn_UpdateAddress" class="btnUpdate"
                                                                    style="width: 139px; height: 21px;" onclick="frmOpenNewWindow1('../management/Contact_Correspondence.aspx?type=modify&requesttype=lead&formtype=lead',550,800)" />
                                                            </td>
                                                            <td>
                                                                <input type="button" value="Modify Contact Details" id="btn_UpdateDetails" class="btnUpdate"
                                                                    style="width: 139px; height: 21px;" onclick="frmOpenNewWindow1('../management/Lead_general.aspx?type=modify&requesttype=lead&formtype=lead',400,900)" />
                                                            </td>--%>
                                                            <td>
                                                                <input type="button" id="Button1" name="btnHistory" value="History" class="btnUpdate"
                                                                    onclick="callDhtmlFormsParent('HISTORY1','Optional')" style="height: 21px" />
                                                                <%-- <input type="button" id="Button1" name="btnHistory" value="History" class="btnUpdate"
                                                                    onclick="OnMoreInfoClick1('<%#Eval("Id") %>')"
                                                                    style="height: 21px" />--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="10">
                                                    <table style="border: solid 1px blue" class="TableMain100">
                                                        <tr>
                                                            <td>
                                                                <iframe id="iFrmInformation" style="vertical-align: top; height: 214px" src="" width="100%"
                                                                    frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
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
                    </td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                            <tr id="pnldatatbl" runat="server">
                                <td style="width: 100%">
                                    <asp:Panel ID="pnlData" Visible="False" Enabled="false" runat="server" Width="100%">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td class="Ecoheadtxt" style="width: 15%; text-align: left; height: 25px;">
                                                    <asp:Label ID="Label2" runat="server" CssClass="mylabel1">OutCome :</asp:Label>&nbsp;</td>
                                                <td style="text-align: left; height: 25px;">
                                                    <asp:TextBox ID="txtOutCome" runat="server" Width="722px"></asp:TextBox>
                                                    <input type="hidden" id="txtOutCome_id" name="txtOutCome_id" />
                                                    <asp:TextBox ID="TxtOut" runat="server" BackColor="Transparent" BorderColor="Transparent"
                                                        BorderStyle="None" ForeColor="#DDECFE" Width="175px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label16" runat="server" Text="Meeting at:" CssClass="mylabel1" Height="14px"
                                                                    Width="137px"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <table style="border: solid 1px white">
                                                                    <tr>
                                                                        <td>
                                                                            <asp:RadioButton ID="rdClient" runat="server" GroupName="k" Text="" Checked="True"
                                                                                /></td><td><asp:Label ID="Label19" runat="server" Text="Client Place" CssClass="ColorOption"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:RadioButton ID="rdBranch" runat="server" GroupName="k" Text="" CssClass="ColorOption" /> 
                                                                            </td><td><asp:Label ID="Label20" runat="server" Text="Branch Name" CssClass="ColorOption"></asp:Label>
                                                                            </td>
                                                                        <td>
                                                                            <asp:Label ID="lblVisitPlace" runat="server" CssClass="mylabel1" Text="Visit Place :"></asp:Label></td>
                                                                        <td id="TdVisitplace" style="display: inline">
                                                                            <asp:DropDownList ID="drpVisitPlace" runat="server" Width="220px">
                                                                            </asp:DropDownList></td>
                                                                        <td id="TdBranch" style="display: none">
                                                                            <asp:TextBox ID="txtbranch" runat="server" Width="253px"></asp:TextBox><asp:HiddenField
                                                                                ID="txtbranch_hidden" runat="server"></asp:HiddenField>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:HiddenField ID="hdcleint" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Ecoheadtxt" style="width: 15%; text-align: left;">
                                                    <asp:Label ID="lblVisitDateTime" runat="server" CssClass="mylabel1">Visit Date Time:</asp:Label>&nbsp;
                                                </td>
                                                <td>
                                                    <table style="width: 100%">
                                                        <tr>
                                                            <td class="Ecoheadtxt" style="text-align: left; width: 35%;">
                                                                <dxe:ASPxDateEdit ID="ASPxDateEdit" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy hh:mm tt"
                                                                    UseMaskBehavior="True" Width="220px">
                                                                    <ButtonStyle Width="13px">
                                                                    </ButtonStyle>
                                                                </dxe:ASPxDateEdit>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Ecoheadtxt" style="width: 15%; text-align: left;">
                                                    <asp:Label ID="Label3" runat="server" CssClass="mylabel1">Note/Remarks :</asp:Label>&nbsp;
                                                </td>
                                                <td colspan="5" class="Ecoheadtxt" style="text-align: left">
                                                    <asp:TextBox ID="txtNotes" TextMode="MultiLine" runat="server" Width="762px" Height="47px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="Ecoheadtxt" style="width: 15%; text-align: left; height: 31px;">
                                                    <span>
                                                        <asp:Label ID="Label15" runat="server" CssClass="mylabel1">Next ActivityType:</asp:Label>&nbsp;</span></td>
                                                <td class="Ecoheadtxt" colspan="5" style="text-align: left; height: 31px;">
                                                    <asp:RadioButton ID="rdrCall" runat="server" GroupName="rdr" Text="Phone FollowUp"
                                                        Width="107px" />
                                                    <asp:RadioButton ID="rdrVisit" runat="server" GroupName="rdr" Text="Visit" Checked="True"
                                                        Width="50px" />
                                                    <%-- <a class="decoration" href="sales_conveyence.aspx" onclick="window.open(this.href,'popupwindow','left=120,top=170,height=450,width=900,scrollbars=no,toolbar=no,location=center,menubar=no'); return false; "
                                                            style="font-size: 8pt; color: purple"> Expenses </a>--%>
                                                    <%--  <a class="decoration" href="sales_conveyence.aspx" onclick="window.open(this.href,'popupwindow','left=120,top=170,height=450,width=900,scrollbars=no,toolbar=no,location=center,menubar=no'); return false; "
                                                            style="font-size: 8pt; color: purple"> Expenses </a>--%>
                                                    <a href="javascript:void(0);" onclick="callDhtmlFormsParent('Expences','Optional');">
                                                        <span style="color: #000099; text-decoration: underline">Expenses</span> </a>
                                                </td>
                                            </tr>
                                            <tr>
                                            </tr>
                                        </table>
                                        <table width="100%">
                                            <tr>
                                                <td class="Ecoheadtxt" style="width: 15%; text-align: left;">
                                                    <asp:Label ID="lblNextVisitDate" runat="server" CssClass="mylabel1">Next Visit Date:</asp:Label>&nbsp;
                                                </td>
                                                <td class="Ecoheadtxt" style="text-align: left; width: 30%;">
                                                    <dxe:ASPxDateEdit ID="ASPxNextVisit" runat="server" EditFormat="Custom" EditFormatString="dd-MM-yyyy hh:mm tt"
                                                        Width="220px" UseMaskBehavior="True">
                                                        <ButtonStyle Width="13px">
                                                        </ButtonStyle>
                                                    </dxe:ASPxDateEdit>
                                                </td>
                                                <td class="Ecoheadtxt" id="tdnextvisit" style="width: 15%">
                                                    <asp:Label ID="lblNextVisitPlace" Text="Next Visit Place : " runat="server" Width="110px"
                                                        CssClass="mylabel1"></asp:Label>&nbsp;</td>
                                                <td class="Ecoheadtxt" id="tdnextvisit1" colspan="3" style="width: 60%; text-align: left;">
                                                    <table style="border: solid 1px white">
                                                        <tr>
                                                            <td>
                                                                <asp:RadioButton ID="rdNClient" runat="server" GroupName="kN" Text="" Checked="True"
                                                                    CssClass="ColorOption" /></td>
                                                            <td>
                                                                <asp:Label ID="Label18" runat="server" Text="Client Place" CssClass="ColorOption"
                                                                    Width="74px"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:RadioButton ID="rdNBranch" runat="server" GroupName="kN" Text="" /></td>
                                                            <td>
                                                                <asp:Label ID="Label17" runat="server" Text="Branch Name" CssClass="ColorOption"
                                                                    Width="98px"></asp:Label></td>
                                                            <td id="TdNextvisitplace" style="display: inline">
                                                                <asp:DropDownList ID="drpNextVisitPlace" runat="server" Width="220px">
                                                                </asp:DropDownList></td>
                                                            <td id="TdnBranch" style="display: none">
                                                                <asp:TextBox ID="txtNBranch" runat="server" Width="220px"></asp:TextBox><asp:HiddenField
                                                                    ID="txtNBranch_hidden" runat="server"></asp:HiddenField>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                        </table>
                        <table width="100%">
                            <tr>
                                <td colspan="8" align="left" style="padding-left: 143px">
                                    <asp:Button ID="btnSavePhoneCallDetails" runat="server" Text="Save" CssClass="btnUpdate"
                                        OnClick="btnSave1_Click" Height="21px" />
                                    <asp:Button ID="btnSetReminder" runat="server" Text="Reminder" Visible="False" CssClass="btnUpdate"
                                        OnClick="btnSetReminder_Click" Height="21px" />
                                    <asp:Button ID="BtnSCancel" runat="server" Text="Cancel" CssClass="btnUpdate" OnClick="BtnSCancel_Click"
                                        Height="21px" />
                                    <asp:Label ID="lblFieldName" runat="server" Text="Label" Visible="false"></asp:Label></td>
                            </tr>
                        </table>
                        </asp:Panel>
                        <asp:TextBox ID="txtStartDate" runat="server" BackColor="Transparent" BorderColor="Transparent"
                            BorderStyle="None" ForeColor="#DDECFE"></asp:TextBox>
                        <asp:TextBox ID="txtEndTime" runat="server" BackColor="Transparent" BorderColor="Transparent"
                            BorderStyle="None" ForeColor="#DDECFE"></asp:TextBox>
                        <asp:TextBox ID="txtExp" Text="0" runat="server" Visible="False" BackColor="Transparent"
                            BorderColor="Transparent" BorderStyle="None" ForeColor="#DDECFE"></asp:TextBox>
                        <asp:Label ID="lblVisitExp" runat="server" Text="Visit Expenses:" BackColor="Transparent"
                            BorderColor="Transparent" BorderStyle="None" ForeColor="#DDECFE" Visible="false"
                            Width="65px"></asp:Label>
                        <input type="hidden" id="txtProductCount" name="txtProductCount" />
                    </td>
                    </tr> </table> </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
