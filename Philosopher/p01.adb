--with  Gnat.IO;
with Text_Io;
with Random_Generic;


procedure P01 is 
   --use Ada.Text_IO;
   use Text_Io;
      subtype my_type is integer range 0..2;
      
      
        package rnd_choise is 
          new Random_Generic (Result_Subtype => my_type);

          
          subtype my_type2 is integer range 1000..20000;
      
      
        package rnd_choise2 is 
          new Random_Generic (Result_Subtype => my_type2);
                    



   ----------------------   
  
   task table is
      entry check_place(data : out integer);
            entry finish_eat(data : in integer); 
   end table;
   
    task type Phil (lacks : integer) is                     
   end Phil;
   
   task servant is
         entry want_to_eat(data : out integer);
   end servant;


   task body table is
      L: my_type;            
            sits: array (1..5) of integer;
            forks: array (1..10) of integer;
            blocks: array (1..5) of integer;
            cnt:integer;
   begin      
         cnt:=0;
         
         for I in sits'Range loop
            sits(I):=0;
            blocks(I):=0;
            forks(I):=0;
            forks(I*2):=0;
         end loop;
         
      loop
            select
               accept finish_eat(data:in integer) do
                  sits (data):=0;
                  forks (data*2):=0;
                  forks (data*2 -1):=0;
                  put_line("phil leave" & integer'Image(data) & " place");
                  put_line("[" & integer'Image(sits(1)) & " , "  & integer'Image(sits(2)) & " , " & integer'Image(sits(3)) & " , " & integer'Image(sits(4)) & " , " & integer'Image(sits(5)) & "]");
                  cnt:=cnt-1;
               end finish_eat;
         
            or
         
               accept check_place (data : out integer) do
                  
                  if (cnt < 4)
                  then
                  
                     data:=-1;
                     for I in sits'Range loop
                        if (I mod 2) /= 0
                        then if (sits (I) = 0)
                               then data:= I;
                                       sits (I):=1;
                                       exit;
                               end if;
                        end if;                        
                     end loop;
                     
                     if data = -1
                     then  for I in sits'Range loop
                                 if (I mod 2) = 0
                                 then if (sits (I) = 0)
                                        then data:= I;
                                                sits (I):=1;
                                                exit;
                                        end if;
                                 end if;                        
                               end loop;
                      end if;
                      
                  end if;
    
                   if (data /= -1)
                   then cnt:=cnt+1;
                   end if;
               end check_place;
               
            or delay 0.0000001;   
            end select;   
               
         end loop;
      
      
   end table;
   ------------------------------------------------------------------------------

   task body servant is    
      L:my_type;
         place_l:integer;         
   begin
                 
      loop
      
        accept want_to_eat(data : out integer) do
                   loop 
                      table.check_place(place_l);                      
                      exit when place_l /= -1;                      
                      put_line("Table is full!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
                  end loop;
                  data:= place_l;
                end want_to_eat;
                
             end loop;
         end servant;
   ------------------
   
   task body Phil is
      L: my_type;
      a: integer;
      n: my_type2;
            my_place: integer;
   begin
           my_place:=-1;
     loop

              n:= rnd_choise2.random_value;
        --Put_Line("!!" & Integer'Image(n));
       for I in 100..n loop
           a := i*i-1;
       end loop;
              
              put_line("philosopher #" & integer'Image(lacks) & " wana eat"); 
              servant.want_to_eat(my_place);
              put_line("philosopher #" & integer'Image(lacks) & " take place #"& integer'Image(my_place) ); 
              
              --check_l.....
              --eat.....
              
              n:= rnd_choise2.random_value;
        --Put_Line("!!" & Integer'Image(n));
       for I in 100..n loop
           a := i*i-1;
       end loop;
              
              delay 0.001;
              
              table.finish_eat(my_place);
              my_place:=-1;
                                             
     end loop;
   end Phil;
      
      T_1 : Phil (lacks => 1);
      T_2 : Phil (lacks => 2);
      T_3 : Phil (lacks => 3);
            T_4 : Phil (lacks => 4);
            T_5 : Phil (lacks => 5);

       
      
  ---------------------- 
 

begin
    
   Put_Line("Hello, world!");
   
      

end P01;