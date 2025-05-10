<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="Java.aspx.cs" Inherits="Eduspire3.Java" %>
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
        <h3><strong>Java Certification Course</strong></h3>
    </div>
    <div class="row">
    <div class="col col-4" >
        <img src="Images/JavaImg.png" height="250px" width="300" />
    </div>
    <div class="fa-align-justify col-4 col-8  text-dark font font-weight-normal fa fa-python">
       Learn more than 30 Full Stack tools and technologies and practice with multiple project. Complete Full Stack Java Developer Course to master these skills and get a guaranteed job.Learn how to build with Java using the latest and greatest tools and techniques.Enroll in this free Java online course, complete the quiz, and gain a free certificate of course completion. Interested in learning advanced software skills?
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
        This Java Training Course online is designed for students and professionals who want to be Java Developer. This 42-hour Java training will cover core and advanced Java concepts like Java Array, Collections, Database connectivity, Threads, Exception Handling, JSP, Servlets, XML handling, etc. You will also learn various Java frameworks like Hibernate and Spring. <br />
  This Java training online will give you extensive knowledge of Core Java & J2EE basic and advanced concepts and popular frameworks like Hibernate, Spring & SOA. This is a live, instructor-led training to help you master other concepts like Java Array, Java Data Type, Java Functions & Java Loops to name a few, with industry use cases. 
        </div>
        </form>
</asp:Content>
