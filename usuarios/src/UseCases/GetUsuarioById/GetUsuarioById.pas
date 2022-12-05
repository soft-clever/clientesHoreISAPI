unit GetUsuarioById;

interface

uses
  GetUsuarioById.Controller;

function GetController: TGetUsuarioByIdController;

implementation

uses
  Models.DaoGeneric, Usuario.Entity	, GetUsuarioById.UseCase;

function GetController: TGetUsuarioByIdController;
var
  DaoUsuarios: iDAOGeneric<TUsuarios>;
  GetUsuarioByIdUseCase: iGetUsuarioByIdUseCase;
begin
  DaoUsuarios := TDAOGeneric<TUsuarios>.Create;
  GetUsuarioByIdUseCase := TGetUsuarioByIdUseCase.Create(DaoUsuarios);
  result := TGetUsuarioByIdController.Create(GetUsuarioByIdUseCase);
end;

end.
