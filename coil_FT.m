
%磁場を発生させるコイル
p1 = 0;
q1 = 0;
l1 = 0;

%力を受けるコイル
p2 = 0;
q2 = 0;
%l2 = 0;
x = 0.1;



%[F, T] = plot_magnetic_field_FT(l1, l2, x);
split = 10;
i = 0;
ite1 = 180;
ite2 = 360;
data = zeros(ite1*ite2, 10);
while i < ite1
    i = i + 1;
    l1 = l1 + pi/ite1;
    j = 0;
    l2 = 0;
    %disp(i)
    while j < ite2
        j = j + 1;
        l2 = l2 + 2*pi/ite2;
        [F, T] = plot_magnetic_field_FT2(p1, q1, l1, p2, q2, l2, x, split, split);
        disp((i - 1)*ite2 + j)
        data((i - 1)*ite2 + j,:) = [l1 l2 F(1) F(2) F(3) T(1) T(2) T(3), norm(F), norm(T)]; 

        disp([i, j])
        disp([l1, l2])
        disp([F, T])

        ends
end

%figure
%plot(data(:,10))