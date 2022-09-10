Version 6.2.0?
=============
glogger: new error message type: MSGSET_QUEUE_ALARM
logcenter: configurable restart of yuneta on queue alarms
fix error in pty_sync_spawn()

Version 6.1.0
=============
DANGER gobj_publish_event() return sent events instead of sum of event returns
Remove all -> return gobj_publish_event(); by gobj_publish_event(); return;
Document gobj_publish_event process.
__own_event__ subscription flag, to own the event

Version 6.0.1
=============
ycommand: comment at the end
email alert: add owner
logcenter: add owner to summary
tcp0/tcp1: log write fails
c_yuno: call gobj_set_deep_tracing() only if "deep_trace" is true
DANGER: tcp0/tcp1: set same logical (do_close) in write fails like read fails
tcp0/tcp1: make "Broken pipe" as info (writing failing)

Version 6.0.0
=============
release 6.0.0 ready, reliable managing of  persistent queues.
Set error UV_ETIMEDOUT as log_info("Timeout keep-alive")
Set message "ALERTA Encolamiento" in attributes as "alert_message"

Version 5.12.4
==============
Tcp: read FAILED: seems like already disconnected
cli: comment at the end
Tcp0,Tcp1 changed flow of do_close/set_disconnected

Version 5.12.3
==============
fix typo gcflag_no_check_ouput_events by gcflag_no_check_output_events
fix gcflag_ignore_unkwnow_attrs typo

Version 5.12.2
==============
c_agent: save yuno.pid in same directory as c_yuno
emailsender: "disable_alarm_emails" persistent attr and command
c_qiogate: reviewed with a big testing, same behaviour as georeverse

Version 5.12.1
==============
set events/states in tcp0 like tcp1, admit EV_DROP in WAIT_CONNECTED/WAIT_DISCONNECTED
add event EV_DISCONNECTED to ST_DISCONNECTED state, collateral of above change?
ystats/ycommand add option to print with metadata (now default is without metadata)

Version 5.12.0
==============
tag version

Version 5.11.4
==============
MQIOGate new commands, new methods to distribute
command-yuno option recursive: find the command in childs too
agent: include required_services in configuration, increase to 300 clients
emailsender: increase to 300 clients
yuneta_environment:new yuneta_bin_file() yuneta_bin_dir()
agent: save_pid_in_file() moved to c_yuno.c
entry_point: increase temporal environment memory
quita audit a agent22
quita emailsender del yshutdown no_kill_system, tiene fallos internos
qiogate: drop_on_timeout_ack == 2 exit(-1)
log ALERTA Encolamiento
restaura save_pid_in_file() en yuneta_agent, quitalo cuando entre la 5.11.4 en los yunos
tcp0/1 don't return on "uv_req_write ALREADY ACTIVE"

Version 5.11.3
==============
sync c_connex.c/c_connexs.c
fix yuno_cli hgobj null when exiting
put date in ALERTA email

Version 5.11.2
==============
Qiogate: command to trace on/off queue protocol
deep_trace level: 1 sin timers, 2 con todo
Connex: force drop destroying bottom gobj

Version 5.11.1
==============
Faltaba el pull de windows

Version 5.11.0
==============
external_libs/ghelpers/ginsfsm adapted to windows

Cleaning #includes
regex hxspencer repository cloned

Version 5.10.0
==============
Fixing regression
La versión anterior falla en sfs

Version 5.9.3
=============
Change regex.h by pcre2

Version 5.9.2
=============
bin2hex() char -> uint8_t
tranger_list,tranger_delete,tranger_migrate,tranger_search,trmsg_list
    Examples TIME:\n  1.seconds (minutes,hours,days,weeks,months,years)
review 11_time_helper2.c
yshutdown: add option to not kill logcenter/emailsender

A lot of changes to adapt to cygwin64 in windows

Version 5.9.1
=============
Add to ycommand EV_MT_STATS_ANSWER
add rx stats to qiogate
agent: incr pid field to 6 char
c_qiogate: add tranger_database in ALERT
agent: build_role_plus_id() to build yuno_private_domain
gobj: new gobj_yuno_role_plus_id()

Version 5.9.0
=============
fix regression in --print-role

Version 5.8.10
==============
reduce ack timeout of qiogate to 10 seconds

Version 5.8.9
=============
fix yuneta_agent22

Version 5.8.8
=============
new yuneta_agent22 to backup of yunetacontrol

