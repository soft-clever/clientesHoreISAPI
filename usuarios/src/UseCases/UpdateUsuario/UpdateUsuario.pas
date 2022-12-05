unit UpdateUsuario;

interface

uses
  UpdateUsuario.Controller;

function GetController: TUpdateUsuarioController;

implementation

uses
  Models.DaoGeneric, Usuario.Entity, UpdateUsuario.UseCase;

function GetController: TUpdateUsuarioController;
var
  DaoUsuarios: iDAOGeneric<TUsuarios>;
  UpdateUsuarioUseCase: iUpdateUsuarioUseCase;
begin
  DaoUsuarios := TDAOGeneric<TUsuarios>.Create;
  UpdateUsuarioUseCase := TUpdateUsuarioUseCase.Create(DaoUsuarios);
  result := TUpdateUsuarioController.Create(UpdateUsuarioUseCase);
end;

end.
