# Amnesia Phoenix Benchmark

A 10,000 synchronous transaction benchmark of mnesia with a async process per transaction using the amnesia wrapper for mnesia.

See:

amnesia_phoenix/lib/trans_action.ex
and
amnesia_phoenix/web/controllers/page_controller.ex

for most relevant code


To start your new Phoenix application:

1. Install dependencies with `mix deps.get`
2. Install dependencies with `npm install`
3. Start Amnesia with `mix install` (uninstall with `mix uninstall`)
4. Start Phoenix endpoint with `mix phoenix.server`
5. Watch 10k transactions being done with Task.async upon visiting `localhost:4000`
6. Check the console for benchmark and mnesia information

Now you can visit `localhost:4000` from your browser and wait a few seconds for it to load.


### Sample Output

| FUNCTION                                                       | CALLS |      %   |  TIME    |[uS / CALLS]|
|----------------------------------------------------------------|-------|----------|----------|---------|
|'Elixir.ExProf.Macro':execute_profile/1                         |     1 |    0.00  |       1  | [  1.00]|
|'Elixir.Enumerable.Range':reduce/3                              |     1 |    0.00  |       1  | [  1.00]|
|'Elixir.Enumerable':impl_for/1                                  |     1 |    0.00  |       2  | [  2.00]|
|'Elixir.Enumerable':'impl_for!'/1                               |     1 |    0.00  |       2  | [  2.00]|
|erlang:function_exported/3                                      |     1 |    0.00  |       3  | [  3.00]|
|'Elixir.AmnesiaPhoenix.PageController':'-index/2-fun-1-'/0      |     1 |    0.00  |       5  | [  5.00]|
|'Elixir.Enumerable':reduce/3                                    |     1 |    0.00  |       6  | [  6.00]|
|lists:reverse/2                                                 |     1 |    0.00  |     290  | [290.00]|
|mnesia_checkpoint:tm_enter_pending/2                            |  9568 |    0.18  |   39766  | [  4.16]|
|mnesia_tm:intercept_best_friend/2                               |  9568 |    0.18  |   39813  | [  4.16]|
|mnesia_checkpoint:tm_enter_pending/1                            |  9568 |    0.19  |   41528  | [  4.34]|
|'Elixir.Map':get/3                                              |  9977 |    0.19  |   43391  | [  4.35]|
|'Elixir.DB.Message':write/1                                     |  9754 |    0.20  |   43853  | [  4.50]|
|mnesia_tm:multi_commit/5                                        |  9568 |    0.20  |   44127  | [  4.61]|
|maps:find/2                                                     |  9977 |    0.20  |   44468  | [  4.46]|
|mnesia:transaction/6                                            | 10000 |    0.20  |   44861  | [  4.49]|
|'Elixir.DB.Message':write/2                                     |  9754 |    0.20  |   44955  | [  4.61]|
|'Elixir.DB.User':write/2                                        |  9977 |    0.20  |   45293  | [  4.54]|
|mnesia_lib:db_get/3                                             |  9568 |    0.20  |   45504  | [  4.76]|
|mnesia:do_dirty_update_counter/4                                |  9977 |    0.21  |   46014  | [  4.61]|
|ets:first/1                                                     |  9568 |    0.21  |   46540  | [  4.86]|
|proc_lib:spawn_link/3                                           | 10000 |    0.21  |   46629  | [  4.66]|
|mnesia:dirty_update_counter/3                                   |  9977 |    0.21  |   46898  | [  4.70]|
|mnesia_tm:rec_dirty/2                                           |  9977 |    0.21  |   46967  | [  4.71]|
|mnesia_tm:execute_outer/6                                       | 10000 |    0.21  |   47312  | [  4.73]|
|'Elixir.Enumerable.Range':reduce/5                              | 10001 |    0.21  |   47322  | [  4.73]|
|mnesia_tm:transaction/6                                         | 10000 |    0.22  |   48051  | [  4.81]|
|'Elixir.Task.Supervised':spawn_link/4                           | 10000 |    0.22  |   48339  | [  4.83]|
|proc_lib:init_p_do_apply/3                                      | 10000 |    0.22  |   48643  | [  4.86]|
|'Elixir.DB.User':add_message/2                                  |  9754 |    0.22  |   49377  | [  5.06]|
|'Elixir.Process':put/2                                          | 10000 |    0.22  |   49860  | [  4.99]|
|mnesia_tm:execute_transaction/5                                 |  9977 |    0.23  |   50461  | [  5.06]|
|mnesia_tm:dirty/2                                               |  9977 |    0.23  |   51321  | [  5.14]|
|maps:put/3                                                      |  9977 |    0.24  |   52492  | [  5.26]|
|mnesia_subscr:deliver/2                                         |  9568 |    0.24  |   53309  | [  5.57]|
|ets:delete/2                                                    |  9754 |    0.24  |   53505  | [  5.49]|
|erlang:make_ref/0                                               | 10000 |    0.24  |   54049  | [  5.40]|
|'Elixir.Task.Supervised':reply/5                                | 10000 |    0.25  |   56113  | [  5.61]|
|proc_lib:init_p/5                                               | 10000 |    0.25  |   56291  | [  5.63]|
|mnesia_index:add_index/5                                        |  9568 |    0.37  |   83015  | [  8.68]|
|mnesia_tm:'-multi_commit/5-lc$^0/1-0-'/2                        |  9568 |    0.38  |   84778  | [  8.86]|
|mnesia_index:'-add_index2/6-lc$^0/1-0-'/3                       |  9568 |    0.38  |   85366  | [  8.92]|
|mnesia_lib:db_put/3                                             | 19137 |    0.38  |   85387  | [  4.46]|
|erlang:'--'/2                                                   | 19136 |    0.39  |   85902  | [  4.49]|
|'Elixir.DB.Message':hook_write/1                                |  9754 |    0.39  |   86746  | [  8.89]|
|mnesia_index:db_put/2                                           |  9568 |    0.39  |   87048  | [  9.10]|
|mnesia_tm:ask_commit/7                                          | 19136 |    0.39  |   87414  | [  4.57]|
|erlang:monitor/2                                                | 10000 |    0.39  |   87814  | [  8.78]|
|mnesia_checkpoint:val/1                                         |  9568 |    0.39  |   88024  | [  9.20]|
|mnesia_tm:flush_downs/0                                         |  9568 |    0.40  |   88396  | [  9.24]|
|mnesia_recover:val/1                                            |  9568 |    0.40  |   88472  | [  9.25]|
|'Elixir.Amnesia.Table.Definition':'-autoincrement/4-fun-0-'/4   |  9977 |    0.40  |   88537  | [  8.87]|
|mnesia_log:slog/1                                               |  9568 |    0.40  |   89188  | [  9.32]|
|mnesia_tm:ask_commit/5                                          |  9568 |    0.40  |   89834  | [  9.39]|
|'Elixir.Amnesia.Metadata':counter/4                             |  9977 |    0.40  |   89870  | [  9.01]|
|mnesia_lib:incr_counter/1                                       |  9568 |    0.40  |   89925  | [  9.40]|
|mnesia_checkpoint:tm_enter_pending/3                            |  9568 |    0.40  |   90251  | [  9.43]|
|mnesia_lib:val/1                                                |  9568 |    0.41  |   90340  | [  9.44]|
|mnesia:sync_transaction/1                                       | 10000 |    0.41  |   90393  | [  9.04]|
|'Elixir.DB.User':hook_write/1                                   |  9977 |    0.41  |   91176  | [  9.14]|
|'Elixir.DB':metadata/0                                          |  9977 |    0.41  |   91259  | [  9.15]|
|mnesia_tm:async_send_dirty/4                                    |  9977 |    0.41  |   91499  | [  9.17]|
|erlang:whereis/1                                                | 19568 |    0.41  |   91682  | [  4.69]|
|'Elixir.Amnesia.Metadata':for/1                                 |  9977 |    0.41  |   91827  | [  9.20]|
|'Elixir.DB.User':coerce/1                                       |  9977 |    0.41  |   92105  | [  9.23]|
|'Elixir.Task':get_info/1                                        | 10000 |    0.41  |   92119  | [  9.21]|
|mnesia_lib:db_get/2                                             |  9568 |    0.42  |   92536  | [  9.67]|
|'Elixir.Enum':'-reduce/3-fun-0-'/3                              | 10000 |    0.42  |   92684  | [  9.27]|
|'Elixir.Process':info/2                                         | 10000 |    0.42  |   92706  | [  9.27]|
|'Elixir.Enum':reduce/3                                          | 19732 |    0.42  |   92788  | [  4.70]|
|mnesia_tm:intercept_friends/2                                   |  9568 |    0.42  |   92833  | [  9.70]|
|'Elixir.Task':async/3                                           | 10000 |    0.42  |   93062  | [  9.31]|
|mnesia_tm:commit_update/6                                       |  9977 |    0.42  |   93110  | [  9.33]|
|proc_lib:get_ancestors/0                                        | 10000 |    0.42  |   93123  | [  9.31]|
|mnesia_tm:do_dirty/2                                            |  9977 |    0.42  |   93138  | [  9.34]|
|mnesia_tm:t_commit/1                                            |  9568 |    0.42  |   93381  | [  9.76]|
|mnesia:write/3                                                  | 19731 |    0.42  |   93392  | [  4.73]|
|proc_lib:proc_info/2                                            | 10000 |    0.42  |   93405  | [  9.34]|
|'Elixir.Map':get/2                                              |  9977 |    0.42  |   93448  | [  9.37]|
|mnesia_locker:wlock/4                                           | 19731 |    0.42  |   93503  | [  4.74]|
|'Elixir.Task.Supervised':initial_call/1                         | 10000 |    0.42  |   93505  | [  9.35]|
|mnesia_recover:note_decision/2                                  |  9568 |    0.42  |   93647  | [  9.79]|
|'Elixir.DB.Message':coerce/1                                    |  9754 |    0.42  |   93931  | [  9.63]|
|mnesia_index:add_index2/6                                       | 19136 |    0.42  |   93979  | [  4.91]|
|'Elixir.Task.Supervised':reply/4                                | 10000 |    0.42  |   94432  | [  9.44]|
|mnesia_tm:arrange/3                                             |  9568 |    0.42  |   94707  | [  9.90]|
|'Elixir.DB.User':write/1                                        |  9977 |    0.43  |   94940  | [  9.52]|
|'Elixir.AmnesiaPhoenix.PageController':'-index/2-fun-0-'/2      | 10000 |    0.43  |   95130  | [  9.51]|
|mnesia_tm:do_commit/3                                           | 19545 |    0.43  |   96384  | [  4.93]|
|mnesia_tm:majority_attr/1                                       |  9568 |    0.44  |   97143  | [ 10.15]|
|proc_lib:get_my_name/0                                          | 10000 |    0.44  |   97560  | [  9.76]|
|erlang:'++'/2                                                   | 19136 |    0.44  |   97594  | [  5.10]|
|proc_lib:trans_init/3                                           | 10000 |    0.44  |   97700  | [  9.77]|
|mnesia:write/5                                                  | 19731 |    0.44  |   97746  | [  4.95]|
|mnesia_lib:db_update_counter/4                                  |  9977 |    0.44  |   97895  | [  9.81]|
|mnesia_tm:req/1                                                 | 10000 |    0.44  |   97967  | [  9.80]|
|mnesia_tm:apply_fun/3                                           |  9977 |    0.44  |   98490  | [  9.87]|
|'Elixir.Task.Supervised':get_initial_call/1                     | 10000 |    0.44  |   98728  | [  9.87]|
|mnesia_tm:async_send_dirty/6                                    | 19954 |    0.44  |   98798  | [  4.95]|
|'Elixir.String.Chars.Integer':to_string/1                       | 20000 |    0.45  |   99655  | [  4.98]|
|mnesia_log:log/1                                                |  9977 |    0.45  |   99742  | [ 10.00]|
|'Elixir.Trans_action':write_read/4                              | 10000 |    0.45  |  101025  | [ 10.10]|
|'Elixir.Task.Supervised':spawn_link/3                           | 10000 |    0.46  |  101696  | [ 10.17]|
|mnesia_tm:rec/2                                                 | 10000 |    0.46  |  102932  | [ 10.29]|
|mnesia:write_to_store/4                                         | 19322 |    0.46  |  103133  | [  5.34]|
|'Elixir.Trans_action':'-write_read/4-fun-0-'/4                  |  9977 |    0.46  |  103629  | [ 10.39]|
|erlang:unlink/1                                                 |  9568 |    0.47  |  104485  | [ 10.92]|
|'Elixir.Task.Supervised':do_apply/2                             | 10000 |    0.48  |  106020  | [ 10.60]|
|ets:update_counter/3                                            | 19545 |    0.50  |  110750  | [  5.67]|
|mnesia_locker:release_tid/1                                     |  9568 |    0.51  |  114175  | [ 11.93]|
|mnesia_tm:prep_recs/2                                           | 19136 |    0.59  |  131920  | [  6.89]|
|mnesia_tm:commit_nodes/3                                        | 19136 |    0.61  |  134942  | [  7.05]|
|mnesia_tm:do_commit/2                                           | 19545 |    0.63  |  139809  | [  7.15]|
|'Elixir.Enum':'-reduce/3-lists^foldl/2-0-'/3                    | 29708 |    0.63  |  139834  | [  4.71]|
|erlang:erase/1                                                  | 28890 |    0.64  |  142188  | [  4.92]|
|lists:keymember/3                                               | 29113 |    0.65  |  145652  | [  5.00]|
|mnesia_tm:check_prep/2                                          | 29113 |    0.66  |  146095  | [  5.02]|
|erlang:spawn_link/3                                             | 10000 |    0.67  |  148826  | [ 14.88]|
|mnesia_tm:get_elements/2                                        | 19136 |    0.79  |  175825  | [  9.19]|
|erlang:process_info/2                                           | 20000 |    0.79  |  176808  | [  8.84]|
|mnesia_dumper:update/3                                          | 19545 |    0.79  |  177083  | [  9.06]|
|'Elixir.String.Chars':impl_for/1                                | 20000 |    0.81  |  179483  | [  8.97]|
|mnesia_locker:del_debug/0                                       | 19322 |    0.81  |  180011  | [  9.32]|
|rpc:abcast/3                                                    | 19136 |    0.82  |  182076  | [  9.51]|
|mnesia_tm:reverse/1                                             | 19136 |    0.82  |  182586  | [  9.54]|
|lists:delete/2                                                  | 19322 |    0.83  |  184172  | [  9.53]|
|mnesia_locker:w_nodes/1                                         | 19731 |    0.84  |  186504  | [  9.45]|
|mnesia_tm:do_snmp/2                                             | 19545 |    0.84  |  188064  | [  9.62]|
|'Elixir.Amnesia.Table.Definition':autoincrement/4               | 19731 |    0.85  |  189533  | [  9.61]|
|'Elixir.String.Chars':'impl_for!'/1                             | 20000 |    0.86  |  191068  | [  9.55]|
|mnesia_tm:rec_all/4                                             | 19136 |    0.86  |  192149  | [ 10.04]|
|mnesia_locker:check_majority/3                                  | 19731 |    0.86  |  192511  | [  9.76]|
|mnesia_subscr:report_activity/1                                 | 19545 |    0.86  |  192571  | [  9.85]|
|mnesia_locker:need_lock/4                                       | 19731 |    0.87  |  193459  | [  9.80]|
|mnesia_locker:wlock/3                                           | 19731 |    0.87  |  194014  | [  9.83]|
|'Elixir.Amnesia.Table':write/3                                  | 19731 |    0.89  |  197520  | [ 10.01]|
|'Elixir.String.Chars':to_string/1                               | 20000 |    0.91  |  202433  | [ 10.12]|
|mnesia_tm:commit_write/6                                        | 28704 |    0.99  |  220131  | [  7.67]|
|mnesia_locker:get_wlocks_on_nodes/5                             | 39053 |    1.00  |  222053  | [  5.69]|
|ets:lookup/2                                                    | 47840 |    1.14  |  254664  | [  5.32]|
|erlang:send/2                                                   | 19569 |    1.20  |  268619  | [ 13.73]|
|mnesia_tm:do_prepare_items/7                                    | 29113 |    1.22  |  272399  | [  9.36]|
|ets:match_object/2                                              | 39462 |    1.22  |  272909  | [  6.92]|
|erlang:integer_to_binary/1                                      | 49708 |    1.23  |  273910  | [  5.51]|
|erlang:setelement/3                                             | 58226 |    1.25  |  278077  | [  4.78]|
|mnesia_locker:receive_wlocks/4                                  | 39053 |    1.25  |  278523  | [  7.13]|
|mnesia_tm:needs_majority/2                                      | 29113 |    1.26  |  280068  | [  9.62]|
|ets:next/2                                                      | 47840 |    1.26  |  281415  | [  5.88]|
|mnesia_tm:pick_node/4                                           | 29113 |    1.26  |  281532  | [  9.67]|
|mnesia_tm:do_update_op/3                                        | 29113 |    1.29  |  286549  | [  9.84]|
|mnesia_tm:prepare_items/5                                       | 29113 |    1.29  |  286705  | [  9.85]|
|mnesia_tm:prepare_snmp/7                                        | 29113 |    1.30  |  290330  | [  9.97]|
|erlang:put/2                                                    | 59708 |    1.34  |  298384  | [  5.00]|
|mnesia_locker:add_debug/1                                       | 19731 |    1.44  |  321078  | [ 16.27]|
|mnesia_tm:do_arrange/5                                          | 57408 |    1.53  |  340140  | [  5.92]|
|lists:reverse/1                                                 | 38273 |    1.59  |  355191  | [  9.28]|
|mnesia_tm:prepare_nodes/5                                       | 58226 |    1.83  |  408720  | [  7.02]|
|mnesia_tm:prepare_node/5                                        | 58226 |    1.90  |  424018  | [  7.28]|
|mnesia_tm:do_update/4                                           | 87748 |    3.10  |  691664  | [  7.88]|
|mnesia_tm:val/1                                                 | 68203 |    3.15  |  702937  | [ 10.31]|
|ets:insert/2                                                    |106625 |    3.23  |  721073  | [  6.76]|
|ets:lookup_element/3                                            |213731 |    5.11  | 1139640  | [  5.33]|
| Total:                                                         |3017719|  100.00% | 22294221 | [ 7.39] |
