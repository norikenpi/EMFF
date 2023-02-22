# EMFF
READMEに，使えるファイルを書かないとなー

READMEにどのファイルどうつかったらどういうことができるかまとめないとなー

Ampere2.mは原点にあるN巻き，半径a，電流Iのコイルによって，(x, y, z)にあるN巻き，半径a，電流I_x, I_y, I_zのコイルに発生するアンペール力（力，トルク）を計算．

coil_dipole.mでコイルを磁気双極子に近似したものと近似していないものの比較ができる．
coil_FT.mでいろんな相対姿勢でビオサバールとアンペールで電磁力とトルクを計算する．

dipole2em_force_torque.mで磁気双極子から電磁力と電磁トルクを出力

euler.m オイラー法の実装

dynamics2record.mで任意の場所から10^-5Nの上限でレコード盤軌道にもって行く制御

dynamic2record_movie.mで1つの衛星がレコード盤軌道に投入されるシミュレーション動画．dynamics2record.mを改造．フィードバックゲインに注意しろ！
dynamic2record_movie2.mの方が収束性はいい．

force2current.mで所望の力を電流に変換する．

homotopy.mホモトピー法の実装qiita参考．

plot_magnetic_field_FT2.mで特定の位置姿勢，電流，分割電流数での相手のコイルにかかる力とトルクを計算
plot_magnetic_field_FT2_dipole.mで特定の位置姿勢，電流，分割電流数での相手のコイルにかかる力とトルクをダイポール近似で計算．巻き数とかが変数に入ってないなー


test3.mでトルクがほぼ0になる値をプロット
test8.mで地球の磁場を計算
test9.mはchatGPTで生成したコード．matlabで動画を生成し，保存するためのコード．
test10.mでコイルjの電流要素から見た，コイルkの電流要素の位置ベクトルを表示（I_ij確かめるために使った）.plot_magnetic_field_FT2.mと同じ．計算の仕方が違う．逆問題を解くための式のバグ取りのため．
test12.mはtest10.mを改造して，特定の力を出すために必要な電流を出力するためのコード

test11.mは特定の力を出すために必要な電流を出力して，その値をplot_magnetic_field_FT2.mで検証している．最大電流も定義してるから，実際に出せる力がこのコードでわかる．

two_satellite_record_movie.mはコイルや距離によって発生できる電磁力の上限が決まることをビオサバールを用いた逆計算をして電磁力を決めている．





