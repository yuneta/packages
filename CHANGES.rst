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
