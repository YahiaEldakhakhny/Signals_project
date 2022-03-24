clc
disp("Welcome to our function generator ")
disp("get in with your right leg")
i=1;
freq=input("Enter the Sampling Frequency of the Signal ");
start_t=input("Enter the Start time of the Signal ");
end_t=input("Enter the end time of the Signal ");
sampling=freq*(end_t-start_t);

current_t=start_t;
next_t=end_t;

current_s=1;
next_s=0;

while end_t<start_t
    disp('invalid end time cannot be less than start time ')
    end_t=input("Enter the end time of the Signal ");
end 

t = linspace(start_t,end_t,sampling);




%%break_points


brk_pts_no=input("Enter the number of break points in the signal ");
brk_pts=ones(1,brk_pts_no);



    while i<=brk_pts_no
        brk_pts_in=input(sprintf("Enter the time of break point no %d ",i )); 

        if (brk_pts_in<=start_t || brk_pts_in>=end_t)
            disp("Input is not in range of the time limit");
        else
             brk_pts(1,i)= brk_pts_in;

             i=i+1;
        end 
    end
    brk_pts(1,i)= end_t;

    brk_pts=sort(brk_pts);
    
    times=ones(1,brk_pts_no+1);
    functions=t;

brk_pts
for i=1:brk_pts_no+1
    
        next_t=brk_pts(i);
        sampling=freq*(next_t-current_t);        
        tx=linspace(current_t,next_t,sampling);
        next_s=current_s+sampling;
        
        
%function generator
    c = input('Enter the type of signal.(1=DC, 2=Ramp, 3=Polynomial, 4=exponential, 5=Sinusoidal, 9=end)');% Here, the user selects the desired signal type (Note that 9 is not ready yet)
    switch c
        case 1%dc
            a = input('Amplitude = ');
            x = a*ones(1,sampling);
            
        case 2%ramp
            a = input('Slope = ');
            b = input('The ramp intercepts y-axis at y = ');
            x = a*tx +b;
            
        case 3 %poly
            n = input ('The order = ');
            Z = ones(1,n+1); % A row vector of length = n+1 shall carry the coefficients of each term
            x = 0;
            
            for j = length(Z):-1:1
                Z(j) = input (['Coefficent for t^' num2str(j-1) '= ']);%At each loop, the user enters the coeff of each term, starting with the highest power.
                temp = Z(j).*tx.^(j-1);
                x = x + temp;
            end

        case 4%exp

            a = input('Amplitude = ');
            b = input('Exponent = ');
            x = a.*exp(b*tx);
        case 5 %sin
            a = input('Amplitude = ');
            f = input('Frequency = ');
            s = input('Phase = ');
            x = a*sin((2*pi*f).*tx + s);

    end
 
    current_s
    next_s
    sampling
    current_t
    next_t
    
    
    
     functions(current_s:next_s-1)=x;
     current_s=next_s;
     current_t=next_t;
    
end    
 


figure
plot(t,functions)
grid on
grid minor



txt = input("Do you want to perform an operation on the signal ? Y/N: ","s");
x2=functions;
t2=t;


% invalid character check
while (~strcmp(lower(txt),"n") )
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
            x2=scale*x2;
            figure
            plot(t,x2)
        case 'b'
            t2=-t2;
            figure
            plot(t2,x2)
        case 'c'
            shift=input("Enter the shift value ");
            t2=t2+shift;
            figure
            plot(t2,x2)
        case 'd'
            expand=input("Enter the Expanding value ");
            t2=t2.*expand;
           figure
           plot(t2,x2)
        case 'e'
            compress=input("Enter the Compressing value ");
            t2=t2./compress;
            figure
            plot(t2,x2)
        case 'f'
            break;
        otherwise
            disp("invalid character")
           
    end
    txt = input("Do you want to perform any other operation ? Y/N : ","s");
    
    
end
 disp("Thank you for using our signal generator.")
 disp("Feel free to leave a tip for the developers")
 disp("adios")
