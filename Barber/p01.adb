--with  Gnat.IO;
with Text_Io;

procedure P01 is 
   --use Ada.Text_IO;
   use Text_Io;

   ----------------------   
  
   task BShop is
      entry client_work;
      entry barber_work;            
   end BShop;
   
   task Barber is
            entry wake;
                  --entry B (data : out integer);
            
   end Barber;


   task body BShop is
      L: integer;

   begin
      
           loop
              
              accept client_work do
              
                       Put_Line("new client ");  
                       Put_Line("client's count " & integer'image((client_work'count)));  
                       
        
                             
              end client_work;
              
              --barber.wake;
              
                                 accept barber_work do
                             Put_Line("work");
                     
                          for I in Integer range 1 .. 10 loop
                              l := i*i;
     
                          end loop;                     
                             end barber_work;     
                             
              Put_Line("done");  

               
             
               
                        
               
           
           end loop;
      
   end BShop;
   ------------------------------------------------------------------------------
   


   task body Barber is    
   begin
      Put_Line("sleep"); 
      loop  
                        accept wake do
                          Put_Line("wake"); 
                        end wake;

            Bshop.barber_work;

           
      
      end loop;
   end Barber;
   ------------------
   
   task type Client is
                  --entry B (data : out integer);            
   end Client ;


   task body Client is
      L: integer;
   begin
         loop

                  barber.client_in(l);
                                    if (l = 0)
                                    then barber.wake;

                  
                        for I in Integer range 1 .. 1000 loop

                           l := i*i;

                        end loop;
                        
                        
                        
         end loop;
   end Client ;
      
      T_1 : client;
      T_2 : client;
      
            T_3 : client;

       
      
  ---------------------- 
 

begin
    
   Put_Line("--------"); 

   
      

end P01;