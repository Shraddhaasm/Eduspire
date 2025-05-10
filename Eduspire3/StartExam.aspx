<%@ Page Title="" Language="C#" MasterPageFile="~/ContentStu.Master" AutoEventWireup="true" CodeBehind="StartExam.aspx.cs" Inherits="Eduspire3.StartExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }

        .auto-style2 {
            height: 237px;
        }

        .table td, .table th {
            padding: 0.5rem !important;
            vertical-align: top;
            border-top: 1px solid #dee2e6;
        }

        .mand {
            color: Red;
            position: absolute;
            font-size: 16px;
            font-weight: 500;
        }

        .error {
            color: Red;
            /* visibility: hidden; */
            position: absolute;
            font-size: 13px;
            font-weight: 500;
        }

        .modal-dialog {
            max-width: 100%;
            margin: 4px !important;
        }
    </style>

    <form id="form1" runat="server">

        <%--https://stackoverflow.com/questions/52782598/next-and-previous-buttons-step-through-bootstrap-tabs--%>
        <script>
            $(function () {
                $("#mytabs").append($("#ContentPlaceHolder3_HiddenField2").val());
                
                $("#Quessions").append($("#ContentPlaceHolder3_HiddenField3").val());

                $("#ContentPlaceHolder3_HiddenField2").val("");
                $("#ContentPlaceHolder3_HiddenField3").val("");
                 $("#mytabs a:first").tab("show");

                $(".next").on("click", function () {
                    const $active = $(".tab-pane.active");
                    const $next = $active.next();

                    if ($next.length) {
                        $active.removeClass("active show");
                        $next.addClass("active show");
                    }
                });

                $(".prev").on("click", function () {
                    const $active = $(".tab-pane.active");
                    const $prev = $active.prev();

                    if ($prev.length) {
                        $active.removeClass("active show");
                        $prev.addClass("active show");
                    }
                });
            });

        </script>
        <style>
            #mytabs {
                margin: 0 10px;
                display: inline-block;
            }
            /*
            body {
                background-color: #816161;
            }*/



            label.btn {
                padding: 11px 51px;
                font-size: 17px;
                white-space: normal;
                -webkit-transform: scale(1.0);
                -moz-transform: scale(1.0);
                -o-transform: scale(1.0);
                -webkit-transition-duration: .3s;
                -moz-transition-duration: .3s;
                -o-transition-duration: .3s
            }

                label.btn:hover {
                    text-shadow: 0 3px 2px rgba(0, 0, 0, 0.4);
                    -webkit-transform: scale(1.1);
                    -moz-transform: scale(1.1);
                    -o-transform: scale(1.1);
                }

            label.btn-block {
                text-align: left;
                position: relative
            }

            label .btn-label {
                position: absolute;
                left: 0;
                top: 0;
                display: inline-block;
                padding: 0 10px;
                background: #49548b;
                height: 100%
            }

            label .glyphicon {
                top: 34%
            }

            .element-animation1 {
                animation: animationFrames ease .8s;
                animation-iteration-count: 1;
                transform-origin: 50% 50%;
                -webkit-animation: animationFrames ease .8s;
                -webkit-animation-iteration-count: 1;
                -webkit-transform-origin: 50% 50%;
                -ms-animation: animationFrames ease .8s;
                -ms-animation-iteration-count: 1;
                -ms-transform-origin: 50% 50%
            }

            .element-animation2 {
                animation: animationFrames ease 1s;
                animation-iteration-count: 1;
                transform-origin: 50% 50%;
                -webkit-animation: animationFrames ease 1s;
                -webkit-animation-iteration-count: 1;
                -webkit-transform-origin: 50% 50%;
                -ms-animation:animationFrames ease 1s;
                -ms-animation-iteration-count: 1;
                -ms-transform-origin: 50% 50%
            }

            .element-animation3 {
                animation: animationFrames ease 1.2s;
                animation-iteration-count: 1;
                transform-origin: 50% 50%;
                -webkit-animation: animationFrames ease 1.2s;
                -webkit-animation-iteration-count: 1;
                -webkit-transform-origin: 50% 50%;
                -ms-animation: animationFrames ease 1.2s;
                -ms-animation-iteration-count: 1;
                -ms-transform-origin: 50% 50%
            }

            .element-animation4 {
                animation: animationFrames ease 1.4s;
                animation-iteration-count: 1;
                transform-origin: 50% 50%;
                -webkit-animation: animationFrames ease 1.4s;
                -webkit-animation-iteration-count: 1;
                -webkit-transform-origin: 50% 50%;
                -ms-animation: animationFrames ease 1.4s;
                -ms-animation-iteration-count: 1;
                -ms-transform-origin: 50% 50%
            }

            @keyframes animationFrames {
                0% {
                    opacity: 0;
                    transform: translate(-1500px, 0px)
                }

                60% {
                    opacity: 1;
                    transform: translate(30px, 0px)
                }

                80% {
                    transform: translate(-10px, 0px)
                }

                100% {
                    opacity: 1;
                    transform: translate(0px, 0px)
                }
            }

            @-webkit-keyframes animationFrames {
                0% {
                    opacity: 0;
                    -webkit-transform: translate(-1500px, 0px)
                }

                60% {
                    opacity: 1;
                    -webkit-transform: translate(30px, 0px)
                }

                80% {
                    -webkit-transform: translate(-10px, 0px)
                }

                100% {
                    opacity: 1;
                    -webkit-transform: translate(0px, 0px)
                }
            }

            .btn-danger {
                color: #fff;
                background-color: #e87c6f;
                border-color: #dc3545;
            }

                .btn-danger:not(:disabled):not(.disabled).active, .btn-danger:not(:disabled):not(.disabled):active, .show > .btn-danger.dropdown-toggle {
                    color: #fff;
                    background-color: #b21f2d;
                    border-color: #b21f2d;
                }

            .modal-header {
                background-color: transparent;
                color: inherit
            }

            label .btn-label {
                position: absolute;
                left: 0;
                top: 0;
                display: inline-block;
                padding: 0 10px;
                background: #b21f2d;
                height: 100%;
            }

            .modal-body {
                min-height: 300px
            }
        </style>
        <div class="">
            <!-- Nav tabs -->
            <ul id="mytabs" class="nav nav-tabs" role="tablist" style="display: none">
            <%--     <li class="active">
                    <a href="#first" role="tab" data-toggle="tab">
                        <icon class="fa fa-home"></icon>
                        First tab
                    </a>
                </li>
                <li><a href="#second" role="tab" data-toggle="tab">
                    <i class="fa fa-user"></i>Second tab
                </a>
                </li>
                <li>
                    <a href="#third" role="tab" data-toggle="tab">
                        <i class="fa fa-envelope"></i>Third tab
                    </a>
                </li>--%>
            </ul>

            <section class="login-block">
                <asp:HiddenField id="HiddenTimmer" runat="server"/>
                 <asp:HiddenField id="HiddenFieldTestId" runat="server"/>
                <asp:HiddenField runat="server" ID="HiddenField2" />
                <asp:HiddenField runat="server" ID="HiddenField3" />
                  <asp:HiddenField runat="server" ID="HiddenFieldQId" />
                  <asp:HiddenField runat="server" ID="HiddenFieldAns" />
                
                <div class="" style="margin-top: -76px;">
                    <div class="row d-flex justify-content-center align-items-center h-100">
                        <div class="col">
                            <div class="card card-registration my-3">
                                <div class="row g-0">
                                    <asp:HiddenField runat="server" ID="HiddenField1" />
                                    <div class="col-xl-12 login-sec">
                                        <div class="card-body p-md-3 text-black" style="margin-top: -67px;">
                                            <div id="app" style="margin-top: 13px;"></div>
                                            <h2 style="margin-top: -80px;" class="text-center"><asp:Label ID="testName" runat="server"></asp:Label> </h2>
                                                      <asp:Button class="btn btn-primary border-success align-items-center btn-success btn" onClick="endExam()">Exit Exam.</asp:Button>
                                            <asp:Button class="btn btn-primary border-success align-items-center btn-success btn" runat="server" id="SubmitEaxm" onClick="SubmitEaxm_Click" style="display: none"/>
                                                                
                                            <div class="" style="margin-bottom: -32px;">
                                                <!-- Tab panes -->
                                                <div class="tab-content" id="Quessions">
                                                    <%--<div class="tab-pane fade active in" id="first">
                                                        <div class="mt-12">
                                                            <div class="d-flex justify-content-center row">
                                                                <div class="col-md-10 col-lg-12">
                                                                    <div class="border">
                                                                        <div class="question bg-white p-3 border-bottom">
                                                                            <div class="d-flex flex-row justify-content-between align-items-center mcq">
                                                                                <h4>MCQ Quiz 1</h4> <h6>Student name: XYZ</h6> <h6>Course type: Python</h6>
                                                                                <span>(5 of 20)</span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="d-flex flex-row align-items-center question-title">
                                                                                    <h3 class="text-danger">Q.</h3>
                                                                                    <h5 class="mt-1 ml-2">Which of sfsfergterertert has largest population?</h5>
                                                                                </div>

                                                                                <div class="col-xs-6 8"></div>
                                                                                <div class="quiz" id="quiz" data-toggle="buttons">
                                                                                    <label class="element-animation1 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="1">HyperText Markup Language asnfasdnkaf dsf,fasf,as faf,afs asf,lasf.</label>
                                                                                    <label class="element-animation2 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="2">HighText Markup Languagejasf kasfnalkasmasf kasmasmf.</label>
                                                                                    <label class="element-animation3 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="3">HyperText Markdown Language asfjkjasfmn.</label>
                                                                                    <label class="element-animation4 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="4">None of the above amsfmasfm asfkamsfkmasf asfmasf asfmsfdamasdf adsfm.</label>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-flex flex-row justify-content-between align-items-center p-3 bg-white">
                                                                            <button class="btn btn-primary d-flex align-items-center  btn prev" href="#" type="button"><i class="fa fa-angle-left mt-1 mr-1"></i>&nbsp;previous</button>
                                                                            <button class="btn btn-primary border-success align-items-center btn-success btn next" href="#" type="button">Next<i class="fa fa-angle-right ml-2"></i></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="second">
                                                        <div class="mt-12">
                                                            <div class="d-flex justify-content-center row">
                                                                <div class="col-md-10 col-lg-12">
                                                                    <div class="border">
                                                                        <div class="question bg-white p-3 border-bottom">
                                                                            <div class="d-flex flex-row justify-content-between align-items-center mcq">
                                                                                <h4>MCQ Quiz 2</h4>
                                                                                <span>(5 of 20)</span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="d-flex flex-row align-items-center question-title">
                                                                                    <h3 class="text-danger">Q.</h3>
                                                                                    <h5 class="mt-1 ml-2">Which of sfsfergterertert has largest population?</h5>
                                                                                </div>

                                                                                <div class="col-xs-6 8"></div>
                                                                                <div class="quiz" id="quiz" data-toggle="buttons">
                                                                                    <label class="element-animation1 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="1">HyperText Markup Language asnfasdnkaf dsf,fasf,as faf,afs asf,lasf.</label>
                                                                                    <label class="element-animation2 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="2">HighText Markup Languagejasf kasfnalkasmasf kasmasmf.</label>
                                                                                    <label class="element-animation3 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="3">HyperText Markdown Language asfjkjasfmn.</label>
                                                                                    <label class="element-animation4 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="4">None of the above amsfmasfm asfkamsfkmasf asfmasf asfmsfdamasdf adsfm.</label>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-flex flex-row justify-content-between align-items-center p-3 bg-white">
                                                                            <button class="btn btn-primary d-flex align-items-center  btn prev" href="#" type="button"><i class="fa fa-angle-left mt-1 mr-1"></i>&nbsp;previous</button>
                                                                            <button class="btn btn-primary border-success align-items-center btn-success btn next" href="#" type="button">Next<i class="fa fa-angle-right ml-2"></i></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="tab-pane fade" id="third">
                                                        <div class="mt-12">
                                                            <div class="d-flex justify-content-center row">
                                                                <div class="col-md-10 col-lg-12">
                                                                    <div class="border">
                                                                        <div class="question bg-white p-3 border-bottom">
                                                                            <div class="d-flex flex-row justify-content-between align-items-center mcq">
                                                                                <h4>MCQ Quiz 2</h4>
                                                                                <span>(5 of 20)</span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-dialog">
                                                                            <div class="modal-content">
                                                                                <div class="d-flex flex-row align-items-center question-title">
                                                                                    <h3 class="text-danger">Q.</h3>
                                                                                    <h5 class="mt-1 ml-2">Which of sfsfergterertert has largest population?</h5>
                                                                                </div>

                                                                                <div class="col-xs-6 8"></div>
                                                                                <div class="quiz" id="quiz" data-toggle="buttons">
                                                                                    <label class="element-animation1 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="1">HyperText Markup Language asnfasdnkaf dsf,fasf,as faf,afs asf,lasf.</label>
                                                                                    <label class="element-animation2 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="2">HighText Markup Languagejasf kasfnalkasmasf kasmasmf.</label>
                                                                                    <label class="element-animation3 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="3">HyperText Markdown Language asfjkjasfmn.</label>
                                                                                    <label class="element-animation4 btn btn-lg btn-danger btn-block">
                                                                                        <span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span>
                                                                                        <input type="radio" name="q_answer" style="visibility: hidden;" value="4">None of the above amsfmasfm asfkamsfkmasf asfmasf asfmsfdamasdf adsfm.</label>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-flex flex-row justify-content-between align-items-center p-3 bg-white">
                                                                            <button class="btn btn-primary d-flex align-items-center  btn prev" href="#" type="button"><i class="fa fa-angle-left mt-1 mr-1"></i>&nbsp;previous</button>
                                                                            <button class="btn btn-primary border-success align-items-center btn-success btn next" href="#" type="button">Next<i class="fa fa-angle-right ml-2"></i></button>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
            <%-- <a class="btn prev" href="#">Previous</a>
            <a class="btn next" href="#">Next</a>--%>
        </div>


        <style>
            /* body {
                font-family: sans-serif;
                display: grid;
                height: 100vh;
                place-items: center;
            }*/

            .base-timer {
                position: relative;
                width: 80px;
                height: 80px;
            }

            .base-timer__svg {
                transform: scaleX(-1);
            }

            .base-timer__circle {
                fill: none;
                stroke: none;
            }

            .base-timer__path-elapsed {
                stroke-width: 7px;
                stroke: grey;
            }

            .base-timer__path-remaining {
                stroke-width: 7px;
                stroke-linecap: round;
                transform: rotate(90deg);
                transform-origin: center;
                transition: 1s linear all;
                fill-rule: nonzero;
                stroke: currentColor;
            }

                .base-timer__path-remaining.green {
                    color: rgb(65, 184, 131);
                }

                .base-timer__path-remaining.orange {
                    color: orange;
                }

                .base-timer__path-remaining.red {
                    color: red;
                }

            .base-timer__label {
                position: absolute;
                width: 80px;
                height: 80px;
                top: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 18px;
            }
        </style>

      <%--  https://stackoverflow.com/questions/63775740/how-to-create-the-easiest-countdown-timer--%>

        <script>
            // Credit: Mateusz Rybczonec
            //window.onblur = function () {
            //   //do some stuff after tab was changed e.g.
            //    alert('You switched the tab');
            
            const FULL_DASH_ARRAY = 283;
            const WARNING_THRESHOLD = 10;
            const ALERT_THRESHOLD = 5;

            const COLOR_CODES = {
                info: {
                    color: "green"
                },
                warning: {
                    color: "orange",
                    threshold: WARNING_THRESHOLD
                },
                alert: {
                    color: "red",
                    threshold: ALERT_THRESHOLD
                }
            };

            const TIME_LIMIT = $("#ContentPlaceHolder3_HiddenTimmer").val();
            let timePassed = 0;
            let timeLeft = TIME_LIMIT;
            let timerInterval = null;
            let remainingPathColor = COLOR_CODES.info.color;

            document.getElementById("app").innerHTML = `
<div class="base-timer">
  <svg class="base-timer__svg" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
    <g class="base-timer__circle">
      <circle class="base-timer__path-elapsed" cx="50" cy="50" r="45"></circle>
      <path
        id="base-timer-path-remaining"
        stroke-dasharray="283"
        class="base-timer__path-remaining ${remainingPathColor}"
        d="
          M 50, 50
          m -45, 0
          a 45,45 0 1,0 90,0
          a 45,45 0 1,0 -90,0
        "
      ></path>
    </g>
  </svg>
  <span id="base-timer-label" class="base-timer__label">${formatTime(
                timeLeft
            )}</span>
</div>
`;

            startTimer();

            function onTimesUp() {
                endExamForcefully();
                clearInterval(timerInterval);
              //  let url = "https://localhost:44331/login.aspx";
              //  window.location.href = url;
              /*  https://stackoverflow.com/questions/5978519/how-can-i-use-setinterval-and-clearinterval*/
            }

            function startTimer() {
                timerInterval = setInterval(() => {
                    timePassed = timePassed += 1;
                    timeLeft = TIME_LIMIT - timePassed;
                    document.getElementById("base-timer-label").innerHTML = formatTime(
                        timeLeft
                    );
                    setCircleDasharray();
                    setRemainingPathColor(timeLeft);

                    if (timeLeft === 0) {
                        onTimesUp();
                    }
                }, 1000);
            }
            //
            /*//https://css-tricks.com/how-to-create-an-animated-countdown-timer-with-html-css-and-javascript/*/
            //
            function formatTime(time) {
                const minutes = Math.floor(time / 60);
                let seconds = time % 60;

                if (seconds < 10) {
                    seconds = `0${seconds}`;
                }

                return `${minutes}:${seconds}`;
            }

            function setRemainingPathColor(timeLeft) {
                const { alert, warning, info } = COLOR_CODES;
                if (timeLeft <= alert.threshold) {
                    document
                        .getElementById("base-timer-path-remaining")
                        .classList.remove(warning.color);
                    document
                        .getElementById("base-timer-path-remaining")
                        .classList.add(alert.color);
                } else if (timeLeft <= warning.threshold) {
                    document
                        .getElementById("base-timer-path-remaining")
                        .classList.remove(info.color);
                    document
                        .getElementById("base-timer-path-remaining")
                        .classList.add(warning.color);
                }
            }

            function calculateTimeFraction() {
                const rawTimeFraction = timeLeft / TIME_LIMIT;
                return rawTimeFraction - (1 / TIME_LIMIT) * (1 - rawTimeFraction);
            }

            function setCircleDasharray() {
                const circleDasharray = `${(
                    calculateTimeFraction() * FULL_DASH_ARRAY
                ).toFixed(0)} 283`;
                document
                    .getElementById("base-timer-path-remaining")
                    .setAttribute("stroke-dasharray", circleDasharray);
            }


            function endExam() {

                if (confirm("Are you sure you want to exit!") == true) {
                    var ans = "";
                    var id = $("#ContentPlaceHolder3_HiddenFieldQId").val();

                    const myArray = id.split(",");
                    for (var i = 0; i < myArray.length; i++) {
                        if ($('input[name=' + myArray[i] + ']:checked').val() == null) {

                            ans = myArray[i] + ":" + "0" + "|" + ans;
                            // alert(0);
                        }
                        else {

                            ans = myArray[i] + ":" + $('input[name=' + myArray[i] + ']:checked').val() + "|" + ans;;

                        }

                    }
                    $("#ContentPlaceHolder3_HiddenFieldAns").val(ans);
                    document.getElementById("ContentPlaceHolder3_SubmitEaxm").click();
                   
                } else {
                    text = "You canceled!";
                }
                
            }

            function endExamForcefully() {

                alert("Times up!!!!!");

                var ans = "";
                var id = $("#ContentPlaceHolder3_HiddenFieldQId").val();

                const myArray = id.split(",");
                for (var i = 0; i < myArray.length; i++) {
                    if ($('input[name=' + myArray[i] + ']:checked').val() == null) {

                        ans = myArray[i] + ":" + "0" + "|" + ans;
                        // alert(0);
                    }
                    else {

                        ans = myArray[i] + ":" + $('input[name=' + myArray[i] + ']:checked').val() + "|" + ans;;

                    }

                }
                $("#ContentPlaceHolder3_HiddenFieldAns").val(ans);
                document.getElementById("ContentPlaceHolder3_SubmitEaxm").click();
               // document.getElementById("ContentPlaceHolder3_SubmitEaxm").click();
                //alert(ans);

            }
        </script>

    </form>
</asp:Content>
