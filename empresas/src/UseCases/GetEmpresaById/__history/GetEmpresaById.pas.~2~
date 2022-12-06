unit GetEmpresaById;

interface

uses
  GetEmpresaById.Controller;

function GetController: TGetEmpresaByIdController;

implementation

uses
  Models.DaoGeneric, Empresa.Entity	, GetEmpresaById.UseCase;

function GetController: TGetEmpresaByIdController;
var
  DaoEmpresas: iDAOGeneric<TEmpresas>;
  GetEmpresaByIdUseCase: iGetEmpresaByIdUseCase;
begin
  DaoEmpresas := TDAOGeneric<TEmpresas>.Create;
  GetEmpresaByIdUseCase := TGetEmpresaByIdUseCase.Create(DaoEmpresas);
  result := TGetEmpresaByIdController.Create(GetEmpresaByIdUseCase);
end;

end.
