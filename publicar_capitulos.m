%% PUBLICAR CAPITULOS MATLAB COMO PAGINAS HTML COMPLEMENTARIAS
% Conservar docs/capitulos: páginas didácticas más completas.
% Crea docs/matlab_export. Requiere MATLAB y función publish.
clc;
raiz = fileparts(mfilename('fullpath'));
run(fullfile(raiz,'sincronizar_codigo.m'));
origen = fullfile(raiz,'live_scripts','bloque_1');
destino = fullfile(raiz,'docs','matlab_export');
if ~exist(destino,'dir'),mkdir(destino);end
archivos = dir(fullfile(origen,'cap_*.m'));
for i=1:numel(archivos)
    archivo = fullfile(origen,archivos(i).name);
    fprintf('Exportando: %s\n',archivos(i).name);
    opciones = struct('format','html','outputDir',destino,...
        'showCode',true,'evalCode',true,'catchError',false);
    publish(archivo,opciones);
end
fprintf('Publicación de %d capítulos terminada en %s\n',numel(archivos),destino);
