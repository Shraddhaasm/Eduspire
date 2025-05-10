<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="HTML.aspx.cs" Inherits="Eduspire3.HTML" %>
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
        <h3><strong>HTML Certification Course</strong></h3>
    </div>
    <div class="row">
    <div class="col col-4" >
        <img src="Images/HTMLImg.jpg" height="250px" width="300" />
    </div>
    <div class="fa-align-justify col-4 col-8  text-dark font font-weight-normal fa fa-python">
       Choose between Frontend and Backend Development or both and learn at your pace. Must have a Bachelor's degree or a diploma. The perfect Tech Degree! The future of Tech Career. Your career starts here! Degree programs: MS in Computer science, MS in Data science.Take this course and learn about the inner workings of an HTML form! Learn how to create your own form.
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
        In this course, you will learn how to use HTML5 and CSS3, the two types of code upon which all websites are based. HTML and CSS are great entry points to the world of code and are necessary languages for any developer or web designer to know. Create your page's content with HTML, and make it look great with CSS. You'll learn all about these two languages and how they work together to render all your favorite websites. <br />
 HTML and CSS are two pillars of web development, they are used to create web pages you see every day. HTML provides the structure to your web page and CSS provides them the style to look better. If you want to become a front-end web developer or web designer then a good knowledge of HTML and CSS is a must.
        </div>
        </form>
</asp:Content>
