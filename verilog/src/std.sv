// This is the SystemVerilog builtin "std" package as described in the
// IEEE 1800 LRM
//

`timescale 1ns/1ps

package std;
class semaphore;
    local event _putEvent;
    local int _keyCount;
    local int _waiting;
    function new(int keyCount = 0);
        if (keyCount > 0) _keyCount = keyCount;
        else if (keyCount < 0)
            $display("** Warning: Ignoring illegal negative size in semaphore creation; using 0 as default");
        _waiting = 0;
    endfunction

    function void put(int keyCount = 1);
        _keyCount += keyCount;
        ->_putEvent;
        return;
    endfunction

    task  get(int keyCount = 1);
        logic first = 1'b1;
        if (_waiting > 0 ) begin
            #0;
        end
        while (_keyCount < keyCount) begin
            if (first) begin
                _waiting++;
                first = 1'b0;
            end
            @_putEvent;
        end
        _keyCount -= keyCount;
        if (first == 1'b0)
            _waiting--;
    endtask

    function int try_get(int keyCount = 1);
        if (_keyCount < keyCount) begin
            return 0;
        end
        _keyCount -= keyCount;
        return 1;
    endfunction
endclass

class mailbox #(type T = integer);
	local T items[$];
	local semaphore read_semaphore;
	local semaphore write_semaphore; //needed for blocking put on bounded queue, null implies unbounded queue

	function new(int maxItems = 0);
	  read_semaphore = new(0);
	  if (maxItems > 0)
		write_semaphore = new(maxItems);
          else if (maxItems < 0)
               $display("** Warning: Ignoring illegal negative size in mailbox construction; using 0 as default");
	endfunction

	function int num();
	  return items.size();
	endfunction

	task put(T message);
	  if (write_semaphore!=null)
		write_semaphore.get(1);
	  items.push_back(message);
	  read_semaphore.put(1);
	endtask

	function int try_put(T message);
	  if (write_semaphore==null || write_semaphore.try_get(1) > 0) begin
		items.push_back(message);
		read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction

	task get(output /*ref*/ T message);
	  read_semaphore.get(1);
	  message = items.pop_front();
	  if (write_semaphore!=null)
		write_semaphore.put(1);
	endtask

	function int try_get(output /*ref*/ T message);
	  if (read_semaphore.try_get(1) > 0) begin
		message = items.pop_front();
		if (write_semaphore!=null)
		  write_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction

	task peek(output /*ref*/ T message);
	  read_semaphore.get(1);
	  message = items[0];
	  read_semaphore.put(1);
	endtask

	function int try_peek(output /*ref*/ T message);
	  if (read_semaphore.try_get(1) > 0) begin
		message = items[0];
		read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction
endclass

function automatic int randomize(input int i);
    return i;
endfunction

    class process;
        typedef enum { FINISHED, RUNNING, WAITING, SUSPENDED, KILLED } state;

        extern static function process self();

        local function new();
        endfunction
        extern function state status();
        extern task await();
        extern function void kill();
        extern function void suspend();
        extern function void resume();
    endclass

typedef int generic_mailbox_item[] ;
generic_mailbox_item get_d_item;
generic_mailbox_item put_d_item;

class generic_mailbox_internal #(type T = integer) ;
	local T items[$];
	local int sizes[$];
	local real real_items[$];
    local generic_mailbox_item generic_mailbox_item_q[$]; 
    local string string_items[$];
    local semaphore read_semaphore;
	local semaphore write_semaphore; //needed for blocking put on bounded queue, null implies unbounded queue

	function new(int maxItems = 0);
	  read_semaphore = new(0);
      if (maxItems > 0)
		write_semaphore = new(maxItems);
          else if (maxItems < 0)
               $display("** Warning: Ignoring illegal negative size in mailbox construction; using 0 as default");
	endfunction

	function int num();
	  return sizes.size();
	endfunction

	task put(T message);
	  if (write_semaphore!=null)
		write_semaphore.get(1);
	  items.push_back(message);
      sizes.push_back(0);
      read_semaphore.put(1);
	endtask 
      
    task put_string(string message);
	  if (write_semaphore!=null)
		write_semaphore.get(1);
	  string_items.push_back(message);
      sizes.push_back(-1);
      read_semaphore.put(1);
	endtask 
   
   task put_real(real message);
	  if (write_semaphore!=null)
		write_semaphore.get(1);
	  real_items.push_back(message);
      sizes.push_back(-2);
      read_semaphore.put(1);
	endtask
    
    task put_generic_item(input int size, generic_mailbox_item it1);
	  if (write_semaphore!=null)
		write_semaphore.get(1);
      generic_mailbox_item_q.push_back(it1);
      sizes.push_back(size);
      read_semaphore.put(1);
	endtask 
    
    function int try_put(T message);
	  if (write_semaphore==null || write_semaphore.try_get(1) > 0) begin
        items.push_back(message);
        sizes.push_back(0);
		read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction	
    
    function int try_put_string(string message);
	  if (write_semaphore==null || write_semaphore.try_get(1) > 0) begin
            string_items.push_back(message);
        sizes.push_back(-1);
		read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction

    
    function int try_put_real(real message);
	  if (write_semaphore==null || write_semaphore.try_get(1) > 0) begin
            real_items.push_back(message);
        sizes.push_back(-2);
		read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction 
    
    function int try_put_generic_item(input int size, generic_mailbox_item it1 );
	  if (write_semaphore==null || write_semaphore.try_get(1) > 0) begin
        generic_mailbox_item_q.push_back(it1);
        sizes.push_back(size);
		read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction 
    
    
    task get(output T message);
        string s1;
        if((sizes.size() > 0) && (sizes[0] != 0) && (sizes[0] != -1)) begin
            // ERROR case 
            return;
        end
        read_semaphore.get(1);
        if((sizes.size() > 0) && (sizes[0] != 0) && (sizes[0] != -1)) begin
            // ERROR case 
            return;
        end 
        if(sizes[0] == 0)
            message = items.pop_front();
        else begin
            s1 = string_items.pop_front();
            message = T'(s1);
        end
        sizes.pop_front();
        if (write_semaphore!=null)
            write_semaphore.put(1);
    endtask 

   
  task get_string(ref string message);
    if((sizes.size() > 0) && (sizes[0] != -1)) begin
        // ERROR case
        $xlnx_generic_mailbox_get_and_put_func_call_error("string", "get");
    return;
    end
    read_semaphore.get(1);
    if((sizes.size() > 0) && (sizes[0] != -1)) begin
        $xlnx_generic_mailbox_get_and_put_func_call_error("string", "get");
        // ERROR case
    return;
    end 
    message = string_items.pop_front();
    sizes.pop_front();
    if (write_semaphore!=null)
        write_semaphore.put(1);
  endtask 
   
  task get_real(ref real message);
    if((sizes.size() > 0) && (sizes[0] != -2)) begin
        $xlnx_generic_mailbox_get_and_put_func_call_error("real", "get");
        // ERROR case
        return;
    end
    read_semaphore.get(1);
    if((sizes.size() > 0) && (sizes[0] != -2)) begin
        $xlnx_generic_mailbox_get_and_put_func_call_error("real", "get");
        // ERROR case
        return;
    end 
    message = real_items.pop_front();
    sizes.pop_front();
    if (write_semaphore!=null)
        write_semaphore.put(1);
  endtask  
        
  
 task get_generic_item(input int size, output  generic_mailbox_item message);
    if((sizes.size() > 0) && (sizes[0] != size)) begin
        $xlnx_generic_mailbox_get_and_put_call_size_mismatch_error(size, "get");
        // ERROR case
        return;
    end
    read_semaphore.get(1);
    if((sizes.size() > 0) && (sizes[0] != size)) begin
        $xlnx_generic_mailbox_get_and_put_call_size_mismatch_error(size, "get");
        // ERROR case
        return;
    end 
    message = generic_mailbox_item_q.pop_front();
    sizes.pop_front();
    if (write_semaphore!=null)
        write_semaphore.put(1);
 endtask 
  
    function int try_get(output T message);
        if(sizes.size() == 0)
            return 0;
        if((sizes.size() > 0) && (sizes[0] != 0)) 
            return -1;
        if (read_semaphore.try_get(1) > 0) begin
            message = items.pop_front();
            sizes.pop_front(); 
            if (write_semaphore!=null)
		        write_semaphore.put(1);
		    return 1;
        end
	    return 0;
	endfunction 
 

    function int try_get_string(ref string message);
        if(sizes.size() == 0)
            return 0;
        if((sizes.size() > 0) && (sizes[0] != -1))
            return -1;
        if (read_semaphore.try_get(1) > 0) begin
            message = string_items.pop_front();
            sizes.pop_front(); 
            if (write_semaphore!=null)
		        write_semaphore.put(1);
		    return 1;
        end
	    return 0;
	endfunction   

    function int try_get_real(ref real message);
        if(sizes.size() == 0)
            return 0;
        if((sizes.size() > 0) && (sizes[0] != -2)) 
            return -1;
        if (read_semaphore.try_get(1) > 0) begin
            message = real_items.pop_front();
            sizes.pop_front(); 
            if (write_semaphore!=null)
		        write_semaphore.put(1);
		    return 1;
        end
	    return 0;
	endfunction

    function int try_get_generic_item(input int size, output generic_mailbox_item message);
      if(sizes.size() == 0)
        return 0;
      if((sizes.size() > 0) && (sizes[0] != size)) begin
        return -1;
      end
      if (read_semaphore.try_get(1) > 0) begin
        message = generic_mailbox_item_q.pop_front();
        sizes.pop_front(); 
        if (write_semaphore!=null)
		  write_semaphore.put(1);
	    return 1;
      end
	  return 0;
	endfunction
    
	task peek(output T message);
      if((sizes.size() > 0) && (sizes[0] != 0)) begin
        return;
      end 
      read_semaphore.get(1);
      if((sizes.size() > 0) && (sizes[0] != 0)) begin
        return;
      end
      message = items[0];
	  read_semaphore.put(1);
	endtask	
    
    task peek_string(ref string message);
      if((sizes.size() > 0) && (sizes[0] != -1)) begin
        $xlnx_generic_mailbox_get_and_put_func_call_error("string", "peek");
        return;
      end 
      read_semaphore.get(1);
      if((sizes.size() > 0) && (sizes[0] != -1)) begin
        $xlnx_generic_mailbox_get_and_put_func_call_error("string", "peek");
        return;
      end
      message = string_items[0];
	  read_semaphore.put(1);
	endtask 
    
    
    task peek_real(ref real message);
      if((sizes.size() > 0) && (sizes[0] != -2)) begin
        $xlnx_generic_mailbox_get_and_put_func_call_error("real", "peek");
        return;
      end 
      read_semaphore.get(1);
      if((sizes.size() > 0) && (sizes[0] != -2)) begin
        $xlnx_generic_mailbox_get_and_put_func_call_error("real", "peek");
        return;
      end
      message = real_items[0];
	  read_semaphore.put(1);
	endtask 

    task peek_generic_item(input int size, output generic_mailbox_item message);
      if((sizes.size() > 0) && (sizes[0] != size)) begin
        $xlnx_generic_mailbox_get_and_put_call_size_mismatch_error(size, "peek");
        return;
      end 
      read_semaphore.get(1);
      if((sizes.size() > 0) && (sizes[0] != size)) begin
        $xlnx_generic_mailbox_get_and_put_call_size_mismatch_error(size, "peek");
        return;
      end
      message = generic_mailbox_item_q[0];
	  read_semaphore.put(1);
	endtask 
    
	function int try_peek(output T message);
      if(sizes.size() == 0)
        return 0;
      if((sizes.size() > 0) && (sizes[0] != 0))
        return -1;
	  if (read_semaphore.try_get(1) > 0) begin
		message = items[0];
        read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction

    function int try_peek_string(ref string message);
      if(sizes.size() == 0)
        return 0;
      if((sizes.size() > 0) && (sizes[0] != -1))
        return -1;
	  if (read_semaphore.try_get(1) > 0) begin
		message = string_items[0];
        read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction 
    
    function int try_peek_real(ref real message);
      if(sizes.size() == 0)
        return 0;
      if((sizes.size() > 0) && (sizes[0] != -2))
        return -1;
	  if (read_semaphore.try_get(1) > 0) begin
		message = real_items[0];
        read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction 
    
    function int try_peek_generic_item(input int size, output generic_mailbox_item message);
      if(sizes.size() == 0)
        return 0;
      if((sizes.size() > 0) && (sizes[0] != size))
        return -1;
	  if (read_semaphore.try_get(1) > 0) begin
		message = generic_mailbox_item_q[0];
        read_semaphore.put(1);
		return 1;
	  end
	  return 0;
	endfunction

endclass

generic_mailbox_internal dummy_mb = new;

endpackage
