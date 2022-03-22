t = linspace(0,10,100);
x = sin(t);
s = 4;

%%%% AMPLITUDE SCALING
function amp_scale(x,t,a)
figure
plot(t,a*x)
end

%%%% MIRRORING
function mir_time(x,t)
figure
plot(-t,x)
end

%%%% TIME SHIFT
function t_shift(x,t,sh)
figure
plot(t+sh,x)
end

%%%% EXPANSION
function expand(x,t,sc)
figure
plot(t.*sc,x)
end

%%%% COMPRESSION
function compress(x,t,sc)
figure
plot(t./sc,x)
end

%%% ONE FUNCTION TO RULE THEM ALL
function operations(x,t,c)
    switch (c)
        case 1
            %a = insert input here
            amp_scale(x,t,a)
        case 2
            mir_time(x,t)
        case 3
            % s = insert input here
            t_shift(x,t,s)
        case 4
            % s = insert input here
            expand(x,t,s)
        case 5
            % s = insert input here
            compress(x,t,s)
        otherwise
            figure
            plot(t,x)
    end
end