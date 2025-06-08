/*
@description Gestión de un tablón de Anuncios/Avisos económicos
@author Luis Carrillo Gutiérrez
@date Mayo, 2012
@version 0.0.1
*/

DROP TABLE IF EXISTS [Pedido de Publicación];
CREATE TABLE IF NOT EXISTS [Pedido de Publicación]
(
	[id] INTEGER UNSIGNED NOT NULL,
	[nombre del cliente] TEXT NOT NULL,
	[fecha de contratación] DATETIME NOT NULL,
	PRIMARY KEY ([id])
) WITHOUT RowId;

DROP TABLE IF EXISTS [Aviso Económico];
CREATE TABLE IF NOT EXISTS [Aviso Económico]
(
	[id] INTEGER UNSIGNED NOT NULL, -- int4
	[id pedido de publicación] INTEGER UNSIGNED NOT NULL REFERENCES [Pedido de Publicación](id),
	[fecha de publicación] DATE NOT NULL,
	[contenido] TEXT NOT NULL,
	-- Identificador del servidor de archivos
	[archivo anexo] VARCHAR(128) NOT NULL,
	PRIMARY KEY([id])
) WITHOUT RowId;

-- [n areas, 1 pedido]
-- Categoría
DROP TABLE IF EXISTS [Área de Publicación];
CREATE TABLE IF NOT EXISTS [Área de Publicación]
(
	[id] INTEGER UNSIGNED NOT NULL, -- int4
	[denominación] VARCHAR(32) NOT NULL,
	PRIMARY KEY([id])
) WITHOUT RowId;

-- Categorías por aviso económico
DROP TABLE IF EXISTS [Áreas Por Anuncio];
CREATE TABLE IF NOT EXISTS [Áreas Por Anuncio]
(
	[id del aviso económico] INTEGER UNSIGNED NOT NULL, -- int4
	[id del área de publicación] INTEGER UNSIGNED NOT NULL,
	[estado] CHAR(1) NOT NULL DEFAULT '1', -- Boolean
	PRIMARY KEY('id del aviso económico', 'id del área de publicación')
) WITHOUT RowId;

-- [(n) cobros por pedido]
DROP TABLE IF EXISTS [Cobro por Publicación];
CREATE TABLE IF NOT EXISTS [Cobro por Publicación]
(
	[id] INTEGER UNSIGNED NOT NULL, -- int4
	[id pedido de publicación] INTEGER UNSIGNED NOT NULL REFERENCES [Pedido de Publicación](id),
	[id del pago] INTEGER UNSIGNED NULL, -- int2 / secuencial
	[fecha de pago] DATETIME NOT NULL,
	[abono] INTEGER UNSIGNED NOT NULL,
	[descuento] INTEGER UNSIGNED NOT NULL,
	PRIMARY KEY ([id]),
	UNIQUE ('id pedido de publicación')
) WITHOUT RowId;
