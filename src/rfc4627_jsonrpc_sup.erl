%   The contents of this file are subject to the Mozilla Public License
%%   Version 1.1 (the "License"); you may not use this file except in
%%   compliance with the License. You may obtain a copy of the License at
%%   http://www.mozilla.org/MPL/
%%
%%   Software distributed under the License is distributed on an "AS IS"
%%   basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See the
%%   License for the specific language governing rights and limitations
%%   under the License.
%%
%%   The Original Code is the RabbitMQ BQL Module
%%
%%   The Initial Developers of the Original Code are LShift Ltd.,
%%   Cohesive Financial Technologies LLC., and Rabbit Technologies Ltd.
%%
%%   Portions created by LShift Ltd., Cohesive Financial
%%   Technologies LLC., and Rabbit Technologies Ltd. are Copyright (C)
%%   2009 LShift Ltd., Cohesive Financial Technologies LLC., and Rabbit
%%   Technologies Ltd.;
%%
%%   All Rights Reserved.
%%
%%   Contributor(s): ___________________________
%%
-module(rfc4627_jsonrpc_sup).
-behaviour(supervisor).

-export([start_link/0, init/1]).

start_link() ->
  supervisor:start_link({local, ?MODULE}, ?MODULE, _Arg = []).

init([]) ->
    {ok, {{one_for_one, 3, 10},
          [{rfc4627_jsonrpc,
            {rfc4627_jsonrpc, start_link, []},
            permanent,
            10000,
            worker,
            [rfc4627_jsonrpc]}
          ]}}.
