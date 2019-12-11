<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="{{url('adminlte/dist/img/no-avatar.png')}}" class="img-circle" alt="User Image">
      </div>
      <div class="pull-left info">
        <p>{{session.get('auth').nama}}</p>
        <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
      </div>
    </div>
    <!-- search form -->
    <form action="#" method="get" class="sidebar-form">
      <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="Search...">
        <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
      </div>
    </form>
    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">
      <li class="header">DONASI</li>
      <li>
        <a href="{{url('resipien')}}">
          <i class="fa fa-users"></i> <span>Penerima Donasi</span>
        </a>
      </li>
      <li>
        <a href="{{url('kebutuhan')}}">
          <i class="fa fa-cubes"></i> <span>Kebutuhan Resipien</span>
        </a>
      </li>
      <li>
        <a href="{{url('donasi')}}">
          <i class="fa fa-gift"></i> <span>Donasi</span>
        </a>
      </li>
    </ul>
  </section>
  <!-- /.sidebar -->
</aside>