clc
disp("Welcome to our function generator ")
disp("get in with your right leg")

freq=input("Enter the Sampling Frequency of the Signal ");
start_t=input("Enter the Start time of the Signal ");
end_t=input("Enter the end time of the Signal ");

while end_t<start_t
    disp('invalid end time cannot be less than start time ')
    end_t=input("Enter the end time of the Signal ");
end 

t = linspace(start_t,end_t,freq);

brk_pts_no=input("Enter the number of break points in the signal ");
brk_pts=ones(1,brk_pts_no);
i=1;
while i<=brk_pts_no
    brk_pts_in=input(sprintf("Enter the time of break point no %d ",i )); 
    
    if (brk_pts_in<=start_t || brk_pts_in>=end_t)
        disp("Input is not in range of the time limit");
    else
     brk_pts(i)= brk_pts_in;
     i=i+1;
    end 
end


%sherif
x = sin(2*pi*t);














figure
plot(t,x)



clc
txt = input("Do you want to perform an operation on the signal ? Y/N [Y]: ","s");
while ( strcmp(txt,"Y") || strcmp(txt,"y"))
    clc
    disp("Enter the letter of your choice")
    disp("a.Amplitude Scaling")
    disp("b.Time reversal")
    disp("c.Time shift")
    disp("d.Expanding the signal")
    disp("e.Compressing the signal")
    disp("f.None")
    
    choice= input("","s");
    
    switch (choice)
        case 'a'
            scale=input("Enter the scale");
            x=scale*x;
            figure
            plot(t,x)
        case 'b'
            t=-t;
            figure
            plot(t,x)
        case 'c'
            shift=input("Enter the shift value");
            t=t+shift;
            figure
            plot(t,x)
        case 'd'
            expand=input("Enter the Expanding value");
            t=t.*expand;
           figure
           plot(t,x)
        case 'e'
            compress=input("Enter the Compressing value");
            t=t./compress;
            figure
            plot(t,x)
        otherwise
            break;
           
    end
    txt = input("Do you want to perform any other operation ? Y/N : ","s");
end
 disp("Thank you for using our signal generator.")
 disp("Feel free to leave a tip for the developers")


  
  
  
 