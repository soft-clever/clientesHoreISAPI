unit GetAllEmpresas;

interface

uses
  Models.DaoGeneric, Empresa.Entity, GetAllEmpresas.Controller;

function GetController: TGetAllEmpresasController;

implementation

uses
  GetAllEmpresas.UseCase;

function GetController: TGetAllEmpresasController;
var
  DaoEmpresas: iDAOGeneric<TEmpresas>;
  GetAllEmpresasUseCase: iGetAllEmpresasUseCase;
begin
  DaoEmpresas := TDAOGeneric<TEmpresas>.Create;

  GetAllEmpresasUseCase := TGetAllEmpresasUseCase.Create(DaoEmpresas);

  result := TGetAllEmpresasController.Create(GetAllEmpresasUseCase);
end;

end.
