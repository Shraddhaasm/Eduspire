<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="Callback.aspx.cs" Inherits="Eduspire3.Callback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">

    <form runat="server">
        <div class="container">
            <h1 runat="server" id="h1Message"></h1>

            <p runat="server" visible="false" id="pTxnId"></p>

             <p runat="server"  id="pOrderId"></p>

            <p>Click here to go to Home </p>

            <p> <a href="Payment.aspx" class="btn btn-login" role="button"> Home</a></p>
        </div>
        <asp:Label ID="lblDate" runat="server" Visible="false"></asp:Label>
    </form>

</asp:Content>
