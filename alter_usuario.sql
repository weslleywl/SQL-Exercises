

ALTER PROCEDURE [dbo].[ALTERAR_USUARIO] 
	@id_usuario int,
	@login varchar(100),
	@id_perfil int,	
	@status bit,
	@email varchar(200),
	@telefone varchar(20),
	@celular varchar(20),
	@nome varchar(200),
	@id_setor int 
AS
	declare @login_existe varchar(100)
	declare @id_aux int
	
BEGIN TRANSACTION
	
	set @login_existe = (select [login] from usuario where id_usuario = @id_usuario)	
	set @id_aux = (select id_usuario from usuario where [login] = @login)

	if (@login_existe <> @login)
		begin
			set @id_aux = (select id_usuario from usuario where [login] = @login)						
		end
	else
		begin
			set @id_aux = null
		end

	if (@id_aux is null)
		begin
			update usuario set [login] = @login, id_perfil = @id_perfil, [status] = @status, telefone = @telefone, celular = @celular, nome = @nome, id_setor = @id_setor
			where id_usuario = @id_usuario
			
			if (@@error <> 0)
				begin	
					set @id_aux = -1
					rollback transaction
				end
			else
			begin
				set @id_aux = @id_usuario
				commit transaction
			end	
		end
		else
			begin
				set @id_aux = -2
			end
	select @id_aux

