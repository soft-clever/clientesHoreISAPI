unit Cadastro;

interface

uses
  Cadastro.Controller;

function GetController: TCadastroController;

implementation

uses
  Models.DaoGeneric, Usuario.Entity, Cadastro.UseCase;

function GetController: TCadastroController;
var
  DaoUsuarios: iDAOGeneric<TUsuarios>;
  CadastroUseCase: TCadastroUseCase;
begin
  DaoUsuarios := TDAOGeneric<TUsuarios>.Create;

  CadastroUseCase := TCadastroUseCase.Create(DaoUsuarios);

  result := TCadastroController.Create(CadastroUseCase);
end;

end.
