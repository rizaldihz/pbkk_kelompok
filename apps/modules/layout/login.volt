<!--Start of Login Form-->
<div id="quickview-login">
  <!-- Modal -->
  <div class="modal fade" id="productModal" tabindex="-1" role="dialog" style='background: rgba(0, 0, 0, 0) url("{{url("img/home.jpg")}}") no-repeat scroll center center / cover ;'>
      <div class="modal-dialog" role="document">
          <div class="modal-content">
              <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="zmdi zmdi-close"></i></span></button>
              </div>
              <div class="modal-body">
                  <div class="form-pop-up-content ptb-60 pl-60 pr-60">
                      <div class="area-title text-center mb-43">
                          <h1>CampTour</h1>
                      </div>
                      <form method="post" action="{{url('login')}}">
                          <div class="form-box">
                              <input type="text" name="username" placeholder="Username" class="mb-14">
                              <input type="password" name="password" placeholder="Password">
                          </div>
                          <div class="fix ptb-30">
                              <span class="remember pull-left"><input class="p-0 pull-left" type="checkbox">Remember Me</span>
                              <span class="pull-right"><a href="#">Forget Password?</a></span>
                          </div>
                          <div class="text-center">
                              <button type="submit" class="text-uppercase">Login</button>
                          </div>
                      </form>
                  </div>
              </div>  
          </div>  
      </div>
  </div>
</div>
<!--End of Login Form-->