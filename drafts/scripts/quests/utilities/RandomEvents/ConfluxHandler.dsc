ConfluxTimerHandler:
    type: world
    events:
        on system time minutely:every 10:
            - if <util.random>