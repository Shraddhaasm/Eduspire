<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="DBMS.aspx.cs" Inherits="Eduspire3.DBMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins|Ubuntu&display=swap');*{box-sizing: border-box;margin: 0;padding: 0}
    body{
       /* background: #eee;*/
        font-family: 'Ubuntu',sans-serif;
                color: #f7dd24;

    }
    .btn{
        border-radius:11.25rem;
    }
    .star{
         margin-bottom: 30px;
    font-weight: 800;
    font-size: 25px;
    color:#f7dd24;
    }
    .font{
        font-size: 20px;
    }
    .color{
    margin-bottom: 30px;
    font-weight: 800;
    font-size: 30px;
    color: #DE6262
    }
  .box{
      position: relative;width: 100%;
      padding-right: 15px;
      padding-left: 15px

  }
  .our-services{
      margin-top: 75px;
      padding-bottom: 30px;
      padding: 0 60px;
      min-height: 198px;
      text-align: center;
      border-radius: 10px;
      background-color: #fff;
      transition: all .4s ease-in-out;
      box-shadow: 0 0 25px 0 rgba(20,27,202,.17)
  }
  .our-services .icon{
      margin-bottom: -21px;
      transform: translateY(-50%);
      text-align: center
  }
  .our-services:hover h4, 
  .our-services:hover p{
      color: #fff

  }
  .speedup:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #fb0054 0%, #f55b2a 100%)

  }
  .settings:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #34b5bf 0%, #210c59 100%)
  }
  .privacy:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #3615e7 0%, #44a2f6 100%)
  }
  .backups:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #fc6a0e 0%, #fdb642 100%)

  }
  .ssl:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #8d40fb 0%, #5a57fb 100%)

  }
  .database:hover{
      box-shadow: 0 0 25px 0 rgba(20,27,201,.05);
      cursor: pointer;
      background-image: linear-gradient(-45deg, #27b88d 0%, #22dd73 100%)
  }
</style>
    <form runat="server">
     <div class="text-left color">
        <h3><strong>DBMS Certification Course</strong></h3>
    </div>
    <div class="row">
    <div class="col col-4" >
        <img src="Images/DBMSImg.png" height="250px" width="300" />
    </div>
    <div class="fa-align-justify col-4 col-8  text-dark font font-weight-normal fa fa-python">
      Welcome to the course Database Management system from scratch !!!The concepts which we are going to study is going to give a very good understanding of Database Management System and by the end of it you will be able to answer any interview question on Database Management System.
   <br />
        <br />
        
             <br />
             <br />
        <asp:Button ID="btnProceed" class="btn btn-login btn-outline-success btn-success font col-4 col-8" runat="server" Text="Proceed" OnClick="btnProceed_Click" />
             <%--<asp:Button ID="btn" runat="server" type="button" class="btn btn-login btn-outline-success btn-success font col-4 col-8" Text="Proceed"/>--%>
       
            </div>
    </div>
        </div>
    <div class="text-info text-justify">
       In this course ,every concept of Database Management System is taught in an easy-to-understand manner such that anybody without any prerequisites will be able to master the concepts of Database Management System in the easiest way. <br />
 Mastering the concepts of Database Management System is very important to get started with Computer Science because Database Management System is the program which is responsible for the ease with which we are able to fetch the data from the database and that is the backbone of internet today.
        </div>
        </form>
</asp:Content>
