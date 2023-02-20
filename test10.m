
%
%コイルjの電流要素から見た，コイルkの電流要素の位置ベクトルを表示

a = 0.015;
x_j = [0, 0, 0];
E_j = [pi/2, pi/3, pi/4];
q_j = quaternion(E_j,'euler','XYZ','point');
theta = deg2rad(180);
dl_j = rotatepoint(q_j, [-a*sin(theta), a*cos(theta), 0]);
x_jR = x_j + rotatepoint(q_j, [a*cos(theta), a*sin(theta), 0]);
x_jR0 = x_j + rotatepoint(q_j, [a, 0, 0]);

%2つの座標系の相対姿勢を表すクオータンイオンを計算して検算してる．
%q_kj = quatmultiply(q_k, quatconj(q_j));
%q_kk = q_kj * q_j;

x_k = [10, 5, 1];
E_k = [pi/5, pi/6, pi/7];
q_k = quaternion(E_k,'euler','XYZ','point');
phi = deg2rad(-120);
dl_k = rotatepoint(q_k, [-a*sin(phi), a*cos(phi), 0]);
x_kR = x_k + rotatepoint(q_k, [a*cos(phi), a*sin(phi), 0]);
x_kR0 = x_k + rotatepoint(q_k, [a, 0, 0]);


%電流要素から電流要素へのベクトル
r_jk = x_kR - x_jR;


a = 0.015;
N = 1;
split = 10;
myu0 = 1.2566*10^(-6);

i_j = [1 2 3] ;
i_k = [1 2 3] ;

%E_j = [pi/3,0,pi/4];
%q_j = quaternion(E_j,'euler','XYZ','point');
I_j1 = zeros(1,3);
I_j2 = zeros(1,3);
I_j3 = zeros(1,3);

for j = 1:3
    I_j1 =  I_j1 + i_j(j)*calculateI(x_j, x_k, q_j, q_k, split, a, j, 1);
    I_j2 =  I_j2 + i_j(j)*calculateI(x_j, x_k, q_j, q_k, split, a, j, 2);
    %disp(I_j2)
    I_j3 =  I_j3 + i_j(j)*calculateI(x_j, x_k, q_j, q_k, split, a, j, 3);
    %disp(I_j3)
end

S = N*[I_j1.', I_j2.', I_j3.'];
%disp(S)
F = myu0/(4*pi)*N*S*i_k.';
disp(F)







figure
draw_coil(x_j, q_j, a)
plot3(x_jR0(1), x_jR0(2), x_jR0(3),'o','MarkerSize',5,'MarkerFaceColor','r')
plot3(x_jR(1), x_jR(2), x_jR(3),'o','MarkerSize',5,'MarkerFaceColor','b')
quiver3(x_jR(1), x_jR(2), x_jR(3),dl_j(1), dl_j(2), dl_j(3));

draw_coil(x_k, q_k, a)
plot3(x_kR0(1), x_kR0(2), x_kR0(3),'o','MarkerSize',5,'MarkerFaceColor','r')
plot3(x_kR(1), x_kR(2), x_kR(3),'o','MarkerSize',5,'MarkerFaceColor','b')
quiver3(x_kR(1), x_kR(2), x_kR(3),dl_k(1), dl_k(2), dl_k(3));

quiver3(x_j(1), x_j(2), x_j(3), F(1)*10^5, F(2)*10^5, F(3)*10^5);

quiv = quiver3(x_jR(1), x_jR(2), x_jR(3),r_jk(1), r_jk(2), r_jk(3));
quiv.AutoScale = 'off';

axis_norm = 0.2;
axis([-axis_norm,axis_norm,-axis_norm,axis_norm,-axis_norm,axis_norm])
axis square
grid on





