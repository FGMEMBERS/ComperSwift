#--------------------------------------------------------------------
toggle_traj_mkr = func {
  if(getprop("ai/submodels/trajectory-markers") < 1) {
    setprop("ai/submodels/trajectory-markers", 1);
  } else {
    setprop("ai/submodels/trajectory-markers", 0);
  }
}
#--------------------------------------------------------------------
initialise_drop_view_pos = func {
  eyelatdeg = getprop("/position/latitude-deg");
  eyelondeg = getprop("/position/longitude-deg");
  eyealtft = getprop("/position/altitude-ft") + 20;
  setprop("/sim/view[6]/latitude-deg", eyelatdeg);
  setprop("/sim/view[6]/longitude-deg", eyelondeg);
  setprop("/sim/view[6]/altitude-ft", eyealtft);
}
#--------------------------------------------------------------------
update_drop_view_pos = func {
  eyelatdeg = getprop("/position/latitude-deg");
  eyelondeg = getprop("/position/longitude-deg");
  eyealtft = getprop("/position/altitude-ft") + 20;
  interpolate("/sim/view[6]/latitude-deg", eyelatdeg, 5);
  interpolate("/sim/view[6]/longitude-deg", eyelondeg, 5);
  interpolate("/sim/view[6]/altitude-ft", eyealtft, 5);
}
#--------------------------------------------------------------------
start_up = func {
  settimer(initialise_drop_view_pos, 5);
}
#--------------------------------------------------------------------
