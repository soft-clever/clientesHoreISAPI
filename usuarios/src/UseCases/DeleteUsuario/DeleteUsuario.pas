unit DeleteUsuario;

interface

uses
  DeleteUsuario.Controller;

function GetController: TDeleteUsuarioController;

implementation

uses
  Models.DaoGeneric, Usuario.Entity, DeleteUsuario.UseCase;

function GetController: TDeleteUsuarioController;
var
  DaoUsuarios: iDAOGeneric<TUsuarios>;
  DeleteUsuarioUseCase: iDeleteUsuarioUseCase;
begin
  DaoUsuarios := TDAOGeneric<TUsuarios>.Create;
  DeleteUsuarioUseCase := TDeleteUsuarioUseCase.Create(DaoUsuarios);
  result := TDeleteUsuarioController.Create(DeleteUsuarioUseCase);
end;

end.
