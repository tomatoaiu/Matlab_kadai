%�摜�̊i�[
%rgb = imread('Colorful-Circle-Fractal.png');
%rgb = imread('images.png');
%rgb = imread('12-color-circles-hi.png');
rgb = imread('coloredChips.png');
%rgb = imread('aaaa.png');

figure
imshow(rgb) %���摜�̕\��

circleSize = 0.92;

% �ŏ��̉~�̃T�C�Y���擾
minSize = '�ŏ��T�C�Y�̉~�̑傫������͂��Ă�������? ';
x = input(minSize);

% �ő�̉~�̃T�C�Y���擾
maxSize = '�ő�T�C�Y�̉~�̑傫������͂��Ă�������? ';
y = input(maxSize);


while 1
    
    %�@�ŏ����ő������Ȃ��悤�ɂ���
    if x > y
        disp('�ŏ������������Ă�������')
    else
        break;
    end
    
    % �ŏ��̉~�̃T�C�Y���擾
    minSize = '�ŏ��T�C�Y�̉~�̑傫������͂��Ă�������? ';
    x = input(minSize);

    % �ő�̉~�̃T�C�Y���擾
    maxSize = '�ő�T�C�Y�̉~�̑傫������͂��Ă�������? ';
    y = input(maxSize);
    
end

% ���a�͈͓̔��̃C���[�W���ɂ���Â��~�����ׂČ���
[centers, radii] = imfindcircles(rgb,[x y], 'ObjectPolarity','dark', ...
          'Sensitivity',circleSize,'Method','twostage');

% �~�ɗւ�킹��
h = viscircles(centers,radii);

length(centers);

[centersBright, radiiBright, metricBright] = imfindcircles(rgb,[x y], ...
    'ObjectPolarity','bright','Sensitivity',circleSize,'EdgeThreshold',0.1);

hBright = viscircles(centersBright, radiiBright,'Color','b');

