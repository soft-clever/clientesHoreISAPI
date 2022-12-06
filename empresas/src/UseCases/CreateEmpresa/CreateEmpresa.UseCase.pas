unit CreateEmpresa.UseCase;

interface

uses Models.DaoGeneric, Empresa.Entity, System.JSON, UsuariosXEmpresas.Entity,
  ClassServicosREST;

type
  iCreateEmpresaUseCase = interface
    ['{a5e986e3-8cbb-49a1-93b2-c588509801b1}']
    function execute(body: TJSONObject; idUsuario: Integer): TEmpresas;
  end;

  TCreateEmpresaUseCase = class(TInterfacedObject, iCreateEmpresaUseCase)
  private
    FDAOEmpresa: iDAOGeneric<TEmpresas>;
  public
    constructor Create(Value: iDAOGeneric<TEmpresas>);
    function execute(body: TJSONObject; idUsuario: Integer): TEmpresas;
  end;

implementation

uses REST.JSON;

constructor TCreateEmpresaUseCase.Create(Value: iDAOGeneric<TEmpresas>);
begin
  FDAOEmpresa := Value;
end;

function TCreateEmpresaUseCase.execute(body: TJSONObject; idUsuario: Integer): TEmpresas;
var
  Empresa: TEmpresas;
  UsuarioXEmpresa: TUsuariosXEmpresas;
begin
  Empresa := TJson.JsonToObject<TEmpresas>(body);
  FDAOEmpresa.Insert(Empresa);

  TServicosRest

  result := Empresa;
end;

end.
