unit UsuariosXEmpresas.Entity;

interface

uses
  SimpleAttributes, SimpleDAO, Horse, Empresa.Entity, Usuario.Entity,
  System.Generics.Collections, Validacoes.Utils, System.SysUtils, Banco.Utils;

type

  [Tabela('usuarios_x_empresas')]
  TUsuariosXEmpresas = class

  private
    FId: Integer;
    FIdEmpresa: Integer;
    FIdUsuario: Integer;
    FIdGrupoUsuario: Integer;

    procedure SetIdEmpresa(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetIdGrupoUsuario(const Value: Integer);
  public
    [Campo('id'), PK, AutoInc]
    property Id: Integer read FId write FId;

    [Campo('id_empresa'), FK]
    property IdEmpresa: Integer read FIdEmpresa write FIdEmpresa;

    [Campo('id_usuario'), FK]
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;

    [Campo('id_grupo_usuario'), FK]
    property IdGrupoUsuario: Integer read FIdGrupoUsuario write FIdGrupoUsuario;

    destructor Destroy; override;
    procedure Validate(validateStatus: TValidateType = vtNone);
  end;

implementation

destructor TUsuariosXEmpresas.Destroy;
begin
  inherited;
end;

procedure TUsuariosXEmpresas.Validate(validateStatus: TValidateType);
begin
  if IdEmpresa <= 0 then
    raise EHorseException.New.Error('ID da Empresa é obrigatório');

  if IdUsuario <= 0 then
    raise EHorseException.New.Error('ID do Usuário é obrigatório');

  if IdGrupoUsuario <= 0 then
    raise EHorseException.New.Error('ID do Grupo é obrigatório');
end;

procedure TUsuariosXEmpresas.SetIdEmpresa(const Value: Integer);
begin
  if not(TBancoUtils.Existe<TEmpresas>('id', Value)) then
    raise EHorseException.New.Error('Empresa informada não existe');

  FIdEmpresa := Value;
end;

procedure TUsuariosXEmpresas.SetIdUsuario(const Value: Integer);
begin
  if not(TBancoUtils.Existe<TUsuarios>('id', Value)) then
    raise EHorseException.New.Error('Empresa informada não existe');

  FIdUsuario := Value;
end;

procedure TUsuariosXEmpresas.SetIdGrupoUsuario(const Value: Integer);
begin
//  if not(TBancoUtils.Existe<TEmpresas>('id', Value)) then
//    raise EHorseException.New.Error('Empresa informada não existe');

  FIdGrupoUsuario := Value;
end;

end.
