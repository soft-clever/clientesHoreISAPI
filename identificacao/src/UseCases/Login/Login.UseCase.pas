unit Login.UseCase;

interface

uses
  Models.DaoGeneric, System.Generics.Collections,
  Usuario.Entity, System.SysUtils, Horse;

type
  iLoginUseCase = interface
    ['{aff50203-e8ac-4de0-a902-f165df0cefb4}']
    function execute(email, senha: string): TUsuarios;
  end;

  TLoginUseCase = class
  private
    FDAOUsuarios: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(email, senha: string): TUsuarios;
  end;

implementation

constructor TLoginUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOUsuarios := Value;
end;

function TLoginUseCase.execute(email, senha: string): TUsuarios;
begin
  result := TUsuarios.Create;
  try
    FDAOUsuarios.Find('*', 'email = ' + QuotedStr(email) + ' and senha = sha2('
      + QuotedStr(senha) + ', 256)', '', '', '', result);
  except
    on e: Exception do
      raise EHOrseException.new.Error
        ('Email ou senha preenchidos incorretamente');
  end;
end;

end.
