%画像の格納
%rgb = imread('Colorful-Circle-Fractal.png');
%rgb = imread('images.png');
%rgb = imread('12-color-circles-hi.png');
rgb = imread('coloredChips.png');
%rgb = imread('aaaa.png');

figure
imshow(rgb) %元画像の表示

circleSize = 0.92;

% 最小の円のサイズを取得
minSize = '最小サイズの円の大きさを入力してください? ';
x = input(minSize);

% 最大の円のサイズを取得
maxSize = '最大サイズの円の大きさを入力してください? ';
y = input(maxSize);


while 1
    
    %　最少が最大を上回らないようにする
    if x > y
        disp('最小を小さくしてください')
    else
        break;
    end
    
    % 最小の円のサイズを取得
    minSize = '最小サイズの円の大きさを入力してください? ';
    x = input(minSize);

    % 最大の円のサイズを取得
    maxSize = '最大サイズの円の大きさを入力してください? ';
    y = input(maxSize);
    
end

% 半径の範囲内のイメージ内にある暗い円をすべて検索
[centers, radii] = imfindcircles(rgb,[x y], 'ObjectPolarity','dark', ...
          'Sensitivity',circleSize,'Method','twostage');

% 円に輪を被せる
h = viscircles(centers,radii);

length(centers);

[centersBright, radiiBright, metricBright] = imfindcircles(rgb,[x y], ...
    'ObjectPolarity','bright','Sensitivity',circleSize,'EdgeThreshold',0.1);

hBright = viscircles(centersBright, radiiBright,'Color','b');

