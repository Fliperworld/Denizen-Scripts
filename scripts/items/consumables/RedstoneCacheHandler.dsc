RedstoneCacheHandler:
    type: command
    name: redstonecacheopen
    permission: server.only
    script:
    - if !<context.server>:
        - stop
    - give <context.args.get[1]> redstone quantity:64

SmallRedstoneCacheHandler:
    type: command
    name: smallredstonecacheopen
    permission: server.only
    script:
    - if !<context.server>:
        - stop
    - give <context.args.get[1]> redstone quantity:32