#!/bin/sh

### LICENSE // ###
#
# Copyright (c) 2015, Daniel Plominski (Plominski IT Consulting)
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
# list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice, this
# list of conditions and the following disclaimer in the documentation and/or
# other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
# ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
# ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
### // LICENSE ###

### ### ### PLITC // ### ### ###

# cronjob
CHECK1=$(ps -ax | grep -c "ruby dn42-freeland.rb")
if [ "$CHECK1" = "1" ]; then
   killall ruby; pkill ruby
   sleep 2
   cd /home/freeland/github/dn42-freeland; nohup /usr/local/bin/ruby dn42-freeland.rb > log.txt 2>&1 &
   exit 0
fi

# racct violation
RACCT1=$(top -aSPjn | grep "ruby dn42-freeland.rb" | awk '{print $12}' | sed 's/%//' | awk -F  "." '{print $1}' | head -n1)
if [ "$RACCT1" -gt "8" ]; then
   killall ruby; pkill ruby
   sleep 2
   cd /home/freeland/github/dn42-freeland; nohup /usr/local/bin/ruby dn42-freeland.rb > log.txt 2>&1 &
   exit 0
fi

# racct violation
RACCT2=$(top -aSPjn | grep "ruby dn42-freeland.rb" | awk '{print $9}' | sed 's/%//' | head -n1)
if [ "$RACCT2" = "racct" ]; then
   killall ruby; pkill ruby
   sleep 2
   cd /home/freeland/github/dn42-freeland; nohup /usr/local/bin/ruby dn42-freeland.rb > log.txt 2>&1 &
   exit 0
fi

exit 0
### ### ### // PLITC ### ### ###
# EOF
