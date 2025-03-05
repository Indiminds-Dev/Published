<%@ page language="C#" autoeventwireup="true" inherits="management_targetSetUpsubbroker, App_Web_rilo-itm" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dxwgv" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1, Version=9.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script language="javascript" type="text/javascript">
         function SignOff()
            {
            window.parent.SignOff()
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
                window.frameElement.widht = document.body.scrollWidht;
           
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

    <script language="javascript" type="text/javascript">	
	   
	  FieldName='TxtApplicableDate';
	  function btnNew_Click()
	  {
	        document.getElementById('TdGrid').style.display = 'none';
            document.getElementById('TdInsert').style.display = 'inline';
	  }
	  function BtnCancel_Click()
	  {
	        document.getElementById('TdGrid').style.display = 'inline';
            document.getElementById('TdInsert').style.display = 'none';
	  }
	  function BtnClear_Click()
	  {
	    var TextBoxId=document.getElementById("TxtBranchName_hidden"); 
        TextBoxId.value='';
        var TextBoxId=document.getElementById("TxtBranchName"); 
        TextBoxId.value='';
        var TextBoxId=document.getElementById("TxtApplicableDate"); 
        TextBoxId.value='';
	  }
    </script>

    <script type="text/ecmascript">
    function BtnSave_Click()
    {
        var data='Save';
        var TextBoxId=document.getElementById("TxtBranchName_hidden"); 
        if(TextBoxId.Value=='')
        {
            alert('Sub Broker Name Can Not be Blank');
            return false;
        }
        else    
        {
            data+='~'+TextBoxId.Value;
        }
        TextBoxId=document.getElementById("cmbTargetname"); 
        data+='~'+TextBoxId.value;
         var dataFromCombo=TxtApplicableDate.GetDate();
          TextBoxId=(dataFromCombo.getMonth()+1)+'/'+dataFromCombo.getDate()+'/'+dataFromCombo.getFullYear();
        //TextBoxId=document.getElementById("TxtApplicableDate"); 
        if(TextBoxId=='')
        {
            alert('Applicable Date Can Not be Blank');
            return false;
        }
        else    
        {
            data+='~'+TextBoxId;
        }
        CallServer(data, ""); 
        BtnClear_Click();
        document.getElementById('TdGrid').style.display = 'inline';
        document.getElementById('TdInsert').style.display = 'none';
    }
    function ReceiveServerData(rValue)
    {
        var DATA=rValue.split('~');
        if(DATA[0]=="Save")
        {
            if(DATA[1]=="Y")
            {
                alert('Update Successfully !!');
                grid.PerformCallback();
            }
            else
            {
                alert('Tilldate Must Be Greater Than Applicable Date!');  
                document.getElementById('TdGrid').style.display = 'none';
                document.getElementById('TdInsert').style.display = 'inline';  
                return false;            
            }
        }
    }
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
        <table class="TableMain100">
            <tr>
                <td class="EHEADER" style="text-align: center;">
                    <strong><span style="color: #000099">Target setup for sub brokers</span></strong>
                </td>
            </tr>
            <tr>
                <td style="text-align: left" id="TdGrid">
                    <dxwgv:ASPxGridView ID="gridBranch" runat="server" ClientInstanceName="grid" Width="100%"
                        OnCustomCallback="gridBranch_CustomCallback">
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="branch_description" Caption="Branch Name"
                                VisibleIndex="0">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="tgt_descripition" Caption="Target Name"
                                VisibleIndex="1">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="ApplicableDate" Caption="ApplicableDate"
                                VisibleIndex="2">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="Tilldate" Caption="Tilldate" VisibleIndex="3">
                                <CellStyle CssClass="gridcellleft">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                        </Styles>
                        <SettingsPager ShowSeparators="True" Visible="False">
                            <FirstPageButton Visible="True">
                            </FirstPageButton>
                            <LastPageButton Visible="True">
                            </LastPageButton>
                        </SettingsPager>
                    </dxwgv:ASPxGridView>
                    <input id="btnNew" type="button" value="New" class="btnUpdate" style="width: 69px"
                        onclick="btnNew_Click()" />
                </td>
            </tr>
            <tr>
                <td id="TdInsert" align="center">
                    <asp:Panel ID="PnlInsert" runat="server" BorderColor="white" Width="50%" BorderWidth="1px">
                        <table class="TableMain100">
                            <tr>
                                <td class="Ecoheadtxt" style="width: 36%">
                                    Sub Broker Name :
                                </td>
                                <td class="gridcellleft">
                                    <asp:TextBox ID="TxtBranchName" runat="server"></asp:TextBox>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td class="Ecoheadtxt" style="width: 36%">
                                    Target Name :
                                </td>
                                <td class="gridcellleft">
                                    <asp:DropDownList ID="cmbTargetname" runat="server" Width="154px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="Ecoheadtxt" style="width: 36%">
                                    Applicable Date :
                                </td>
                                <td class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="TxtApplicableDate" runat="server" EditFormat="Custom" UseMaskBehavior="true">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                        <DropDownButton>
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <input id="BtnSave" type="button" value="Save" class="btnUpdate" style="width: 62px"
                                        onclick="BtnSave_Click()" />
                                    <input id="BtnCancel" type="button" value="Cancel" class="btnUpdate" style="width: 62px"
                                        onclick="BtnCancel_Click()" />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="display: none">
                                    <asp:TextBox ID="TxtBranchName_hidden" runat="server" Width="1px" Font-Size="10px"></asp:TextBox></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
