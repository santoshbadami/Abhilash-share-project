<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="WebForm2.aspx.cs" Inherits="share.WebForm2" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<div>
    <br /><br />
    <table style="font-size: large;">
        <tr><td style="width:50px;"></td><td style="width:150px;">Date</td><td style="width:175px;">Debit/Credit details</td><td style="width:165px;">Pigmi</td><td style="width:165px;">DF</td></tr>
    </table>
<asp:GridView ID="gridView" DataKeyNames="id" runat="server"
        AutoGenerateColumns="false" ShowFooter="true" HeaderStyle-Font-Bold="true"
        onrowcancelingedit="gridView_RowCancelingEdit"
        onrowdeleting="gridView_RowDeleting"
        onrowediting="gridView_RowEditing"
        onrowupdating="gridView_RowUpdating"
        onrowcommand="gridView_RowCommand"
        OnRowDataBound="gridView_RowDataBound">
<Columns>

 <asp:TemplateField HeaderText="SL No">
        <ItemTemplate>
             <%#Container.DataItemIndex+1 %>
        </ItemTemplate>
    </asp:TemplateField>

 <asp:TemplateField HeaderText="Date">
     <HeaderTemplate>
         <asp:TextBox ID="inDate"  width="130px" CssClass="example1" runat="server"/>
         <asp:RequiredFieldValidator ID="vname" runat="server" ControlToValidate="inDate" Text="?" ValidationGroup="validaiton"/>
     </HeaderTemplate>
      <ItemTemplate>
         <asp:Label ID="lblDate" width="130px" runat="server" Text='<%#Eval("Date", "{0:yyyy/MM/dd}") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtDate" width="130px" CssClass="example1"  runat="server" Text='<%#Eval("Date") %>'/>
     </EditItemTemplate>
     <FooterTemplate>
         <asp:Label ID="lblDate" width="130px"  runat="server" Font-Bold="true" Text="Total"/>
     </FooterTemplate>
 </asp:TemplateField>
 <asp:TemplateField HeaderText="Debit/CreditDetails">
     <HeaderTemplate>
         <asp:TextBox ID="indebitcreditdetails" width="130px"  runat="server"/>
        <asp:RequiredFieldValidator ID="vaddress" runat="server" ControlToValidate="indebitcreditdetails" Text="?" ValidationGroup="validaiton"/>
     </HeaderTemplate>
     <ItemTemplate>
         <asp:Label ID="lbldebitcreditdetails" width="130px" runat="server" Text='<%#Eval("debitcreditdetails") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtdebitcreditdetails" width="130px"  runat="server" Text='<%#Eval("debitcreditdetails") %>'/>
     </EditItemTemplate>
    <FooterTemplate>
        
    </FooterTemplate>
 </asp:TemplateField>
  <asp:TemplateField HeaderText="Pigmi">
      <HeaderTemplate>
          <asp:TextBox ID="inPigmi" width="120px"  runat="server"/>
        <asp:RequiredFieldValidator ID="vcity" runat="server" ControlToValidate="inPigmi" Text="?" ValidationGroup="validaiton"/>
      </HeaderTemplate>
       <ItemTemplate>
         <asp:Label ID="lblPigmi" width="130px" runat="server" Text='<%#Eval("Pigmi") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtPigmi" width="130px"  runat="server" Text='<%#Eval("Pigmi") %>'/>
     </EditItemTemplate>
    <FooterTemplate>
        <asp:Label ID="lblPigmi" width="130px" Font-Bold="true"  runat="server" />
    </FooterTemplate>
 </asp:TemplateField>
   <asp:TemplateField HeaderText="DF">
       <HeaderTemplate>
           <asp:TextBox ID="inDF" width="120px"   runat="server"/>
        <asp:RequiredFieldValidator ID="vstate" runat="server" ControlToValidate="inDF" Text="?" ValidationGroup="validaiton"/>
       </HeaderTemplate>
     <ItemTemplate>
         <asp:Label ID="lblDF" width="130px" runat="server" Text='<%#Eval("DF") %>'/>
     </ItemTemplate>
     <EditItemTemplate>
         <asp:TextBox ID="txtDF" width="130px"  runat="server" Text='<%#Eval("DF") %>'/>
     </EditItemTemplate>
    <FooterTemplate>
        <asp:Label ID="lblDF" width="130px" Font-Bold="true" runat="server" />
    </FooterTemplate>
 </asp:TemplateField>
    <asp:TemplateField HeaderText="Total">
                <ItemTemplate>
                    <asp:Label ID="lbltotal" width="130px"  runat="server" Text='<%# Convert.ToDecimal(Eval("Pigmi")) + Convert.ToDecimal(Eval("DF")) %>' />
                </ItemTemplate>
</asp:TemplateField>
 <asp:TemplateField>
     <HeaderTemplate>
         <asp:Button ID="ButtonAdd" CssClass="btn btn-primary btn-large" runat="server" CommandName="AddNew"  Text="Add New Row" ValidationGroup="validaiton" />
     </HeaderTemplate>
    <EditItemTemplate>
        <asp:Button ID="ButtonUpdate" CssClass="btn btn-primary btn-largelt" runat="server" CommandName="Update"  Text="Update"  />
        <asp:Button ID="ButtonCancel" CssClass="btn btn-primary btn-large" runat="server" CommandName="Cancel"  Text="Cancel" />
    </EditItemTemplate>
    <ItemTemplate>
        <asp:Button ID="ButtonEdit" CssClass="btn btn-primary btn-large" runat="server" CommandName="Edit"  Text="Edit"  />
        <asp:Button ID="ButtonDelete" CssClass="btn btn-primary btn-large" runat="server" CommandName="Delete"  Text="Delete"  />
    </ItemTemplate>
    <FooterTemplate>
        
    </FooterTemplate>
 </asp:TemplateField>
 </Columns>
</asp:GridView>
    </div>
<div >
<br />&nbsp;&nbsp;&nbsp;&nbsp;
<asp:Label ID="lblmsg" runat="server"></asp:Label>
</div>

    <script src="js/bootstrap-datepicker.js"></script>
    <script type="text/javascript">
        // When the document is ready
        $(document).ready(function () {

            $('.example1').datepicker({
                format: "yyyy-mm-dd"
            });

        });
    </script>

    </asp:Content>