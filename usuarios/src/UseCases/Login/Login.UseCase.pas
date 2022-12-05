unit Login.UseCase;

interface

uses
  Models.DaoGeneric, System.Generics.Collections,
  Usuario.Entity, System.SysUtils;

type
  TLoginUseCase = class
  private
    FDAOUsuarios: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(email, senha: string): TUsuarios;
  end;

implementation

{ TListAllClientesUseCase }
constructor TLoginUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOUsuarios := Value;
end;

function TLoginUseCase.execute(email, senha: string): TUsuarios;
begin
  result := TUsuarios.Create;

  try
    FDAOUsuarios.Find(
      '*',
      'email = ' + QuotedStr(email) +
      ' and senha = sha2(' + QuotedStr(senha) + ', 256)',
    '', '', '', result);
  except
    begin
      raise Exception.Create('Email ou senha preenchidos incorretamente');
    end;
  end;
end;

end.
