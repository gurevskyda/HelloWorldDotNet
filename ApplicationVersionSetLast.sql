CREATE PROCEDURE [dbo].[ApplicationVersionSetLast]
  @ver varchar(32)
AS
BEGIN
  SET NOCOUNT ON

  declare @lastVer varchar(32) = (select top 1 Number
                                  from ApplicationVersion
                                  order by ID desc)

  if (ISNULL(@ver,'') <> ISNULL(@lastVer,''))
  begin
    insert into ApplicationVersion (Number, Date) values (ISNULL(@ver,''), GETDATE())
  end

END