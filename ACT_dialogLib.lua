--[[
  Name:                           Dialog Library
  Author:                         Activity
  Last Modified On:               25/01/2021
  Dependencies:                   
  Description:
      Provides functions to more easilty script dialog for DCS missions.
  Usage:
  Load dialogLib.lua on mission init, then call functions dl.singleLine() or dl.multiLine()
    singleLine takes single array with dialogID (used for voice file, not yet implemented), duration, frequency and message.
    multiLine takes array containing earlier mentioned arrays, waitTime (time in between lines)
  ]]


dl = {}
dl.freq = 225.25


function dl.singleLine(_args)
    local dialogID = _args[1]
    local dur = _args[2]
    local freq = _args[3]
    local message = _args[4]

    local _controller = Group.getByName("_player"):getController()


    _freqTask = { 
        id = 'SetFrequency', 
        params = { 
          frequency = dl.freq * 1000000, 
          modulation = 0, 
        } 
      }

    local _transmitTask = { 
        id = 'TransmitMessage', 
        params = {
          duration = dur,
          subtitle = message,
          loop = false,
          file = "l10n/DEFAULT/test.ogg",
        } 
      }
    
    _controller:setCommand(_freqTask)
    _controller:setCommand(_transmitTask)
end

function dl.multiLine(array, waitTime)
  _timer = 0
  timer.scheduleFunction(dl.singleLine, array[1], timer.getTime() + 1 )
  for i = 2, #array do
        local _args = array[i]
        local _argsOld = array[i-1]
        _timer = _timer + _argsOld[2] + waitTime
        timer.scheduleFunction(dl.singleLine, _args, timer.getTime() + _timer )
        i = i + 1
    end
end

