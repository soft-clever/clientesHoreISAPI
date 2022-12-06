unit CreateEmpresa;

interface

uses CreateEmpresa.Controller;

function getController(): TCreateEmpresaController;

implementation

uses Models.DaoGeneric, Empresa.Entity, CreateEmpresa.UseCase;

function getController(): TCreateEmpresaController;
var
  DaoEmpresa: iDAOGeneric<TEmpresas>;
  CreateEmpresaUseCase: TCreateEmpresaUseCase;
begin
  DaoEmpresa := TDAOGeneric<TEmpresas>.Create;
  CreateEmpresaUseCase := TCreateEmpresaUseCase.Create(DaoEmpresa);
  result := TCreateEmpresaController.Create(CreateEmpresaUseCase);
end;

end.
