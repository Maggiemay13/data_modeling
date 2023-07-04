-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [region] (
    [region_id] int  NOT NULL ,
    [region-name] string  NOT NULL ,
    CONSTRAINT [PK_region] PRIMARY KEY CLUSTERED (
        [region_id] ASC
    )
)

CREATE TABLE [posts] (
    [title] string  NOT NULL ,
    [text] string  NOT NULL ,
    [user_name] string  NOT NULL ,
    [location] string  NOT NULL ,
    [region_id] int  NOT NULL ,
    [category_id] int  NOT NULL ,
    [user_id] int  NOT NULL 
)

CREATE TABLE [users] (
    [user_id] int  NOT NULL ,
    [user_name] string  NOT NULL ,
    [perfered_region_id] int  NOT NULL ,
    [password] UNIQUE(15)  NOT NULL ,
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED (
        [user_id] ASC
    ),
    CONSTRAINT [UK_users_user_name] UNIQUE (
        [user_name]
    )
)

CREATE TABLE [categories] (
    [category_id] int  NOT NULL ,
    [name] string  NOT NULL ,
    CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED (
        [category_id] ASC
    )
)

ALTER TABLE [region] WITH CHECK ADD CONSTRAINT [FK_region_region_id] FOREIGN KEY([region_id])
REFERENCES [posts] ([region_id])

ALTER TABLE [region] CHECK CONSTRAINT [FK_region_region_id]

ALTER TABLE [posts] WITH CHECK ADD CONSTRAINT [FK_posts_category_id] FOREIGN KEY([category_id])
REFERENCES [categories] ([category_id])

ALTER TABLE [posts] CHECK CONSTRAINT [FK_posts_category_id]

ALTER TABLE [posts] WITH CHECK ADD CONSTRAINT [FK_posts_user_id] FOREIGN KEY([user_id])
REFERENCES [users] ([user_id])

ALTER TABLE [posts] CHECK CONSTRAINT [FK_posts_user_id]

COMMIT TRANSACTION QUICKDBD