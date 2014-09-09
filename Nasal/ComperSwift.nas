var xoffs = props.globals.getNode("/sim/current-view/x-offset-m", 1);

controls.flapsDown = func(v) {
  if(!v) {
    return interpolate(xoffs);
  }
  v *= 0.25;                                              # max. elongation [m]
  interpolate(xoffs, v, abs(v - xoffs.getValue()) * 1.5); # 1.5 s for full move
}
#--------------------------------------------------------------------
toggle_traj_mkr = func {
  if(getprop("/ai/submodels/trajectory-markers") == nil) {
    setprop("/ai/submodels/trajectory-markers", 0);
  }
  if(getprop("/ai/submodels/trajectory-markers") < 1) {
    setprop("/ai/submodels/trajectory-markers", 1);
  } else {
    setprop("/ai/submodels/trajectory-markers", 0);
  }
}
#--------------------------------------------------------------------
initialise_drop_view_pos = func {
  eyelatdeg = getprop("/position/latitude-deg");
  eyelondeg = getprop("/position/longitude-deg");
  eyealtft = getprop("/position/altitude-ft") + 20;
  setprop("/sim/view[100]/latitude-deg", eyelatdeg);
  setprop("/sim/view[100]/longitude-deg", eyelondeg);
  setprop("/sim/view[100]/altitude-ft", eyealtft);
}
#--------------------------------------------------------------------
update_drop_view_pos = func {
  eyelatdeg = getprop("/position/latitude-deg");
  eyelondeg = getprop("/position/longitude-deg");
  eyealtft = getprop("/position/altitude-ft") + 20;
  interpolate("/sim/view[100]/latitude-deg", eyelatdeg, 5);
  interpolate("/sim/view[100]/longitude-deg", eyelondeg, 5);
  interpolate("/sim/view[100]/altitude-ft", eyealtft, 5);
}
#--------------------------------------------------------------------
start_up = func {
  settimer(initialise_drop_view_pos, 5);
}
#--------------------------------------------------------------------
