<%@ page language="C#" autoeventwireup="true" inherits="management_Lead_Activity, App_Web_0payuukt" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../css/style.css" type="text/css" rel="Stylesheet" />
    <!--___________________These files are for List Items__________________________-->

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <!--___________________________________________________________________________-->
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

    <script language="javascript" type="text/javascript">
        function CallList(obj1,obj2,obj3)
        {
            //alert('rrr');
            var obj6=document.getElementById("cmbCategory");
            if(obj6.value=='HLO' || obj6.value=='LAP' || obj6.value=='PLO' || obj6.value=='TLO' || obj6.value=='BLO' || obj6.value=='ELO' || obj6.value=='ALO' || obj6.value=='SLO' || obj6.value=='LAS' || obj6.value=='CRD')
            {
                ajax_showOptions(obj1,obj2,obj3,obj6.value);
            }
            else
            {
                var obj4=document.getElementById("txtCompany_hidden");
                var obj5=obj4.value;
                //alert(obj5);
                ajax_showOptions(obj1,obj2,obj3,obj5);
            }
        }
        function CallList1(obj1,obj2,obj3)
        {
            //alert('rrr');
            
            var obj4=document.getElementById("cmbCategory");
            var obj5=obj4.value;
            //alert(obj5);
            ajax_showOptions(obj1,obj2,obj3,obj5);
        }
    FieldName = 'BTNClose';
    function Validation()
    {
        var ddl=document.getElementById("cmbCategory");
        var txt=document.getElementById("txtProductAmmount");
        if(ddl.value=="Mutual Fund")
         {  
            if(txt.value=="")
             {
                alert('Product Amount Required');
                return false;
             }
             else
              {
                 return true;
              }
         }
       if(ddl.value=="Insurance")
         {  
            if(txt.value=="")
             {
                alert('Product Amount Required');
                return false;
             }
             else
              {
                 return true;
              }
         }
       else
        {   
            return true;
        }
    }

    
        function SignOff()
        {
            window.parent.SignOff()
        }
        function height()
        {
//            window.frameElement.height = document.body.scrollHeight;
//            window.frameElement.widht = document.body.scrollWidht;
        }
        
        function AddProductCategory()
        {
           GridCategory.PerformCallback();
        }
        function VisibilityOnOff(obj)
        {
          
            if(obj=='Broking & DP Account' || obj=='Sub Broker' || obj=='Relationship Partner')
            {
                document.getElementById("TDCompanyName").style.display='none';
                document.getElementById("TDCompanyVal").style.display='none';
                document.getElementById("TDProductName").style.display='none';
                document.getElementById("TDProductVal").style.display='none';
                document.getElementById("TDProductAmtName").style.display='none';
                document.getElementById("TDProductAmtVal").style.display='none';
                document.getElementById("TDADD").style.display='none';
                document.getElementById("TDGRID").style.display='none';
                
            }
            else
            {
                document.getElementById("TDCompanyName").style.display='inline';
                document.getElementById("TDCompanyVal").style.display='inline';
                document.getElementById("TDProductName").style.display='inline';
                document.getElementById("TDProductVal").style.display='inline';
                document.getElementById("TDProductAmtName").style.display='inline';
                document.getElementById("TDProductAmtVal").style.display='inline';
                document.getElementById("TDADD").style.display='inline';
                document.getElementById("TDGRID").style.display='inline';
            }
            
        }
      function BranchOrClient(obj)
      {
          
          if(obj.id=='rdClient')
          {
            document.getElementById("drpVisitPlace").style.display='inline';
            document.getElementById("TdVisitplace").style.display='inline';
            document.getElementById("TdBranch").style.display='none';
          }
          
          else if(obj.id=='rdBranch')
          {
            document.getElementById("drpVisitPlace").style.display='none';
            document.getElementById("TdVisitplace").style.display='none';
            document.getElementById("TdBranch").style.display='inline';
          }
      }
       function SearchByBranchName(obj1,obj2,obj3)
        {
            ajax_showOptions(obj1,obj2,obj3);
        }
        FieldName='cmbAddressOfMeeting';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <div>
            <table class="TableMain100">
                <tr>
                    <td>
                        <table style="width: 98%">
                            <tr>
                                <td class="mylabel1" style="width: 15%;">
                                    <asp:Label ID="Label2" runat="server" Text="Activity Type"></asp:Label></td>
                                <td style="width: 35%; text-align: left">
                                    <asp:DropDownList ID="cmbActType" runat="server" Width="100%" AutoPostBack="true"
                                        OnSelectedIndexChanged="cmbActType_SelectedIndexChanged" TabIndex="1">
                                        <asp:ListItem Text="Phone Calls" Value="1" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="Sales Visit" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="Sales" Value="6"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="width: 50%">
                                    <asp:Label ID="lblmessage1" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Panel runat="server" ID="Body" Width="100%">
                            <table style="width: 98%">
                                <tr>
                                    <td class="mylabel1" style="width: 15%;">
                                        <asp:Label ID="Label3" runat="server" Text="Assign To"></asp:Label></td>
                                    <td style="width: 35%">
                                        <asp:DropDownList ID="cmbAssignTo" runat="server" Width="100%" TabIndex="2">
                                        </asp:DropDownList></td>
                                    <td class="mylabel1" style="width: 15%;">
                                        <asp:Label ID="Label1" runat="server" Text="Start Date/Time"></asp:Label></td>
                                    <td style="width: 35%">
                                        <%--<asp:TextBox ID="txtStartDate" runat="server" TabIndex="3" Width="146px"></asp:TextBox>
                                    <asp:Image
                                        ID="imgStartDate" runat="server" ImageUrl="~/images/calendar.jpg" />--%>
                                        <dxe:ASPxDateEdit ID="txtStartDate" runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy hh:mm tt"
                                            UseMaskBehavior="True" TabIndex="3">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                        </dxe:ASPxDateEdit>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStartDate"
                                            Display="Dynamic" ErrorMessage="date required" ValidationGroup="b"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="width: 50%">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cmbAssignTo"
                                            Display="Dynamic" ErrorMessage="Please Select user."></asp:RequiredFieldValidator></td>
                                    <td class="mylabel1" style="width: 15%;">
                                        <asp:Label ID="Label4" runat="server" Text="End Date/Time"></asp:Label></td>
                                    <td style="width: 35%">
                                        <%--<asp:TextBox ID="txtEndDate" runat="server" TabIndex="4" Width="146px"></asp:TextBox>
                                    <asp:Image
                                        ID="imgEndDate" runat="server" ImageUrl="~/images/calendar.jpg" />--%>
                                        <dxe:ASPxDateEdit ID="txtEndDate" runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy hh:mm tt"
                                            UseMaskBehavior="True" TabIndex="4">
                                            <ButtonStyle Width="13px">
                                            </ButtonStyle>
                                        </dxe:ASPxDateEdit>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="mylabel1" style="width: 15%;">
                                        <asp:Label ID="Label5" runat="server" Text="Description"></asp:Label></td>
                                    <td style="width: 35%">
                                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Width="100%"
                                            TabIndex="5"></asp:TextBox></td>
                                    <td class="mylabel1" style="width: 15%;">
                                        <asp:Label ID="Label6" runat="server" Text="Priority"></asp:Label></td>
                                    <td style="width: 35%">
                                        <asp:DropDownList ID="cmbPriority" runat="server" Width="100%" TabIndex="6">
                                            <asp:ListItem Text="Low" Value="0"></asp:ListItem>
                                            <asp:ListItem Text="Normal" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="High" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="Urgent" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="Immediate" Value="4"></asp:ListItem>
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td class="mylabel1" style="width: 15%;">
                                        <asp:Label ID="Label7" runat="server" Text="Instruction Notes" Width="80px"></asp:Label></td>
                                    <td colspan="3" style="width: 85%">
                                        <asp:TextBox ID="txtInstructionNotes" runat="server" TextMode="MultiLine" Width="99%"
                                            TabIndex="7"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="width: 100%">
                                        <asp:Panel runat="server" ID="panelinside" Width="100%">
                                            <table style="width: 100%">
                                                <tr>
                                                    <td colspan="4">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="width: 6%" class="mylabel1">
                                                                    <asp:Label ID="Label8" runat="server" Text="Category"></asp:Label></td>
                                                                <td style="width: 37%">
                                                                    <asp:DropDownList ID="cmbCategory" runat="server" Width="100%" TabIndex="8">
                                                                        <asp:ListItem Text="Broking &amp; DP Account" Value="Broking &amp; DP Account"></asp:ListItem>
                                                                        <asp:ListItem Text="Mutual Fund" Value="Mutual Fund"></asp:ListItem>
                                                                        <asp:ListItem Text="Insurance-Life" Value="Insurance-Life"></asp:ListItem>
                                                                        <asp:ListItem Text="Insurance-General" Value="Insurance-General"></asp:ListItem>
                                                                        <asp:ListItem Text="Relationship Partner" Value="Relationship Partner"></asp:ListItem>
                                                                        <asp:ListItem Text="Sub Broker" Value="Sub Broker"></asp:ListItem>
                                                                        <asp:ListItem Text="Housing Loan" Value="HLO"></asp:ListItem>
                                                                        <asp:ListItem Text="Loan Against Property" Value="LAP"></asp:ListItem>
                                                                        <asp:ListItem Text="Personal Loan" Value="PLO"></asp:ListItem>
                                                                        <asp:ListItem Text="Travel Loan" Value="TLO"></asp:ListItem>
                                                                        <asp:ListItem Text="Business Loan" Value="BLO"></asp:ListItem>
                                                                        <asp:ListItem Text="Education Loan" Value="ELO"></asp:ListItem>
                                                                        <asp:ListItem Text="Auto Loan" Value="ALO"></asp:ListItem>
                                                                        <asp:ListItem Text="SME Loan" Value="SLO"></asp:ListItem>
                                                                        <asp:ListItem Text="Loan Against Securities" Value="LAS"></asp:ListItem>
                                                                        <asp:ListItem Text="Credit Cards" Value="CRD"></asp:ListItem>
                                                                    </asp:DropDownList></td>
                                                                <td style="width: 16%" class="mylabel1" id="TDCompanyName">
                                                                    <asp:Label ID="Label13" runat="server" Text="Company Name"></asp:Label>
                                                                </td>
                                                                <td style="width: 35%" id="TDCompanyVal">
                                                                    <asp:TextBox ID="txtCompany" runat="server" Width="99%" ValidationGroup="a" TabIndex="9"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 15%" class="mylabel1" id="TDProductName">
                                                                    <asp:Label ID="Label9" runat="server" Text="Product"></asp:Label></td>
                                                                <td style="width: 37%" id="TDProductVal">
                                                                    <asp:TextBox ID="txtProduct" runat="server" Width="99%" ValidationGroup="a" TabIndex="10"></asp:TextBox>
                                                                </td>
                                                                <td style="width: 16%; height: 38px;" class="mylabel1" id="TDProductAmtName">
                                                                    <asp:Label ID="Label10" runat="server" Text="Product Ammount"></asp:Label></td>
                                                                <td style="width: 35%; height: 38px;" colspan="2" id="TDProductAmtVal">
                                                                    <asp:TextBox ID="txtProductAmmount" runat="server" ValidationGroup="a" Width="99%"
                                                                        TabIndex="11"></asp:TextBox>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtProductAmmount"
                                                                        Display="Dynamic" ErrorMessage="Only Integer" ValidationExpression="^[0-9]+"
                                                                        SetFocusOnError="True"></asp:RegularExpressionValidator>
                                                                    <asp:Label ID="lblAmountError" runat="server" ForeColor="Red" Text="Amount Required"
                                                                        Visible="False"></asp:Label></td>
                                                                <td id="TDADD">
                                                                    <input id="Button1" type="button" runat="server" value="Add" onclick="AddProductCategory()" />
                                                                    <%-- <asp:Button ID="BtnADD" runat="server" Text="Add" OnClientClick="AddProductCategory();" visible="false" ValidationGroup="a" CssClass="btnUpdate" TabIndex="12"  />--%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr id="TdProduct" runat="server">
                                                    <td style="width: 100%; text-align: left;" colspan="4" id="TDGRID">
                                                        <dxwgv:ASPxGridView ID="GridCategory" ClientInstanceName="GridCategory" runat="server"
                                                            Width="100%" OnCustomCallback="GridCategory_CustomCallback">
                                                            <Styles>
                                                                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                </Header>
                                                                <LoadingPanel ImageSpacing="10px">
                                                                </LoadingPanel>
                                                            </Styles>
                                                            <Settings ShowGroupButtons="False" ShowStatusBar="Hidden" />
                                                            <SettingsBehavior AllowDragDrop="False" AllowGroup="False" AllowSort="False" />
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                        </dxwgv:ASPxGridView>
                                                        <asp:Label ID="lblmessage" runat="server" ForeColor="Red"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 15%" class="mylabel1">
                                                        <asp:Label ID="Label11" runat="server" Text="Next Visit Date"></asp:Label></td>
                                                    <td style="width: 35%" colspan="1">
                                                        <%--<asp:TextBox ID="txtNextDate" runat="server" TabIndex="12" Width="146px"></asp:TextBox>
                                        <asp:Image
                                            ID="imgNextDate" runat="server" ImageUrl="~/images/calendar.jpg" />--%>
                                                        <dxe:ASPxDateEdit ID="txtNextDate" runat="server" EditFormat="Custom" EditFormatString="dd MMMM yyyy hh:mm tt"
                                                            UseMaskBehavior="True" TabIndex="13">
                                                            <ButtonStyle Width="13px">
                                                            </ButtonStyle>
                                                        </dxe:ASPxDateEdit>
                                                    </td>
                                                    <td style="width: 50%" colspan="2">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtNextDate"
                                                            Display="Dynamic" ErrorMessage="Date Required!" SetFocusOnError="True" ValidationGroup="b"></asp:RequiredFieldValidator></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <table style="border: solid 1px white">
                                                            <tr>
                                                            <td>
                                                                    <asp:Label ID="lblVisitPlace" runat="server" CssClass="mylabel1" Text="Next Visit Place :"></asp:Label></td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdClient" runat="server" GroupName="k" Text="" Checked="true"
                                                                        CssClass="ColorOption" Width="1px" /><asp:Label CssClass="ColorOption" ID="Label12" runat="server" Text="Client Place"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:RadioButton ID="rdBranch" runat="server" GroupName="k" Text="" CssClass="ColorOption" />
                                                                    <asp:Label ID="Label14" CssClass="ColorOption" runat="server" Text="Branch Name"></asp:Label></td>
                                                                
                                                                <td id="TdVisitplace" style="display: inline">
                                                                    <asp:DropDownList ID="drpVisitPlace" runat="server" Width="256px">
                                                                    </asp:DropDownList></td>
                                                                <td id="TdBranch" style="display: none">
                                                                    <asp:TextBox ID="txtbranch" runat="server" Width="253px"></asp:TextBox><asp:HiddenField
                                                                        ID="txtbranch_hidden" runat="server"></asp:HiddenField>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <%--<tr>
                                                    <td style="width: 15%;" class="mylabel1">
                                                        <asp:Label ID="Label12" runat="server" Text="Address Of Meeting"></asp:Label></td>
                                                    <td style="width: 50%; height: 2px;" colspan="2">
                                                        <asp:DropDownList ID="cmbAddressOfMeeting" runat="server" Width="100%" ValidationGroup="b"
                                                            TabIndex="14">
                                                        </asp:DropDownList></td>
                                                    <td style="width: 35%;">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cmbAddressOfMeeting"
                                                            Display="Dynamic" ErrorMessage="Add Address!" ValidationGroup="b"></asp:RequiredFieldValidator></td>
                                                </tr>--%>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; height: 30px; text-align: right;" colspan="4">
                                        <asp:Button ID="BTNSave" runat="server" Text="Save" OnClick="BTNSave_click" CssClass="btnUpdate"
                                            ValidationGroup="b" TabIndex="15" />&nbsp; &nbsp;<asp:Button ID="BTNClose" runat="server"
                                                Text="Close" OnClick="BTNClose_Click" CssClass="btnUpdate" TabIndex="15" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <asp:TextBox ID="txtCompany_hidden" runat="server" BackColor="Transparent" BorderColor="Transparent"
                                            BorderStyle="None" ForeColor="#DDECFE"></asp:TextBox>
                                        <asp:TextBox ID="txtProduct_hidden" runat="server" Visible="false"></asp:TextBox></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
