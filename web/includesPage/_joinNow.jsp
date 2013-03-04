<script type ="text/javascript" src="js/headerJoinScript.js"></script>
<div id = "topWrapper">
    <div class="container_16">
        <div class="grid_16">
            <div id="logo" class="grid_6"> <a href="index.jsp"><img src="images/logo/icon.png" /></a>
            </div>
            <div class="grid_6" id="top">
                <ul>
                    <a href="#" id="join"><li id="greenBtn"  class ="Btn showForm">Join Now!!</li></a>
                </ul>
            </div>
        </div>
    </div>
</div>

<div id = "topLogin">
    <div class="container_16">
        <div id="LoginBox" class="grid_16">

            <div class="grid_6" id = "loginForm">
                <form method="post" action="loginServlet"  name="login">
                    <table>
                        <tr>
                            <td colspan="2">
                                <strong><h1 style="font-wieght:bold; text-align:left; padding:20px 0px; color:#FFF;">Login...</h1></strong>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="text" name="email" placeholder="john_lee@xyz.com" /><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password</label>
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr><tr>
                            <td>

                            </td>
                            <td>
                                <input type="submit" value="Login!!" id="greenBtn" /><br/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="grid_6 push_2" id = "RegisterForm">
                <form method="POST" action="register" name="registerServlet">
                    <table>
                        <tr>
                            <td colspan="2">
                                <strong><h1 style="font-wieght:bold; text-align:right; padding:20px 0px; color:#FFF;">Register Now!!</h1></strong>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="text" name="emailReg" placeholder="john_lee@xyz.com" /><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password</label>
                            </td>
                            <td>
                                <input type="password" name="passReg" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password Again</label>
                            </td>
                            <td>
                                <input type="password" name="passAgainReg" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr>
                        <!--	<tr>
                                        <td>
                                        <label>Gender</label>
                                        </td>
                                        <td>
                                        <select>
                                                <option name="gender" value="male">Male</option>
                                                <option name="gender" value="female">Female</option>
                                        </select><br/>
                                        </td>
                                </tr>-->

                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="submit" value="Register" id="greenBtn" /><br/>
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>
    </div>
</div>