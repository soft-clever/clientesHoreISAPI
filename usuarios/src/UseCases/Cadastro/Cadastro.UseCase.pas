unit Cadastro.UseCase;

interface

uses
  Models.DaoGeneric, System.Generics.Collections,
  Usuario.Entity, System.SysUtils, System.JSON, REST.JSON, Validacoes.Utils,
  Horse.Exception, Service.Utils;

type
  iCadastroUseCase = interface
    ['{fe844b48-6528-48fa-a745-a8c0606a8bf7}']
    function execute(body: TJSONObject): TUsuarios;
  end;

  TCadastroUseCase = class(TInterfacedObject, iCadastroUseCase)
  private
    FDAOUsuarios: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(body: TJSONObject): TUsuarios;
  end;

implementation

constructor TCadastroUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOUsuarios := Value;
end;

function TCadastroUseCase.execute(body: TJSONObject): TUsuarios;
var
  Usuario: TUsuarios;
begin
  FDAOUsuarios.Find('email', TUtils.PegarValor(body.ToJSON, 'email'), Usuario);
  if Assigned(Usuario) then
    raise EHorseException.New.Error('Email j� cadastrado');

  Usuario := TJson.JsonToObject<TUsuarios>(body);
  Usuario.Validate(vtInsert);

  FDAOUsuarios.Insert(usuario);
  result := Usuario;
end;

end.
