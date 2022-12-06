unit GetAllEmpresas.UseCase;

interface

uses
  Models.DaoGeneric, System.Generics.Collections,
  Empresa.Entity, Horse;

type
  iGetAllEmpresasUseCase = interface
    ['{5c1896e1-7388-458a-a8cd-d8f4a7e41daf}']
    function execute(limit: Integer = 20; page: Integer = 1)
      : TObjectList<TEmpresas>;
  end;

  TGetAllEmpresasUseCase = class(TInterfacedObject, iGetAllEmpresasUseCase)
  private
    FDAOEmpresas: iDAOGeneric<TEmpresas>;
  public
    constructor Create(Value: iDAOGeneric<TEmpresas>);
    function execute(limit: Integer = 20; page: Integer = 1)
      : TObjectList<TEmpresas>;
  end;

implementation

constructor TGetAllEmpresasUseCase.Create(Value: iDAOGeneric<TEmpresas>);
begin
  FDAOEmpresas := Value;
end;

function TGetAllEmpresasUseCase.execute(limit: Integer = 20; page: Integer = 1)
  : TObjectList<TEmpresas>;
begin
  result := TObjectList<TEmpresas>.Create();
  FDAOEmpresas.Find(result, limit, page);
end;

end.
