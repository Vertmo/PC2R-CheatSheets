# Fair threads (C)

## Constructors

```
ft_scheduler_t ft_scheduler_create (void);
ft_thread_t ft_thread_create(ft_scheduler_t scheduler, void (*runnable)(void*),
    void (*cleanup)(void*), void *args);
ft_thread_t ft_automaton_create(ft_scheduler_t, void (*automaton)(ft_thread_t),
    void (*cleanup)(void*), void *args);
ft_event_t ft_event_create(ft_scheduler_t scheduler);
```

## Starting a Scheduler

`int ft_scheduler_start(ft_scheduler_t scheduler);`

## Control of Threads
```
int ft_scheduler_stop(ft_thread_t thread);
int ft_scheduler_suspend(ft_thread_t thread);
int ft_scheduler_resume(ft_thread_t thread);
```

## Broadcast of Events
```
int ft_scheduler_broadcast(ft_event_t event);
int ft_scheduler_broadcast_value(ft_event_t event,void *value);
```

## Cooperation
```
int ft_thread_cooperate(void);
int ft_thread_cooperate_n(int num);
```

## Termination
```
int ft_thread_join(ft_thread_t thread);
int ft_thread_join_n(ft_thread_t thread,int timeout);
```

## Generating Events
```
int ft_thread_generate(ft_event_t event);
int ft_thread_generate_value(ft_event_t event,void *value);
```

## Waiting Events
```
int ft_thread_await(ft_event_t event);
int ft_thread_await_n(ft_event_t event,int timeout);
```

## Selecting Events
```
int ft_thread_select(int len,ft_event_t *array,int *mask);
int ft_thread_select_n(int len,ft_event_t *array,int *mask,int timeout);
```

## Getting Generated Values
`int ft_thread_get_value(ft_event_t event,int num,void **result);`

## Link and Unlink
```
int ft_thread_link(ft_scheduler_t scheduler);
int ft_thread_unlink(void);
```

## Current Thread and Scheduler
```
ft_thread_t     ft_thread_self       (void);
ft_scheduler_t  ft_thread_scheduler  (void);
```

## Exit
`void ft_exit(void);`

## Macros for Automata
 
```
AUTOMATON(name) 
DEFINE_AUTOMATON(name) 
BEGIN_AUTOMATON
END_AUTOMATON  

STATE(num)    
STATE_AWAIT(num,event)    
STATE_AWAIT_N(num,event,delay)
STATE_GET_VALUE(num,event,n,result) 
STATE_STAY(num,delay)               
STATE_JOIN(num,thread)              
STATE_JOIN_N(num,thread,delay)      
STATE_SELECT(num,n,array,mask)              
STATE_SELECT_N(num,n,array,mask,delay)

GOTO(num) 
GOTO_NEXT 
IMMEDIATE(num)
RETURN
```
