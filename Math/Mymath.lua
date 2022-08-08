---@section Mymath_boilerplate
-- Author: samohtGTO
-- GitHub: https://github.com/samohtGTO
-- Workshop: https://steamcommunity.com/profiles/76561199180960360/myworkshopfiles/?appid=573090
--- Developed using LifeBoatAPI - Stormworks Lua plugin for VSCode - https://code.visualstudio.com/download (search "Stormworks Lua with LifeboatAPI" extension)
--- If you have any issues, please report them here: https://github.com/nameouschangey/STORMWORKS_VSCodeExtension/issues - by Nameous Changey
--- "Require All" file to make life easier on the end-user
---@endsection

require("SamohtAPI.Utils.SACopy")

---@section Mymath 1 Mymathclass
---@class Mymath
SamohtAPI.Mymath = {
  ---@section pid 2 pidclass
  ---@param p number p is portinol gain
  ---@param i number i is intergral gain
  ---@param d number d is derivative gain
  ---@param nm number nm is min or max or both on
  ---@param n number n is min if nm is 2 or 3
  ---@param m number m is max if nm is 1 or 3
  ---@return table pid return constructor
  pid=function(p,i,d,nm,n,m)
    return{p=p,i=i,d=d,nm=nm,n=n,m=m,E=0,D=0,I=0,
    ---@section run
    ---@param sp number the setpoint of the pid
    ---@param pv number the proces variable that needs to go to sp
    ---@return number O O is output 
    run=function(s,sp,pv)
      local E,D,A,O
      local M=math
      E = sp-pv
      D = E-s.E
      A = M.abs(D-s.D)
      s.E = E
      s.D = D
      s.I = A<E and s.I +E*s.i or s.I*0.5
      O =E*s.p +(A<E and s.I or 0) +D*s.d
      if nm==1 then return M.min(O,m)
      elseif nm==2 then return M.max(O,n)
      elseif nm==3 then return M.min(M.max(O,n),m)
      end
      return E*s.p +(A<E and s.I or 0) +D*s.d
    end
    ---@endsection
  } 
  end
  ---@endsection pidclass

}
---@endsection Mymathclass