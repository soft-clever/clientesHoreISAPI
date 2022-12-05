unit GetAllUsuarios;

interface

uses
  GetAllUsuarios.Controller;

function GetController: TGetAllUsuariosController;

implementation

uses
  Models.DaoGeneric, Usuario.Entity, GetAllUsuarios.UseCase;

function GetController: TGetAllUsuariosController;
var
  DaoUsuarios: iDAOGeneric<TUsuarios>;
  GetAllUsuariosUseCase: TGetAllUsuariosUseCase;
begin
  DaoUsuarios := TDAOGeneric<TUsuarios>.Create;

  GetAllUsuariosUseCase := TGetAllUsuariosUseCase.Create(DaoUsuarios);

  result := TGetAllUsuariosController.Create(GetAllUsuariosUseCase);
end;

end.