Version 5.8.7
=============
danger functions time_in_seconds() time_in_miliseconds() etc from int64_t to uint64_t

Version 5.8.6
=============
add "id" to yunos

Version 5.8.5
=============
yuneta_agent: fix if yuneta_agent is running exit.

Version 5.8.4
=============
review (few) c_qiogate
improve c_mqiogate, make method and key configurable
add running-keys2 to yuneta_agent

Version 5.8.3
=============
upgrade to openssl-1.1.1o
fix modbus multiplier as real

Version 5.8.1
=============
new utility: yclone-project
remove cmake_minimum_required(VERSION 2.8) from all projects
set again cmake_minimum_required(VERSION 3.0) to all projects
Fix modbus rtu

Version 5.8.0
=============
refactoring of gobj_resource/c_resource2

Version 5.6.2
=============
remove `no_autostart` attribute in json configs, not used
remove level trace when not exist
new api ginsfsm: gobj_write_strn_attr()
new api ginsfsm: gobj_reset_volatil_attrs()
new api sdata: sdata_write_default_values()

Version 5.6.1
=============
extractjson: better examples in line doc
new global trace level: "states" show when a state change and the event
IEvent_srv: improve error message

Version 5.6.0
=============
Fix info-gclass-trace when passing a gobj
New global method: mt_state_changed(gobj, kw):
    If this method is defined then the __EV_STATE_CHANGED__ will not published
    kw: {
        "previous_state": "",
        "current_state": ""
    }
change mt_future24/mt_authorization_parser by mt_state_changed"

Version 5.5.2
=============
canbus0 'put poll_start later, reading can be quick'

Version 5.5.1
=============
Improve log message of trace gclass/gobj not found
c_yuno: remove gclass or gobj not found from level traces
new utitility: extractjson
new stream_json_filename_parser2() can work with lists [] too instead of dict {}.

Version 5.5.0
=============
Make Canbus0 compatible with Connex
DANGER _create_tree() now is public as gobj_create_tree0()
Connex: change to state ST_WAIT_CONNECTED now is internal

Version 5.4.7
=============
fix a strange memory lost error in prot_modbus_master
Add msg2 with unicode symbols to MSGSET_CONNECT_DISCONNECT group log messages

Version 5.4.6
=============
change "new_state"/"last_state" by "current_state"/"previous_state"
fix gobj_change_state()

Version 5.4.5
=============
Don't trace play/pause on start_stop level if gclass it's is_machine_not_tracing (too much noise)

Version 5.4.4
=============
Fix system event

Version 5.4.3
=============
gobj_stop_services must be call gobj_stop_tree always

Version 5.4.2
=============
fix system event

Version 5.4.1
=============
Fix publishing "__EV_STATE_CHANGED__", only when destine has in their input list

Version 5.4.0
=============
New: global events: the first is "__EV_STATE_CHANGED__"
Remove gobj_output_event_list()
New api: gobj_last_state()

Version 5.3.1
=============
Elimino, no se ve bien en yuno_cli (ncurses)
    "Connected" -> "Connected🔵"
    "Disconnected" -> "Disconnected🔴"
    "Connecting..." -> "Connecting...🔜"

Version 5.3.0
=============
"Connected" -> "Connected🔵"
"Disconnected" -> "Disconnected🔴"
"Connecting..." -> "Connecting...🔜"

Version 5.2.9
=============
Log modbus timeout
GOBJ new api gobj_write_new_json_attr()
ycommand/yuneta use ^^ as alternative to $$
ycommand work well with ^^

Version 5.2.8
=============
IOGate: add stats opened (channels opened)
Prot_modbus_master: add queue to request writes

Version 5.2.7
=============
js-core: kw_get_* with verbose option

Version 5.2.6
=============
js-core: kw_get_int, kw_get_real, kw_get_str refactoring
Prot_modbus_master: cmd set-poll-timeout
gobj: new global trace: subscriptions2, trace send events of publish

Version 5.2.5
=============
New yuno command: reset-all-traces

Version 5.2.4
=============
Connex: table of commands: list-urls, add-url, remove-url (gobj must be persistent to save attrs)

Version 5.2.3
=============
list-channels moved from iogate to yuno
new gobj api: list_gclass_gobjs(), list with child gobj's with gclass_name gclass
gobj2json: limit only to public attrs
yuno: new command: list-channels

Version 5.2.2
=============
yuno command "services": add id
fix deep trace
agent: remove bracket_paste_mode escape sequence of c_pty

