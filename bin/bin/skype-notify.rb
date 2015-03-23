#!/usr/bin/env ruby

# Super simple script to send a notify-osd notification and play a sound when
# skype messages contain my name.
#
# Add the following to the "Execute the following script:" field for the
# "Chat Message Received" notification type:
# ~/bin/skype-notify.rb "%type %sname %smessage %sskype"

message = ARGV[0]

if message !~ /ChatOutgoing/ && message =~/(ryan|r-man)/i
  `notify-send --icon=/usr/share/skype/avatars/Skype.png '#{ARGV[0]}'`
  `aplay /usr/share/skype/sounds/ChatIncoming.wav`
end

