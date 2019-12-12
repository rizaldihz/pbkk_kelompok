<!--Start of Login Form-->
<div id="quickview-register">
  <!-- Modal -->
  <div class="modal fade" id="register" tabindex="-1" role="dialog" style='background: rgba(0, 0, 0, 0) url("{{url("img/home.jpg")}}") no-repeat scroll center center / cover ;'>
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
                      {{flashSession.output()}}
                      <form method="post" action="{{url('register')}}">
                          <div class="form-box">
                              <input type="text" name="nama" placeholder="Nama" class="mb-14">
                          </div>
                          <div class="form-box box2">
                            <input type="text" name="username" placeholder="Username" class="mb-14">
                              <input type="email" name="email" placeholder="Email">
                          </div>
                          <div class="form-box box2">
                             <input type="password" name="password" placeholder="Password" class="mb-14">
                              <input type="password" name="repassword" placeholder="Ketik Ulang Password" >
                          </div>
                          <div class="form-box">
                            <input type="text" name="telepon" placeholder="Nomor Telepon" class="mb-14">
                          </div>
                          <div class="text-center">
                              <button type="submit" class="text-uppercase">Submit</button>
                          </div>
                      </form>
                  </div>
              </div>  
          </div>  
      </div>
  </div>
</div>
<!--End of Login Form-->