Version 5.2.1
=============
Fix infinite loop of controlcenter

Version 5.2.0
=============
controlcenter: show `hostname` in addition
Does public the expand_command() api (13_command_parser.h)

Version 5.1.6
=============
Fix watchfs: remove chdir(path)
web-skeletons: use relative path (./static)
yuno_cli: shortkeys with input variables $

Version 5.1.5
=============
fix Prot_modbus_master

Version 5.1.4
=============
canbus0, don't stop when write return -1

Version 5.1.2
=============
fix ystats connection
enable ystats to execute commands

Version 5.1.1
=============
add character_device attribute to Connex, to work with character devices as /dev/ttyUSB0
logger in stdout with color
use gobj as gobj_name in commands of __yuno__
use gclass as gclass_name in commands of __yuno_
c_timer and c_connex improved

Version 5.1.0
=============
Remove removing skeletons in cmake installing
Add c-iot project, new library to hold gps,modbus,canbus,etc

New gclass: Prot_gps

Version 5.0.8
=============
__deep_trace__ as attribute, new api: gobj_get_deep_tracing()
disable brotlin in curl
putenv("TERM=linux") in c_pty.c

Version 5.0.7
=============
add JANSSON_ATTRS((format(printf, )) to gbuf_printf/gbuf_vprintf
fix warnings gbuf_printf
emailsender: fix counters; add messages trace

Version 5.0.6
=============
Add canbus dependencies
New gclass canbus0, prot_canopen
Put __yuneta_version__ in all core yunos

Version 5.0.5
=============
fix open-console cx/cy

Version 5.0.4
=============
fix ac_read_file in ycommand
add launch_id field to agent treedb
add util library
pty_sync_spawn() to 11_run_command.c from ghelpers. Add util lib to CMakeLists files

Version 5.0.2
=============
fix permission "read" in c_node
add cmd users to c_authz
ginsfsm: fix some errors

Version 5.0.1
=============
ginsfsm: add global trace authzs
ginsfsm: new api gobj_services()
WARNING refactoring of all functions with (, const char *fmt, ...)

Version 5.0.0
=============
agent: increase size of columns
ghelpers: LOG_HND_OPT_DEEP_TRACE
ginsfsm: new api: gobj_set_deep_tracing()
c-core: remove running_as_daemon(), add deep_tracing()
yuno: new command: cmd_set_deep_trace()
remote console OK through controlcenter

Version 4.22.1
==============
FIX register/find public services in agent

Version 4.22.0
==============
Logcenter Summary: send yuneta version
cli: No pases escapes ni utf8
ncurses: add version 6.3

Version 4.21.0
==============
Agent: pty pseudoterminal, only working in ycommand
Agent: uuid command (uuid of node)
GHelpers: new api: kw_size()
Ginsfsm: new api: gobj_nearest_top_unique()
yuno_cli: fix: name of IEvent_cli unique duplicated
logcenter: add yuneta version in summary log.

Version 4.20.6
==============
Warning "Using non-local ip WITHOUT TLS"
delete range_port from deploy json files
ytls: remove required from library: default "openssl"
ghelpers: remove host2ip(), using a obsolete gethostnyname() and really did not convert to numeric ip
c_prot_http_srv: timer start is manual
fix c_prot_modbus_master
ginsfsm: new api: gobj_is_imminent_destroy(), gobj_set_imminent_destroy(), gobj_destroy_named_tree()

Version 4.20.5
==============
WARNING agent/realms: range_port/last_port removed from realms, now it's in agent as attribute.
    !!!agent treedb must be removed!!!
treedb: cmd_get_node fix id

Version 4.20.4
==============
Fix c_serial.h
Upgrade to nginx-1.20.1
Short the postgres error message
WARNING: agent: public services are for all realms.

Version 4.20.3
==============
Fix postgres
New api: gobj_is_destroying()

Version 4.20.2
==============
Postgres: add more stats and logs
gobj: gobj_send_event(): don't send if obflag_destroying
Task: end_task will end with result values:
        0 (task ok),
        -1 (task error by some action),
        -2 (timeout of some action)

Refactoring postgres and tasks


Version 4.20.1
==============
Postgres: add command "view-channels"
Postgres: fix crash when postgres disconnect

Version 4.20.0
==============
Include Prot_modbus_master and Serial gclass

Version 4.19.4
==============
kw_get_int() with KW_WILD_NUMBER use strtoll() with base 0: parse done by strtoll
fix istream_clear(): check null

Version 4.19.3
==============
new api: nice_size()
add library m to all projects (by use of math in nice_size)

Version 4.19.2
==============
DANGER Connex: remove hard creating of bottom as tcp0: only if bottom is not set
DANGER Connexs: remove hard creating of bottom as tcp0: only if bottom is not set
DANGER Connex,Connexs: creating of implicit Tcp0 move from mt_create to mt_start
add SDF_STATS to 'connected' attr
DANGER Connex,Connexs: urls/timeout_waiting_connected/timeout_between_connections/timeout_inactivity change to SDF_WR|SDF_PERSIST

Version 4.19.1
==============
fix yuno_cli authentite command.

Version 4.19.0
==============
DANGER se habilita el comando spawn. Back door. Yuneta no puede ser sudo o root.
Acceso local por usuario local yuneta o grupo de yuneta.
Acceso remoto por jwt.


Version 4.18.3
==============
Prot_header4: set max_pkt_size to gbmem_get_maximum_block();
controlcenter: filter kw to command2agent
remove "client_id" attribute
in yuno_cli filter in the history all commands with passw word

Version 4.18.2
==============
logcenter: inform of node_uuid

Version 4.18.1
==============
treedb: set wild conversion to real and integer by default but with warning

Version 4.18.0
==============
WARNING recompila: libunwind updated.
calculate node uuid: use /proc/cpuinfo if it has serial number (rapsberry), else use uuid of disk.

Version 4.17.5
==============
node_uuid() get uuid of disk partition more old

Version 4.17.3
==============
add to dba_postgres more log size
Authz - don't check iat field of jwt (verify.iat=skip)

Version 4.17.2
==============
Postgres gclass is now an Object with __queries_in_queue__
    If in the query there is `dst` then use it to use gobj_send_event()
    else use gobj_publish_event()

Version 4.17.1
==============
dba_posgres: se crea automaticamente el campo en las tablas: ``__created_at__``

Version 4.17.0
==============
WARNING Need recompila
external-libs: upgraded to pcre2-10.37 and OpenSSL_1_1_1l
fix problem in Task gclass.

Version 4.16.1
==============
change realm_name by realm_role
add cmds list-size and list-queues to postgres gclass

Version 4.16.0
==============
task_authentication does the logout

Version 4.15.9
==============
ycommand,ytests,ystats,ybatch with Oauth2 authenticacion

WARNING c_postgres change 'opened' by 'connected'; c_task change 'opened' by 'connected'

Version 4.15.8
==============
Add ON_ID_NAK event

Version 4.15.7
==============
controlcenter funcionando desde el agente y con conexión directa
WARNING agent: cambio gobj_child_by_name(gobj, "__input_side__", 0) por gobj_find_service("__input_side__", TRUE)

Version 4.15.6
==============
Re-Fix: json config lines with more of 1024 chars failed.
add 'ping' command to agent.


Version 4.15.5
==============

Fix: json config lines with more of 1024 chars failed.

Version 4.15.4
==============
HACK: Update liboauth2 version. (recompila!)

Mejoradas las task de keycloak para crear keycloaks y offline tokens.

Protect sys.machine and change _ by -

HACK: full url of agent yunetacontrol: (^^__sys_machine__^^).(^^__node_owner__^^).(^^__output_url__^^)

Warning node_owner empty in agent. The yuneta_agent.json file must contains::

    "environment": {
        "node_owner": "some owner node name"
    },


new api ginsfsm: gobj_set_node_owner()

Version 4.15.3
==============
Add command global-variables to __yuno__
Fix owner_node

Version 4.15.2
==============
cli - print data of command answer when it's a string
change of #ifndef by #pragma once in all .h files

Version 4.15.1
==============
ycommand -i interactive use the same history file (history.txt) as cli
iogate - fix send iogate ac_send_iev

Version 4.15.0
==============
logcenter: inform each 24hours about low free disk/mem
__yuno__ command "write_str" let empty strings (value='')
Quito list_persistent_attrs del agente.

WARNING Persistent attrs now can be save/remove individually
    gobj_save_persistent_attrs(hgobj gobj, json_t *attrs)
    gobj_remove_persistent_attrs(hgobj gobj, json_t *attrs)

    attrs can be a string, a list of keys, or a dict with the keys to save/delete
    if attrs is empty save/remove all attrs

Version 4.14.0
==============

A new feature: node owner, the owner of a (prod/staging/test/dev) node governed by a yuneta agent

Global variables::

    __node_owner__

New Api::

    node_ower = gobj_node_owner()

In the agent configuration __yuneta_agent.json__ ::

    "yuno": {
        "node_owner": "mulesol."        <-- WARNING see the point!
    },

The output url where the agent will connect is (see the only one point) ::

    (^^__node_owner__^^)(^^__sys_machine__^^).(^^__output_url__^^)'


For example (see that the first point belongs to __node_owner__ variable ::

    "mulesol.x86-64.yunetacontrol.com"



Version 4.13.3
==============
ycommand now is interactive.
IEvent_cli now with remote bash __spawn__
history of ycommand in history2.txt

Version 4.13.2
==============

Bad tag 4.13.1, publish 4.13.2

Version 4.13.1
==============

logcenter:inform of low disk always


Version 4.13.0
==============
NOOOO, fallo generalizado, revierto:
    WARNING gcflag_manual_start used in gobj_stop_tree() too: stop must be manual
Add uname info to __yuno__

IOGate, add send_type; now you can send to all destinations

Websocket as pipe item.

uuid in environment

agent __output_side__ to yunetacontrol

Version 4.12.2
==============
c_task: add exec_timeout to tasks, add result in stop message
add __username__ to gss-upd-s0
dba_postgres: admit str as string, int as integer, bool as boolean
trq_msg_rowid - protect against null
new c_prot_http_srv and c_prot_http_cli

Version 4.12.1
==============
Shortcut: #define str2json legalstring2json"
Add certs to agent, now in /yuneta/agent/certs/
Add in recompila.sh file yuneta-pull-from-github.sh to ~/bin/

Version 4.12.0
==============
c_iogate: miss kw_incref, lost memory
DANGER tcps allowed_ips, tcp destroy if volatil
new api ghelpers: trq_size_by_key

Version 4.11.1
==============
remove tranger from tasks
update libuv to 1.41.0

Version 4.11.0
==============
dba_postgres ok, first version
dbsimple2: implement dbattrs_remove_persistent()
ybatch: add color
c_iogate: fix lost memory
c-core: remove old code
c_qiogate: alert queue size configurable; enqueue msg with metadata is configurable
ginsfsm: new api gobj_set_volatil()
remove RESOURCE_WEBIX_SCHEMA from resource.h

Version 4.10.16
===============
fix openssl
Add c-postgres project
Create yuno dba_postgres

Version 4.10.14
===============
Yuneta agent: add 'check-realm' command to test if a realm exists

Version 4.10.13
===============
make commands of authz

Version 4.10.12
===============
authz inform of new user login EV_AUTHZ_USER_NOT_AUTHORIZED
cmd list-persistent-attrs with gobj_name
new cmd remove-persistent-attrs
change api dbsimple2/dbsimple used in persistent attrs. TODO: migrate to treedb

Version 4.10.11
===============
add new api kwid_walk_childs
fix mt_update_node, create option if node exists then it's and update
authz: add EV_ADD_USER event and 'time' field to schema

Version 4.10.10
===============
authz - permission field not required
dejo a mxgraph con su versión, desacoplado de yuneta

Version 4.10.9
==============
c_authz: use empty_string, better error message
ginsfsm: iev_create2() for hide use of __temp__ __channel__

Version 4.10.6
==============
fix yuno_multiple

Version 4.10.6
==============
WARNING agent: change disabled->yuno_disabled, multiple->yuno_multiple

Version 4.10.5
==============
add events to authzs gclass: EV_AUTHZS_USER_LOGIN,EV_AUTHZS_USER_LOGOUT,EV_REJECT_USER
parse schemas in authz and agent

Version 4.10.4
==============
wstats_add_value: return error and don't log too much log
treedb: new api parse_schema()
Updated to Openssl 1.1.1j

Version 4.10.3
==============
Fix mt_node_tree
Fix pkey2s


Version 4.10.2
==============
Fix build_new_treedb_schema() c_treedb
Command parser: use nonlegalfile2json()


Version 4.10.1
==============
c_authz move to common directory, add permissions
records rowid can be clone in graph
export-db don't export ids aka rowid
WARNING treedb_topic_pkey2s_filter: add pkey2 to filter only if it's not empty string
c_treedb: create-topic and delete-topic new commands

Version 4.9.10
==============
WARNING many changes, see commits
changed mt_future60 by mt_node_tree
changed topic_pkeys2 by pkey2s
agent,gobj: fix play true although play return error.
31_tr_treedb.c: prepare the future, use topic_name or id in topic schema

js: ac_toggle, ac_show and ac_hide return isVisible()
cambia menú principal yuno_gui a tree

Version 4.9.9
=============
'Add "expand_childs" option in jtree and all functions using node_collapsed_view(), i.e fkey,hook options'

Version 4.9.8
=============
stats reviewed
jtree cmd

Version 4.9.7
=============
new gobj api: gobj_topic_jtree

Version 4.9.6
=============
31_tr_treedb.c: protect against null, fix hook string type
Treedb: add enum type "time" "color"
ginsfsm: '"bottom_gobj already set" as warning instead of error'
c_tranger: low level service: tranger must be mt_create method instead of mt_start.
jsoneditor: fields 'time' as time
trash button in formatable configurable

Version 4.9.5
=============
Fix pipe inheritance

Version 4.9.4
=============
Fix pipe inheritance

Version 4.9.3
=============
Pipe inheritance: Node -> Tranger
Pipe inheritance: Treedb -> Node
WARNING efecto colateral? gobj bottom start/stop automaticamente

Version 4.9.2
=============
New utility: ytests

Version 4.9.1
=============
Fix nodes

Version 4.9.0
=============
Elimina "content" de los comandos de Node, solo content64 y record

Version 4.8.10
==============
New gclass: Treedb, Management of treedb's
Fix username in IEvent_cli

Version 4.8.9
=============
Fix errors of __username__

Version 4.8.8
=============
Permissions ENABLED!

gobj_node_childs() reviewed

Fix error "Parameter Error" "x":
    Node: update-node get bool with KW_WILD_NUMBER

Authzs - Add permission/parameters fields to treedb_authzs

Version 4.8.7
=============
Agent: fix treedb_name, use name of treedb schema ("treedb_yuneta_agent")
Agent: Add the role "manage-yuneta-agent"

Version 4.8.6
=============
Add _geometry field to all agent topics
gui access to any treedb

Version 4.8.5
=============
WARNING this version require to delete treedb of agent!! Reinstall!
Change yuneta_agent schema
__root__ services, add gclass_name parameter

Version 4.8.4
=============
Disable list type [] for hook fields
identity card can use 'required_services', that service roles will be added to authsz if user has.
Add "cause" in "Authentication rejected" message.

Version 4.8.3
=============
WARNING this version require to delete treedb of agent!! Reinstall!

Version 4.8.1
=============
Authz modified, check destination service.


Version 4.8.0
=============
DANGER refactoring fkey/hook options

Version 4.7.9
=============
DANGER refactoring fkey/hook options

Version 4.7.8
=============
hook-fkeys options: change list-dict by list_dict and only-id by only_id: compatible with js

variables
Version 4.7.7
=============
API gobj_link_nodes/gobj_unlink_nodes changed, must include names of topics

Version 4.7.6
=============
change fkey,hook option "no-metadata" to "with_metadata"
treedb: fields with prefix "__" are considered metadata and no visible in node_collapsed_view()
_sessions renamed to __sessions

Version 4.7.5
=============
fix options in cmd_delete_node

Version 4.7.4
=============
Fix update treedb metadata in treedb_save_node
More debug info in subscriptions

Version 4.7.3
=============
add EV_TREEDB_NODE_CREATED event to treedb
agent using snaps of c_node
treedb: system topic changed: user_data by properties
treedb: treedb_save_node: update __md_treedb__


Version 4.7.2
=============
fix inherited field treedb

Version 4.7.1
=============
new command in c_tranger: check-json
fix commands in c_node

Version 4.7.0
=============
Se añade el field user_data (blob) al schema básico

Version 4.6.11
==============
Los campos nuevos en treedb si eran blob no se creaban.

Version 4.6.10
==============
Fix treedb delete node
if-resource-exists in string instead of numbers

Version 4.6.9
=============
c_authz liboauth2 - It seems required to used cache in liboauth2
c-tls - Add oauth2.conf, the only documentation found about liboauth2

Version 4.6.8
=============
c_ievent_srv.c - fix timeout when authenticacion rejected
c_yuno - fix set gclass level traces
c_authz - set right options to oauth2
Update liboauth2-1.4.0.1, NEED recompila!

Version 4.6.7
=============
Fix "Working without authentication" can't return -1 because deny access.
WARNING fkey,hook default option is "refs"

Version 4.6.6
=============
WARNING "Working without authentication" return -1, avoid access
Fix treedb error

Version 4.6.5
=============
GObj: to debug change json2str by log_debug_json.
GObj: add all global variables to gobj_write_json_parameters().
Authz: change field name role_ids by roles
Treedb Schemas must have treedb prefix, to avoid conflicts of names
Reordena paths store: misma regla para todos:

    /yuneta/realms/owner/realm_id/xxx           datos LOCALES que se pueden borrar
    /yuneta/store/service/owner/realm_id/xxx    datos GLOBALES que hay que conservar.

    Creado el api yuneta_realm_store_dir() para obtener automaticamente el directorio GLOBAL
    OJO desaparece el attribute 'company' de los yunos con servicio

Corrige realm_dir y domain_dir a los yunos de utilidades, para que sus logs estén organizados.

Version 4.6.4
=============
logcenter bind to 127.0.0.1
realm_id to environment
set realm_id to agent: agent.yunetacontrol.com
change authz treedb, only roles/users topics.

Version 4.6.3
=============
Change path of realms data, more simple.

Version 4.6.2
=============
Logcenter - domain_dir fixed 'domain_dir': 'realms/agent/logcenter'
Logcenter - exit if bind ip fails
Directorio de logs de logcenter en /logs en vez de /data
logcenter with more information in some msg.

Version 4.6.1
=============
Fix disable-yuno in agent
Add description to snaps
Add dir-local-data command to agent

Version 4.6.0
=============
Refactorizado treedb y agente

Version 4.5.0
=============
Rename yuno_alias to yuno_tag
Refactoring realms authz

Version 4.4.1
=============
simpledb2 for persistent attrs, make startup function idempotent and return the tranger handler.

Version 4.4.0
=============
fix methods of gclass with authz methods
c_authz to c-core instead of c-tls


Version 4.3.3
=============
c_yuno      - remove set_user_traces() from mt_create, only in mt_start
c_agent     - add set-multiple command and improve messages
agent: add more info of realm to yuno

Version 4.3.2
=============
fix load persistent attrs
tranger open as not master is __timeranger__.json is locked.


Version 4.3.1
=============
Restore yuneta directories, many incompatibilities
Persistent attributes with tranger

Version 4.3.0
=============
Add authorization.
yuneta directories changed


Version 4.2.28
==============
Change all node functions to admit source gobj and let apply permissions
Update agent and fichador, the two yunos using treedb

Version 4.2.27
==============
Add permissions

Version 4.2.26
==============
timeranger      - new tranger_delete()
ghelpers        - new split3() to include empty strings
treedb,tranger  - DANGER, fix keys oversize
c-core          - new gclass c_tranger

Version 4.2.25
==============

Version 4.2.24
==============

ginsfsm         - Global trace of __yuno__ loaded before it starts.
                - Add to json __json_config_variables__ the next global variables:
                    __realm_name__
                    __yuno_role__
                    __yuno_name__
                    __yuno_tag__
                    __yuno_role_plus_name__


Version 4.2.23
==============
ginsfsm         - DANGER: gobj_register_gclass() insert instead of add,
                now the last gclass registered is the first returnn in gobj_find_gclass()
                - remove verbose option in treedb create-node, update-node
c-core          - Danger, connections by IEvent_srv to require dst_role,
                and authentication to call commands and stats
                - Danger, connections by IEvent_srv, dst_name not required
                - Add c_mqiogate.c to c-core

Version 4.2.22
==============
c_ievent_src    - IEvent clisrv connections must be authenticated to do commands and stats


Version 4.2.20
==============
ghelpers        - Treedb: field 'required' can be null
                - Treedb schema, mark as writable the fields to be modified externally.
yscapec         - new utitility, to convert file to escaped c string

Version 4.2.19
==============
ytls,c-tls      - Add "trace" attribute to Tcp_S1 gclass: to set openssl handshake trace
                  Example command:
                    command-yuno id=1800 service=__root__ command=write-bool gobj_name=server_port attribute=trace value=1


Version 4.2.18
==============
time2date       - without argument print now time
treedb          - add fillspace field

Version 4.2.17
==============
ghelpers        - new API kw_find_path(): find on lists and dicts
c-core          - c_yuno.c: cmd_2key_get_value() working with path
                            new api: cmd_2key_get_subvalue()
agent           - gobj_2key_register("tranger", "agent", priv->tranger);
all             - fix gbuf2json() verbose

Version 4.2.16
==============
WARNING many changes:

new json_diff utility
log summary ordered by importance
ycommand fixed
new gobj_2key* api
new nonlegalfile2json api
c_yuno with new commands: cmd_2key_get_schema/cmd_2key_get_value

Version 4.2.15
==============
c-core          - GClass Node had tranger as json copy, making it as private variable;
                  change it to pointer, a global variable

Version 4.2.14
==============
many            - Al incorporar GCLASS_NODE, que usa uuid, en muchos proyectos que usan c-core
                  faltaba la libreria uuid en CMakeLists.txt

Version 4.2.13
==============
c-core          - Faltaban clases por registrar (GCLASS_NODE "Node")

Version 4.2.12
==============
ginsfsm         - WARNING gobj meta attrs reviewed

Version 4.2.8
=============
Deployed in dallas1

Version 4.2.7
=============
ghelpers        - delete "Internal Counters" in daily report.
c-core/js-core  - Commands and Stats can be redirected to another service
ginsfsm         - gobj_gobjs_treedb_schema()/gobj_gobjs_treedb_data() treedb schema for gobjs

version 4.x.x has resource node (treedb) integrated, yuno_agent using it.

Version 3.3.1
=============
ghelpers        - change in tranger api.
external-libs   - added openssl-1.1.1


Version 3.3.0
=============
VERSION LIBERADA en sfs/dallas2
ghelpers    - timeranger change metadata topic size, INCOMPATIBLE with previous versions


Version 3.2.4
=============
VERSION LIBERADA en sfs/dallas2

yuneta      - yuneta_agent, let public service be invoked by name
yuneta      - rc_tranger moved to ginsfsm
yuneta      - c-core, c_yuno.c: set codeset in i18n.

Version 3.2.3
=============
VERSION LIBERADA en sfs/dallas2

yunos           - emu_device: empty frame will signal a channel drop
yuneta          - c_yuno.c More info in writing attributes
gobj-ecosistema - **Change api** of tranger_write_record_*(), more explicit.

Version 3.2.2
=============
Libero versión, resource1 y rc_sqlite se congelan, el futuro es resource2 y rc_tranger.

yuneta          - Remove pidfiles in kill operations.
                Not remove them can cause kill process others than yuneta.
                (ylist, yshutdown)

.. warning::

    Casí logro intergrar rc_tranger en la actual c_resource.
    Pero no, hay que dar un salto fuerte, con un ``id`` no solo numérico.
    También cambia la carga de registros, que interesa hacerla siempre por callback,
    para buen funcionamiento con TimeRanger.
    Así es que, toca crear c_resource2, para adaptarlo e integrar correctamente al driver rc_tranger.
    Espero no haber jodido nada.


yunos           - emu_device - Add window,interval attributes to input command parameters
gobj-ecosistema - ocilib: compute all dates as UTC
yuneta          - new resource driver for TimeRanger: c-rc_tranger
yuneta          - api resources changed, to incorporate TimeRanger

Version 3.2.1
=============
gobj-ecosistema -   ginsfsm,  "__root__" alias of "__yuno__" (10_gobj.c)

yuneta          -   c-core. Next commands change to use __root__ instead of __default_service__:
                    info-gobj-trace, get-gobj-trace, get-gobj-no-trace

                    yuneta          -   Make ip:port configurable for yuneta_agent
                    Example of ``/yuneta/agent/yuneta_agent.json`` ::

                    {
                        "global": {
                            "Agent.startup_command": "/yuneta/bin/nginx/sbin/nginx"
                        },
                        "__json_config_variables__": {
                            "__input_url__": "ws://0.0.0.0:1991",
                            "__input_host__": "0.0.0.0",
                            "__input_port__": "1991"
                        }
                    }


Version 3.2.0
=============
gobj-ecosistema -   ghelpers/ginsfsm, new timeranger topic metadata, incompatible with previous versions

Version 3.1.1
=============
yuneta          -   Don't remove pidfiles (ylist.c, yshutdown.c).
gobj-ecosistema -   Avoid to save trace when trace name is wrong (gobj.c).
gobj-ecosistema -   New test json_xml
gobj-ecosistema -   process nested xml element as json array (21_json_xml.c)
yuneta          -   More info in global trace "ev_kw": show expanded command parser kw (command_parser.c)
yuneta          -   remove "ev_kw2" global level trace, it NOT EXIST
yuneta          -   save trace levels only on success (c_yuno.c)
gobj-ecosistema -   tranger_list version set as ghelpers (tranger_list.c)


Version 3.1.0
=============

Initial commit
