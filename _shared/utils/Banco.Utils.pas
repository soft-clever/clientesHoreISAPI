unit Banco.Utils;

interface

uses
  Models.DaoGeneric, Service.Utils, System.SysUtils;

type
  TBancoUtils = class
  private
  public
    class function Existe<T: class, constructor>(campo: string;
      valor: Variant): Boolean;
  end;

implementation

class function TBancoUtils.Existe<T>(campo: string; valor: Variant): Boolean;
var
  Obj: T;
  DaoGeneric: TDAOGeneric<T>;
begin
  DaoGeneric := TDAOGeneric<T>.Create;
  try
    DaoGeneric.Find(campo, valor, Obj);
  except
    on e: Exception do
    begin
      result := false;
      exit;
    end;
  end;
  result := true;
end;

end.
