%% SINCRONIZAR CODIGO MATLAB CON LA VERSION PUBLICABLE
% Ejecutar desde la carpeta del proyecto o invocar mediante Run.
raiz = fileparts(mfilename('fullpath'));
origen = fullfile(raiz,'live_scripts','bloque_1');
destino = fullfile(raiz,'docs','codigo');
if ~exist(destino,'dir'), mkdir(destino); end
archivos = dir(fullfile(origen,'cap_*.m'));
assert(~isempty(archivos),'No se encontraron scripts en live_scripts/bloque_1');
for i=1:numel(archivos)
    a=fullfile(origen,archivos(i).name);
    b=fullfile(destino,archivos(i).name);
    [bien,mensaje]=copyfile(a,b,'f');
    assert(bien,'No se pudo copiar %s: %s',archivos(i).name,mensaje);
    fprintf('Sincronizado: %s\n',archivos(i).name);
end
fprintf('Total: %d archivos MATLAB sincronizados.\n',numel(archivos));
