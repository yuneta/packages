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
