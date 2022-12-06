unit Service.Utils;

interface

uses
  System.Generics.Collections, System.JSON;

type
  TUtils = class
  public
    function ObjectListToJsonArray<T: Class>(aList: TObjectList<T>): TJsonArray;
  end;

implementation

uses
  REST.Json;

{ TUtils }

function TUtils.ObjectListToJsonArray<T>(
  aList: TObjectList<T>): TJsonArray;
var
  I : integer;
begin
  result := TJSONArray.Create;

  for I := 0 to aList.Count -1 do
  begin
    result.Add(TJson.ObjectToJsonObject(aList[I]));
  end;
end;

end.
