# OCaml - Event module

`type 'a channel`:  The type of communication channels carrying values of type 'a.

`val new_channel : unit -> 'a channel`: Return a new channel.

`type +'a event`: The type of communication events returning a result of type 'a.

`val send : 'a channel -> 'a -> unit event`: returns the event consisting in sending the value v over the channel ch. The result value of this event is ().

`val receive : 'a channel -> 'a event`: returns the event consisting in receiving a value from the channel ch. The result value of this event is the value received.

`val always : 'a -> 'a event`: returns an event that is always ready for synchronization. The result value of this event is v.

`val choose : 'a event list -> 'a event`: returns the event that is the alternative of all the events in the list evl.

`val wrap : 'a event -> ('a -> 'b) -> 'b event`: returns the event that performs the same communications as ev, then applies the post-processing function fn on the return value.

`val wrap_abort : 'a event -> (unit -> unit) -> 'a event`: returns the event that performs the same communications as ev, but if it is not selected the function fn is called after the synchronization.

`val guard : (unit -> 'a event) -> 'a event`: returns the event that, when synchronized, computes fn() and behaves as the resulting event. This allows events with side-effects to be computed at the time of the synchronization operation.

`val sync : 'a event -> 'a`: Synchronize on an event: offer all the communication possibilities specified in the event to the outside world, and block until one of the communications succeed. The result value of that communication is returned.

`val select : 'a event list -> 'a`: Synchronize on an alternative of events. `select evl` is shorthand for `sync(choose evl)`.

`val poll : 'a event -> 'a option`: non-blocking version of sync
