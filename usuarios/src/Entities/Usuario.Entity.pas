unit Usuario.Entity;

interface

uses
  SimpleAttributes, SimpleDAO,
  System.Generics.Collections, Validacoes.Utils, Horse;

type

  [Tabela('usuarios')]
  TUsuarios = class

  private
    FId: Integer;
    Fnome: String;
    FultimoNome: String;
    Femail: String;
    Fsenha: String;
    Fcelular: String;
    Fstatus: String;
    Fuser_token: String;
    Fvendedor_id: Integer;

  public
    [Campo('id'), PK, AutoInc]
    property id: Integer read FId write FId;

    [Campo('nome')]
    property nome: String read Fnome write Fnome;

    [Campo('ultimo_nome')]
    property ultimoNome: String read FultimoNome write FultimoNome;

    [Campo('email')]
    property email: String read Femail write Femail;

    [Campo('senha')]
    property senha: String read Fsenha write Fsenha;

    [Campo('celular')]
    property celular: String read Fcelular write Fcelular;

    [Campo('status')]
    property status: String read Fstatus write Fstatus;

    [Campo('user_token')]
    property user_token: String read Fuser_token write Fuser_token;

    [Campo('vendedor_id')]
    property vendedor_id: Integer read Fvendedor_id write Fvendedor_id;

    destructor Destroy; override;

    procedure Validate(validateStatus: TValidateType = vtNone);
  end;

implementation

destructor TUsuarios.Destroy;
begin
  inherited;
end;

procedure TUsuarios.Validate(validateStatus: TValidateType);
begin
  if validateStatus = vtInsert then
  begin

    if nome = '' then
      raise EHorseException.New.Error('Nome ? obrigat?rio');

    if ultimoNome = '' then
      raise EHorseException.New.Error('Sobrenome ? obrigat?rio');

    if not(TValidacoes.isEmailValido(email)) then
      raise EHorseException.New.Error('Email inv?lido');

    if (not TValidacoes.isCelularValido(celular)) and
      (not TValidacoes.isTelefoneValido(celular)) then
      raise EHorseException.New.Error('Celular inv?lido');

    if not(TValidacoes.isSenhaForte(senha)) then
      raise EHorseException.New.Error('Senha fraca');

  end;
end;

end.
