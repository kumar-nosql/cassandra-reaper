#!/bin/sh
# Copyright 2018-2019 The Last Pickle Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ "false" = "${REAPER_AUTO_SCHEDULING_ENABLED}" ]; then
  exit 0
fi

cat <<EOT >> /etc/cassandra-reaper.yml

autoScheduling:
  enabled: ${REAPER_AUTO_SCHEDULING_ENABLED}
  initialDelayPeriod: ${REAPER_AUTO_SCHEDULING_INITIAL_DELAY_PERIOD}
  periodBetweenPolls: ${REAPER_AUTO_SCHEDULING_PERIOD_BETWEEN_POLLS}
  timeBeforeFirstSchedule: ${REAPER_AUTO_SCHEDULING_TIME_BEFORE_FIRST_SCHEDULE}
  scheduleSpreadPeriod: ${REAPER_AUTO_SCHEDULING_SCHEDULE_SPREAD_PERIOD}
  excludedKeyspaces: ${REAPER_AUTO_SCHEDULING_EXCLUDED_KEYSPACES}
  excludedClusters: ${REAPER_AUTO_SCHEDULING_EXCLUDED_CLUSTERS}

EOT
