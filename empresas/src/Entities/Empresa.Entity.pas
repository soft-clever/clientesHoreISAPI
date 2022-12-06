unit Empresa.Entity;

interface

uses
  SimpleAttributes, SimpleDAO, Horse,
  System.Generics.Collections, Validacoes.Utils, System.SysUtils;

type

  [Tabela('empresas')]
  TEmpresas = class

  private
    FId: Integer;
    FCnpj: String;
    FXrazaoSocial: String;
    FXfant: String;
    FXlgr: String;
    FNro: String;
    FXcpl: String;
    FXbairro: String;
    FCmun: String;
    FXmun: String;
    FUf: String;
    FCep: String;
    FFone: String;
    FIe: String;
    FCrt: String;
    FToken: String;
    FBanco: String;
    FStatus: String;

  public
    [Campo('id'), PK, AutoInc]
    property Id: Integer read FId write FId;

    [Campo('cnpj')]
    property Cnpj: String read FCnpj write FCnpj;

    [Campo('xRazaoSocial')]
    property XrazaoSocial: String read FXrazaoSocial write FXrazaoSocial;

    [Campo('xFant')]
    property Xfant: String read FXfant write FXfant;

    [Campo('xLgr')]
    property Xlgr: String read FXlgr write FXlgr;

    [Campo('nro')]
    property Nro: String read FNro write FNro;

    [Campo('xCpl')]
    property Xcpl: String read FXcpl write FXcpl;

    [Campo('xBairro')]
    property Xbairro: String read FXbairro write FXbairro;

    [Campo('cMun')]
    property Cmun: String read FCmun write FCmun;

    [Campo('xMun')]
    property Xmun: String read FXmun write FXmun;

    [Campo('uf')]
    property Uf: String read FUf write FUf;

    [Campo('cep')]
    property Cep: String read FCep write FCep;

    [Campo('fone')]
    property Fone: String read FFone write FFone;

    [Campo('ie')]
    property Ie: String read FIe write FIe;

    [Campo('crt')]
    property Crt: String read FCrt write FCrt;

    [Campo('token')]
    property Token: String read FToken write FToken;

    [Campo('banco')]
    property Banco: String read FBanco write FBanco;

    [Campo('status')]
    property Status: String read FStatus write FStatus;

    destructor Destroy; override;
    procedure Validate(validateStatus: TValidateType = vtNone);
  end;

implementation

destructor TEmpresas.Destroy;
begin
  inherited;
end;

procedure TEmpresas.Validate(validateStatus: TValidateType);
begin
   if Trim(FCnpj) = '' then
   raise EHorseException.New.Error('CNPJ � obrigat�rio');

   if Trim(FXrazaoSocial) = '' then
   raise EHorseException.New.Error('Raz�o Social � obrigat�ria');

   if Trim(FXfant) = '' then
   raise EHorseException.New.Error('Nome fantasia � obrigat�rio');

   if Trim(FXlgr) = '' then
   raise EHorseException.New.Error('Logradouro � obrigat�rio');

   if Trim(FNro) = '' then
   raise EHorseException.New.Error('N�mero � obrigat�rio');

   if Trim(FXbairro) = '' then
   raise EHorseException.New.Error('Bairro � obrigat�rio');

   if Trim(FCmun) = '' then
   raise EHorseException.New.Error('C�digo do Munic�pio � obrigat�rio');

   if Trim(FXmun) = '' then
   raise EHorseException.New.Error('Munic�pio � obrigat�rio');

   if Trim(FUf) = '' then
   raise EHorseException.New.Error('UF � obrigat�rio');

   if Trim(FCep) = '' then
   raise EHorseException.New.Error('CEP � obrigat�rio');

   if Trim(FFone) = '' then
   raise EHorseException.New.Error('Telefone � obrigat�rio');

   if Trim(FIe) = '' then
   raise EHorseException.New.Error('Inscri��o Estadual � obrigat�ria');

   if Trim(FCrt) = '' then
   raise EHorseException.New.Error('CRT � obrigat�rio');

   if not TValidacoes.isCNPJ(FCnpj) then
   raise EHorseException.New.Error('CNPJ inv�lido');

   if (not TValidacoes.isCelularValido(Fone)) and
   (not TValidacoes.isTelefoneValido(Fone)) then
   raise EHorseException.New.Error('Telefone inv�lido');

   if not TValidacoes.isCEPValido(Cep) then
   raise EHorseException.New.Error('CEP inv�lido');
end;

end.
