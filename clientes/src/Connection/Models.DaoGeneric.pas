unit Models.DaoGeneric;

interface

uses
  System.JSON,
  REST.JSON,
  SimpleInterface,
  SimpleDAO,
  SimpleAttributes,
  SimpleQueryFiredac,
  Data.DB,
  DataSetConverter4D,
  DataSetConverter4D.Impl,
  DataSetConverter4D.Helper,
  DataSetConverter4D.Util, System.Generics.Collections;

type

  iDAOGeneric<T: Class> = interface
    ['{2A6C6ED9-40BC-4AF5-A635-26615D8DD321}']
    function Find(var aList: TObjectList<T>;limit: integer=20; page: integer=1): iDAOGeneric<T>; overload;
    function Find(const aID: String; var aObject: T): iDAOGeneric<T>; overload;
    function Insert(var aObject: T): iDAOGeneric<T>;
    function Update(var aObject: T): iDAOGeneric<T>; overload;
    function Delete(aObject: T): iDAOGeneric<T>;
  end;

  TDAOGeneric<T: class, constructor> = class(TInterfacedObject, iDAOGeneric<T>)
  private
    FIndexConn: Integer;
    FConn: iSimpleQuery;
    FDAO: ISimpleDAO<T>;
    FDataSource: TDataSource;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iDAOGeneric<T>;
    function Find(var aList: TObjectList<T>;limit: integer=20; page: integer=1): iDAOGeneric<T>; overload;
    function Find(const aID: String; var aObject: T): iDAOGeneric<T>; overload;
    function Insert(var aObject: T): iDAOGeneric<T>;
    function Update(var aObject: T): iDAOGeneric<T>; overload;
    function Delete(aObject: T): iDAOGeneric<T>;
  end;

implementation

{ TDAOGeneric<T> }

uses Connection.DbConnection, System.SysUtils, SimpleTypes;

constructor TDAOGeneric<T>.Create;
begin
  FDataSource := TDataSource.Create(nil);
  FIndexConn := Connection.DbConnection.Connected;
  FConn := TSimpleQueryFiredac.New(Connection.DbConnection.FConnList.Items[FIndexConn]).SQLType(MySQL);
  FDAO := TSimpleDAO<T>.New(FConn).DataSource(FDataSource);
end;

function TDAOGeneric<T>.Delete(aObject: T): iDAOGeneric<T>;
begin
  FDAO.Delete(aObject);
  Result := Self;
end;

destructor TDAOGeneric<T>.Destroy;
begin
  FDataSource.Free;
  Connection.DbConnection.Disconnected(FIndexConn);
  inherited;
end;

function TDAOGeneric<T>.Find(const aID: String; var aObject: T): iDAOGeneric<T>;
begin
  Result := Self;
  aObject := FDAO.Find(StrToInt(aID));
end;

function TDAOGeneric<T>.Find(var aList: TObjectList<T>;limit: integer=20; page: integer=1): iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.Paginate(limit, page).Find(aList);
end;

function TDAOGeneric<T>.Insert(var aObject: T): iDAOGeneric<T>;
begin
  Result := Self;
  FDAO.Insert(aObject);
  aObject := TJson.JsonToObject<T>(FDataSource.DataSet.AsJSONObject);
end;

class function TDAOGeneric<T>.New: iDAOGeneric<T>;
begin
  Result := Self.Create;
end;

function TDAOGeneric<T>.Update(var aObject: T): iDAOGeneric<T>;
begin
  FDAO.Update(aObject);
  Result := Self;
end;

end.
