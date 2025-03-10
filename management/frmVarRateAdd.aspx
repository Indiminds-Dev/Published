<%@ page language="C#" autoeventwireup="true" inherits="management_frmVarRateAdd, App_Web_lyh0nvfl" %>

<%@ Register Assembly="DevExpress.Web.ASPxEditors.v9.1" Namespace="DevExpress.Web.ASPxEditors"
    TagPrefix="dxe" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link type="text/css" href="../CSS/style.css" rel="Stylesheet" />

    <script type="text/javascript" src="../JSFUNCTION/loaddata1.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/init.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/ajax-dynamic-list.js"></script>

    <script type="text/javascript" src="../JSFUNCTION/jquery-1.3.2.js"></script>
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
        function PageLoad(objVal)
            {
            
                document.getElementById('hidProdSeriesId').value=objVal;
            
            
            }
        function noNumbers(e)
            {
                var keynum
                var keychar
                var numcheck
                
                if(window.event)//IE
                {
                    keynum = e.keyCode                        
                    if(keynum>=48 && keynum<=57 || keynum==46)
                         {
                          return true;
                         }
                         else
                        {
                         alert("Please Insert Numeric Only");
                         return false;
                        }
                 } 
                 
                else if(e.which) // Netscape/Firefox/Opera
               {
                   keynum = e.which  
                   
                   if(keynum>=48 && keynum<=57 || keynum==46)
                         {
                          return true;
                         }
                         else
                         {
                         alert("Please Insert Numeric Only");
                         return false;
                         }     
                }
          }
           function showOptions(obj1,obj2,obj3)
         {
              var obj4=document.getElementById('dtTo_hidden').value;
              ajax_showOptions(obj1,obj2,obj3,obj4);
         }
         function CallAjax(obj1,obj2,obj3,Query)
         {

        var CombinedQuery=new String(Query);
        ajax_showOptions(obj1,obj2,obj3,replaceChars(CombinedQuery),'Main');
       
         }
         
         function GetInstruments(obj1,obj2,obj3)
        {
            var pseriesid=document.getElementById('hidProdSeriesId').value
           
           var strQuery_Table = "Master_Equity";
           var strQuery_FieldName = "Top 10 Ltrim(Rtrim(isnull(Equity_TickerSymbol,'')))+' ['+Ltrim(Rtrim(isnull(Equity_Series,'')))+'] ' as TickerSymbol,Ltrim(Rtrim(Equity_SeriesID)) as Equity_SeriesID";
           var strQuery_WhereClause = " (Equity_TickerSymbol like 'RequestLetter%' or Equity_Series like 'RequestLetter%') and Equity_ExchSegmentID="+pseriesid;
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
        function SetIntruments(InsVal)
            {
                document.getElementById('txtSelectionID_hidden').value=InsVal;
            }
         FieldName='btnSave';
    </script>

</head>
<body style="margin: 0px 0px 0px 0px; background-color: #DDECFE" onload="clearPreloadPage()">
    <form id="form1" runat="server">
    <div>
         <table class="TableMain100">
                <tr>
                    <td align="center" style="padding-left:70px;">
                        <table width="500px">
                         <tr>
                                <td  class="gridcellleft">
                                    Instrument:
                                </td>
                                <td  class="gridcellleft">
                                    <asp:TextBox ID="txtSelectionID" runat="server" Font-Size="12px" onkeyup="GetInstruments(this,'GenericAjaxList',event)" Width="250px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSelectionID"
                                        ErrorMessage="Required!."></asp:RequiredFieldValidator>
                                    <asp:HiddenField ID="txtSelectionID_hidden" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    For Date:
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxDateEdit ID="cmbForDate" runat="server" EditFormat="Custom" Width="250px" ClientEnabled="false"
                                        UseMaskBehavior="True">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                        <DropDownButton Text="">
                                        </DropDownButton>
                                    </dxe:ASPxDateEdit>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cmbForDate"
                                        ErrorMessage="Required!."></asp:RequiredFieldValidator>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    Security Var :
                                </td>
                                <td  class="gridcellleft">
                                     <dxe:ASPxTextBox runat="server" width="125px" ID="txtSecurityVar" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999g>.<00..99>"  />
                                                              <%-- <ValidationSettings ErrorDisplayMode="None"></ValidationSettings>--%>
                                                          </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    Index Var :
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="125px" ID="txtIndexVar" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999g>.<00..99>"  />
                                                            
                                                          </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    Var Margin :
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="125px" ID="txtVarMargin" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999g>.<00..99>"  />
                                                            
                                                          </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    Extreme Loss Rate :
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="125px" ID="txtExtremeLossRate" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999g>.<00..99>"  />
                                                            
                                                          </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    Adhoc Margin :
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="125px" ID="txtAdhocMargin" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999g>.<00..99>"  />
                                                            
                                                          </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    Special Margin :
                                </td>
                                <td  class="gridcellleft">
                                    <dxe:ASPxTextBox runat="server" width="125px" ID="txtSpecialMargin" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999g>.<00..99>"  />
                                                            
                                                          </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td  class="gridcellleft">
                                    App Margin :
                                </td>
                                <td  class="gridcellleft">
                                   <dxe:ASPxTextBox runat="server" width="125px" ID="txtAppMargin" onkeypress="return noNumbers(event)">
                                                           <MaskSettings Mask="<0..999g>.<00..99>"  />
                                                            
                                                          </dxe:ASPxTextBox>
                                </td>
                            </tr>
                            
                            <tr>
                                <td style="display:none;">
                                <asp:TextBox ID="dtTo_hidden" runat="server" Font-Size="12px" Width="78px"></asp:TextBox>
                                </td>
                                <td  class="gridcellleft">
                                    <asp:Button ID="btnSave" CssClass="btnUpdate" runat="server" Text="Save" OnClick="btnSave_Click" />
                                       <input id="btnClose" type="button" name="Cancel" value="Cancel" onclick="javascript:parent.editwin.close();"
                                        class="btnUpdate" />
                                        <asp:HiddenField ID="hidProdSeriesId" runat="server" />
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
