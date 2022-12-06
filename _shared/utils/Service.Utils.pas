unit Service.Utils;

interface

uses
  System.Generics.Collections, System.JSON, System.SysUtils, System.StrUtils;

type
  TUtils = class
  private
  public
    class procedure TryFreeAndNil(objeto: TObject);
    class function PegarValor(JSON, campo: string; index: integer = 0): string;
    class function ObjectListToJsonArray<T: Class>(aList: TObjectList<T>): TJsonArray;
  end;

implementation

uses
  REST.JSON;

{ TUtils }

class function TUtils.ObjectListToJsonArray<T>(aList: TObjectList<T>): TJsonArray;
var
  I: integer;
begin
  result := TJsonArray.Create;

  for I := 0 to aList.Count - 1 do
  begin
    result.Add(TJson.ObjectToJsonObject(aList[I]));
  end;
end;

class function TUtils.PegarValor(JSON, campo: string;
  index: integer = 0): string;
var
  JSONObject: TJSONObject;
  JSONArray: TJsonArray;
  JSONValue: TJSONValue;
  valor: String;
begin
  if (JSON = EmptyStr) or (JSON = '[]') or (JSON = '{}') then
  begin
    result := '';
    Exit;
  end;

  JSONValue := TJSONObject.ParseJSONValue(JSON);

  // pega o retorno de um json e retorna o valor do campo desejado
  if JSONValue is TJSONObject then
    JSONObject := JSONValue as TJSONObject
  else if JSONValue is TJsonArray then
    JSONArray := JSONValue as TJsonArray
  else
  begin
    if JSONValue <> nil then
      TryFreeAndNil(JSONValue);

    Exit;
  end;

  if JSONValue is TJSONObject then
  begin
    if Assigned(JSONObject.GetValue(campo)) then
    begin
      result := ifthen((JSONObject.GetValue(campo).Value <> '') or
        (JSONObject.GetValue(campo).ToJson = '""'), JSONObject.GetValue(campo)
        .Value, JSONObject.GetValue(campo).ToJson);
    end
    else
    begin
      result := '';
      TryFreeAndNil(JSONObject);
      Exit;
    end;

    TryFreeAndNil(JSONObject)
  end
  else if JSONValue is TJsonArray then
  begin
    if JSONArray.Get(index) <> nil then
    begin
      valor := ifthen((JSONArray.Get(index).Value <> '') or
        (JSONArray.Get(index).ToString = '""'), JSONArray.Get(index).Value,
        JSONArray.Get(index).ToString);
      TryFreeAndNil(JSONArray);

      if campo = '' then
        result := valor
      else
        result := PegarValor(valor, campo);
    end
    else
    begin
      result := '';
      TryFreeAndNil(JSONArray);
    end;
  end;
end;

class procedure TUtils.TryFreeAndNil(objeto: TObject);
begin
  try
    FreeAndNil(objeto);
  except
  end;
end;

end.
